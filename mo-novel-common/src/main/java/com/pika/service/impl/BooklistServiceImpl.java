package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Booklist;
import com.pika.mapper.BooklistMapper;
import com.pika.service.BooklistService;
import org.springframework.stereotype.Service;

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

}
