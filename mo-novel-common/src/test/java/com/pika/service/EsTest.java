package com.pika.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pika.controller.BookController;
import com.pika.controller.EsController;
import com.pika.converter.EsEntityConverter;
import com.pika.entity.*;

import com.pika.mapper.BookIndexMapper;
import com.pika.mapper.BookMapper;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;


import javax.annotation.Resource;
import java.io.Console;
import java.util.List;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/21
 */

@SpringBootTest
public class EsTest {

    @Resource
    private EsController esController;

    @Resource
    private BookMapper bookMapper;

    @Resource
    private BookIndexMapper bookIndexMapper;

    @Resource
    private ElasticsearchRestTemplate elasticsearchRestTemplate;

    /**
     * 创建索引
     */
    @Test
    public void createIndexAndMapping(){
        esController.createIndex(EsBook.class);
//        esController.createIndex(EsContent.class);
    }

    /**
     * 初始化数据
     */
    @Test
    public void saveBookListEs(){
        QueryWrapper<Book> queryWrapper=new QueryWrapper<>();
        queryWrapper.orderByDesc("update_time");
        List<Book> bookList=bookMapper.selectList(queryWrapper);
        elasticsearchRestTemplate.save(EsEntityConverter.toEsBookList(bookList));
    }
    @Test
    public void saveBookContentEs(){
        List<BookIndex> bookIndexs= bookIndexMapper.selectList(null);
        elasticsearchRestTemplate.save(EsEntityConverter.toEsContentList(bookIndexs));
    }






}
