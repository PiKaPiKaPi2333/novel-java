package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.common.ResponseDTO;
import com.pika.entity.Booklist;
import com.pika.entity.Book;
import com.pika.mapper.BooklistMapper;
import com.pika.service.BookService;
import com.pika.service.BooklistService;
import com.pika.util.RecommendUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 用户书单 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class BooklistServiceImpl extends ServiceImpl<BooklistMapper, Booklist> implements BooklistService {

    @Resource
    private RecommendUtil recommendUtil;

    @Resource
    private BookService bookService;

    @Override
    public ResponseDTO getRecommendList(Long userId) {
        List<Book> recommendList= recommendUtil.recommend(userId);
        //如果没有推荐的书，就推送新书
        if(recommendList.isEmpty()){
            recommendList=bookService.listupdateRank().subList(0,4);
        }
        return ResponseDTO.succ(recommendList);
    }
}
