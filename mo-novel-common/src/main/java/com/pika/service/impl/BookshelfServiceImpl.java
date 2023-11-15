package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Bookshelf;
import com.pika.mapper.BookshelfMapper;
import com.pika.service.BookshelfService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户书架 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class BookshelfServiceImpl extends ServiceImpl<BookshelfMapper, Bookshelf> implements BookshelfService {

}
