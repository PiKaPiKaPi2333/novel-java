package com.pika.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pika.common.ResponseDTO;
import com.pika.entity.Book;
import com.pika.entity.BookIndex;
import com.pika.mapper.BookIndexMapper;
import com.pika.mapper.BookMapper;
import com.pika.request.BookIndexHistoryRequest;
import com.pika.response.BookHistoryResponse;
import com.pika.service.BookHistoryService;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/20
 */

@Service
public class BookHistoryServiceImpl implements BookHistoryService {

    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private BookMapper bookMapper;

    @Resource
    private BookIndexMapper bookIndexMapper;

    private static final String REDIS_KEY_PREFIX="read:history:";

    @Override
    public ResponseDTO listBookHistory(Long userId) {
        List<BookHistoryResponse> bookHistoryResponses =new ArrayList<>();
        Set<ZSetOperations.TypedTuple<Long>> bookIdsWithScore= redisTemplate.opsForZSet().reverseRangeWithScores(REDIS_KEY_PREFIX+userId, 0, -1);
        for (ZSetOperations.TypedTuple<Long> tuple : bookIdsWithScore) {
            // 获取到小说ID
            Long bookId = tuple.getValue();
            // 获取到小说的访问时间
            Double score = tuple.getScore();
            //获取小说看到哪一章节
            Map<Long,Long> indexMap = redisTemplate.opsForHash().entries(REDIS_KEY_PREFIX + "index:" + userId);
            Long bookIndexId=indexMap.get(bookId);
            //获取阅读进度（百分制）
            BookIndex bookIndex = bookIndexMapper.selectById(bookIndexId);
            Integer progress = (int) (bookIndex.getChapter() * 100.0 / bookIndexMapper.selectCount(new QueryWrapper<BookIndex>().eq("book_id", bookId)));
            //将时间戳改为yyyy-MM-dd HH:mm:ss格式
            String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(score.longValue()));
            BookHistoryResponse bookHistoryResponse = new BookHistoryResponse();
            bookHistoryResponse.setBook(bookMapper.selectById(bookId));
            bookHistoryResponse.setBookIndex(bookIndexMapper.selectById(bookIndex));
            bookHistoryResponse.setDate(date);
            bookHistoryResponse.setProgress(progress);;
            //将bookHistoryResponse存入list中
            bookHistoryResponses.add(bookHistoryResponse);
        }
        return ResponseDTO.succ(bookHistoryResponses);

    }


    @Override
    public void setReadHistory(BookIndexHistoryRequest bookIndexHistoryRequest) {
        Long timestamp = System.currentTimeMillis();
        Long readerId= bookIndexHistoryRequest.getUserId();
        Long bookId = bookIndexHistoryRequest.getBookId();
        Long bookIndexId=bookIndexHistoryRequest.getBookIndexId();
        redisTemplate.opsForZSet().add(REDIS_KEY_PREFIX + readerId,  bookId,timestamp);
        // 向redis中的hash表存储小说ID和目录ID
        redisTemplate.opsForHash().put(REDIS_KEY_PREFIX + "index:" + readerId, bookId, bookIndexId);

    }

    @Override
    public ResponseDTO deleteBookHistory(BookIndexHistoryRequest bookIndexHistoryRequest) {
        Long  readerId= bookIndexHistoryRequest.getUserId();
        Long  bookId = bookIndexHistoryRequest.getBookId();
        redisTemplate.opsForZSet().remove(REDIS_KEY_PREFIX + readerId, bookId);
        redisTemplate.opsForHash().delete(REDIS_KEY_PREFIX + "index:" + readerId, bookId);
        return ResponseDTO.succ("删除成功");
    }

    /**
     * 用于协同过滤算法来进行推荐
     * @param userId
     * @return
     */
    @Override
    public List<Book> listUserReadHistory(Long userId) {
        Set<Long> bookIds= redisTemplate.opsForZSet().range(REDIS_KEY_PREFIX+userId, 0, -1);
        List<Book> books=new ArrayList<>();
        if(bookIds.size()>0){
            books.addAll(bookMapper.selectList(new QueryWrapper<Book>().in("id",bookIds)));
        }

        return books;
    }

    @Override
    public ResponseDTO clearBookHistory(Long userId) {
        redisTemplate.delete(REDIS_KEY_PREFIX + userId); // 清除小说记录
        redisTemplate.delete(REDIS_KEY_PREFIX + "index:" + userId); // 清除章节记录
        return ResponseDTO.succ("清除成功");
    }
}
