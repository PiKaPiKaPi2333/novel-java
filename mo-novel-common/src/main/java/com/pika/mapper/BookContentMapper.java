package com.pika.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pika.entity.BookContent;

/**
 * <p>
 * 小说章节内容表（mediumtext字段影响性能，从t_book_index表中分离） Mapper 接口
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
public interface BookContentMapper extends BaseMapper<BookContent> {

}
