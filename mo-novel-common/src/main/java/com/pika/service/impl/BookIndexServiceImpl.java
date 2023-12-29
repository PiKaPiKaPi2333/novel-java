package com.pika.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.common.ResponseDTO;
import com.pika.converter.EsEntityConverter;
import com.pika.entity.Book;
import com.pika.entity.BookContent;
import com.pika.entity.BookIndex;
import com.pika.entity.EsContent;
import com.pika.exception.BusinessException;
import com.pika.mapper.BookContentMapper;
import com.pika.mapper.BookIndexMapper;
import com.pika.mapper.BookMapper;
import com.pika.service.BookHistoryService;
import com.pika.service.BookIndexService;
import com.pika.util.MStringUtil;
import com.pika.request.BookIndexHistoryRequest;
import com.pika.request.BookIndexQueryRequest;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.IndexQuery;
import org.springframework.data.elasticsearch.core.query.IndexQueryBuilder;
import org.springframework.data.elasticsearch.core.query.UpdateQuery;
import org.springframework.data.elasticsearch.core.query.UpdateResponse;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 小说目录表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class BookIndexServiceImpl extends ServiceImpl<BookIndexMapper, BookIndex> implements BookIndexService {
    @Resource
    private BookMapper bookMapper;

    @Resource
    private BookIndexMapper bookIndexMapper;

    @Resource
    private BookHistoryService bookHistoryService;

    @Resource
    private ElasticsearchRestTemplate elasticsearchRestTemplate;

    //todo 需要添加创作小说功能
    @Override
    @Transactional
    public ResponseDTO addBookIndex(BookIndex bookIndex)
    {
        int wordCount = MStringUtil.getStrValidWordCount(bookIndex.getContent());

        // 更新小说信息表
        Book book = bookMapper.selectById(bookIndex.getBookId());
        if(StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
        book.setWordCount(book.getWordCount() + wordCount);
        bookMapper.updateById(book);

        // 更新小说目录表
        bookIndex.setWordCount(Long.valueOf(wordCount));
        Integer bookIndexCount=bookIndexMapper.selectCount(new QueryWrapper<BookIndex>().eq("book_id", bookIndex.getBookId()));
        bookIndex.setChapter(bookIndexCount+1);
        bookIndexMapper.insert(bookIndex);

        // 更新小说内容表(es)
        elasticsearchRestTemplate.save(EsEntityConverter.toEsContent(bookIndex));

        return ResponseDTO.succ("成功添加小说章节");
    }

    @Override
    @Transactional
    public ResponseDTO deleteBookIndex(Long bookIndexId)
    {
        BookIndex bookIndex = bookIndexMapper.selectById(bookIndexId);
        if(StringUtils.checkValNull(bookIndex)) throw new BusinessException("小说章节不存在");

        Long wordCount = bookIndex.getWordCount();
        // 更新目录表和内容表(外键)
        bookIndexMapper.deleteById(bookIndexId);

        // 更新小说信息表
        Book book = bookMapper.selectById(bookIndex.getBookId());
        book.setWordCount(book.getWordCount() - wordCount);
        bookMapper.updateById(book);

        //删除es中的这条数据
        elasticsearchRestTemplate.delete(bookIndexId.toString(), EsContent.class);

        return ResponseDTO.succ("小说章节删除成功");
    }

    @Override
    @Transactional
    public ResponseDTO editBookIndex(BookIndex bookIndex)
    {
        BookIndex oldBookIndex = bookIndexMapper.selectById(bookIndex.getId());
        if(StringUtils.checkValNull(oldBookIndex)) throw new BusinessException("小说章节不存在");

        Long wordCount = Long.valueOf(MStringUtil.getStrValidWordCount(bookIndex.getContent()));

        // 更新小说信息表
        Book book = bookMapper.selectById(oldBookIndex.getBookId());
        if(StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
        book.setWordCount(book.getWordCount() + wordCount - oldBookIndex.getWordCount());
        bookMapper.updateById(book);

        // 更新小说目录表
        bookIndex.setBookId(oldBookIndex.getBookId());
        bookIndex.setWordCount(wordCount);
        bookIndexMapper.updateById(bookIndex);

        // es更新小说内容表

        IndexCoordinates indexCoordinates=IndexCoordinates.of("rice_novel_content");
        IndexQuery indexQuery=new IndexQueryBuilder()
                .withId(bookIndex.getId().toString())
                .withObject(EsEntityConverter.toEsContent(bookIndex))
                .build();
        elasticsearchRestTemplate.save(indexQuery,indexCoordinates);

        UpdateQuery.Builder builder = UpdateQuery.builder(bookIndex.getId().toString())
                .withDocument(org.springframework.data.elasticsearch.core.document.Document.from(BeanUtil.beanToMap(EsEntityConverter.toEsContent(bookIndex))));
        IndexCoordinates of = IndexCoordinates.of(EsContent.class.getAnnotation(Document.class).indexName());
        elasticsearchRestTemplate.update(builder.build(), of);

        return ResponseDTO.succ("成功更新小说章节");
    }

    @Override
    public ResponseDTO listBookIndex(Long bookId)
    {
        QueryWrapper queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("book_id", bookId);
        queryWrapper.orderByAsc("chapter");
        List<BookIndex> bookIndexList = bookIndexMapper.selectList(queryWrapper);

        HashMap<String, Object> map = new HashMap<>();
        map.put("items", bookIndexList);
        map.put("total", bookIndexList.size());
        return ResponseDTO.succ(map);
    }

    @Override
    public ResponseDTO searchBookIndex(BookIndexQueryRequest bookIndexQueryRequest)
    {
        List<BookIndex> bookIndexIds=bookIndexMapper.selectList(new QueryWrapper<BookIndex>().eq("book_id", bookIndexQueryRequest.getBookId()).eq("chapter",bookIndexQueryRequest.getChapter()));
        BookIndex bookIndex=bookIndexIds.get(0);
        Long bookIndexId=bookIndex.getId();

        //从es中获取bookContent
        EsContent esContent=elasticsearchRestTemplate.get(bookIndexId.toString(), EsContent.class);
        if(StringUtils.checkValNull(esContent)) throw new BusinessException("该小说章节不存在");
        bookIndex.setContent(esContent.getContent());

        //新增历史记录
        bookHistoryService.setReadHistory(BookIndexHistoryRequest.builder()
                .bookId(bookIndex.getBookId())
                .bookIndexId(bookIndexId)
                .userId(bookIndexQueryRequest.getUserId()).build());
        return ResponseDTO.succ(bookIndex);
    }

    @Override
    public ResponseDTO getBookIndex(Long bookIndexId,Long userId) {
        BookIndex bookIndex=bookIndexMapper.selectById(bookIndexId);
        //从es中获取bookContent
        EsContent esContent=elasticsearchRestTemplate.get(bookIndexId.toString(), EsContent.class);
        if(StringUtils.checkValNull(esContent)) throw new BusinessException("该小说章节不存在");
        bookIndex.setContent(esContent.getContent());

        //新增历史记录
        bookHistoryService.setReadHistory(BookIndexHistoryRequest.builder()
                .bookId(bookIndex.getBookId())
                .bookIndexId(bookIndexId)
                .userId(userId).build());
        return ResponseDTO.succ(bookIndex);
    }


}
