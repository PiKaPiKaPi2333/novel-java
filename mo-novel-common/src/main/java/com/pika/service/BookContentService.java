package com.pika.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.entity.BookContent;

/**
 * <p>
 * 小说章节内容表（mediumtext字段影响性能，从t_book_index表中分离） 服务类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
public interface BookContentService extends IService<BookContent> {
}
