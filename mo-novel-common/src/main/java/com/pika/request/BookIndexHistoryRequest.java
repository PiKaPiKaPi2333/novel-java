package com.pika.request;

import com.pika.common.BaseQuery;
import lombok.*;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/20
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class BookIndexHistoryRequest extends BaseQuery {
    private Long bookId;

    private Long bookIndexId;

    private Long userId;
}
