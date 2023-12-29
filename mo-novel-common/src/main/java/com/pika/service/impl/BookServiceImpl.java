package com.pika.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pika.common.ResponseDTO;
import com.pika.common.ResponseStatus;
import com.pika.converter.EsEntityConverter;
import com.pika.entity.Book;
import com.pika.entity.Comment;
import com.pika.entity.EsBook;
import com.pika.exception.BusinessException;
import com.pika.mapper.BookMapper;
import com.pika.mapper.CommentMapper;
import com.pika.service.BookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.request.BookQueryRequest;
import lombok.SneakyThrows;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.sort.SortBuilders;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * <p>
 * 小说信息表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {

    @Resource
    private BookMapper bookMapper;

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private ElasticsearchRestTemplate elasticsearchRestTemplate;

    @SneakyThrows
    @Override
    public ResponseDTO searchBook(BookQueryRequest queryParams)
    {

        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();
        if (StringUtils.isNotBlank(queryParams.getKeyword())) {
            boolQueryBuilder.must(QueryBuilders.multiMatchQuery(queryParams.getKeyword(), "title", "authorName"));
        } else {
            boolQueryBuilder.must(QueryBuilders.matchAllQuery());
        }
        if (queryParams.getChannel() != null) {
            boolQueryBuilder.filter(QueryBuilders.matchQuery("channel", queryParams.getChannel()));
        }
        if (queryParams.getCategoryId() != null) {
            boolQueryBuilder.filter(QueryBuilders.matchQuery("categoryId", queryParams.getCategoryId()));
        }
        if (queryParams.getBookStatus() != null) {
            boolQueryBuilder.filter(QueryBuilders.matchQuery("status", queryParams.getBookStatus()));
        }
        if (queryParams.getWordCountMin() != null && queryParams.getWordCountMax() != null) {
            boolQueryBuilder.filter(QueryBuilders.rangeQuery("wordCount").gte(queryParams.getWordCountMin()).lte(queryParams.getWordCountMax()));
        }
        if (queryParams.getUpdateTimeMin() != null) {
            boolQueryBuilder.filter(QueryBuilders.rangeQuery("updateTime").gte(queryParams.getUpdateTimeMin().getTime()));
        }
        NativeSearchQueryBuilder searchQueryBuilder = new NativeSearchQueryBuilder()
                .withQuery(boolQueryBuilder)
                .withSort(SortBuilders.fieldSort(StringUtils.isNotBlank(queryParams.getSort()) ? queryParams.getSort() : "score"))
                .withPageable(PageRequest.of(queryParams.getPage() - 1, queryParams.getLimit()));

        SearchHits<EsBook> searchHits = elasticsearchRestTemplate.search(searchQueryBuilder.build(), EsBook.class);

        List<EsBook> esBookList = new ArrayList<>();
        for (SearchHit<EsBook> hit : searchHits.getSearchHits()) {
            esBookList.add(hit.getContent());
        }


        HashMap<String, Object> map = new HashMap<>();
        map.put("items", EsEntityConverter.toBookList(esBookList));
        map.put("total", searchHits.getTotalHits());

        return ResponseDTO.succ(map);

    }

    @Override
    public ResponseDTO selectBookById(Long bookId)
    {
        Book book = bookMapper.selectById(bookId);
        if (StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
        return ResponseDTO.succ(book);
    }

    @Override
    public boolean addVisitCount(Long bookId, Long visitCount)
    {
        Book book = bookMapper.selectById(bookId);
        if (StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
        book.setVisitCount(book.getVisitCount() + 1);
        bookMapper.updateById(book);
//        将数据存储在redis中
        String key="rank:click";
        redisTemplate.opsForZSet().incrementScore(key,bookId,book.getVisitCount()+1);
        return true;
    }

    
    @Override
    public List<Book> listclickRank(){
//    	QueryWrapper<Book> bookquery=new QueryWrapper<>();
//    	bookquery.orderByDesc("visit_count").last("limit 6");
//    	List<Book> books=bookMapper.selectList(bookquery);
        List<Book> books=new ArrayList<>();
        //从redis读取排名前六名的小说
        String key = "rank:click";
        Set<ZSetOperations.TypedTuple<String>> set = redisTemplate.opsForZSet().reverseRangeWithScores(key, 0, 5);
        JSONArray jsonArray = JSONObject.parseArray(JSONObject.toJSONString(set));
        for(int i = 0, size = jsonArray.size(); i < size; i++) {
            String value= JSONObject.parseObject(jsonArray.get(i).toString()).getString("value");
            Long bookId=Long.parseLong(value);
            books.add(bookMapper.selectById(bookId));
        }
    	return books;
    }
    
    @Override
    public List<Book> listnewRank(){
    	QueryWrapper<Book> bookquery=new QueryWrapper<>();
    	bookquery.orderByDesc("create_time").last("limit 6");
    	List<Book> books=bookMapper.selectList(bookquery);
    	return books;
    }
    
	@Override
    public List<Book> listupdateRank(){
    	QueryWrapper<Book> bookquery=new QueryWrapper<>();
    	bookquery.orderByDesc("update_time").last("limit 6");
    	List<Book> books=bookMapper.selectList(bookquery);
    	return books;
    }



}
