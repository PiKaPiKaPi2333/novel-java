package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.BookContent;
import com.pika.mapper.BookContentMapper;
import com.pika.service.BookContentService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 小说章节内容表（mediumtext字段影响性能，从t_book_index表中分离） 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class BookContentServiceImpl extends ServiceImpl<BookContentMapper, BookContent> implements BookContentService {

}
