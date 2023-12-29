package com.pika.request;

import com.pika.common.BaseQuery;

import lombok.Data;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-06
 */

@Data
public class BookshelfQueryRequest extends BaseQuery {
    private Long userId;
    private Byte readingProcess;
    private Long bookId;
}
