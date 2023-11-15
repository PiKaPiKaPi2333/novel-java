package com.pika.vo;

import com.pika.common.BaseQuery;

import lombok.Data;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-06
 */

@Data
public class BookshelfQueryVo extends BaseQuery {
    private Long userId;
    private Byte readingProcess;
    private Long bookId;
}
