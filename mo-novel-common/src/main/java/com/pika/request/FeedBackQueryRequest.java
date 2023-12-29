package com.pika.request;

import com.pika.common.BaseQuery;
import lombok.Data;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/28
 */
@Data
public class FeedBackQueryRequest extends BaseQuery {
    private Long userId;

    private byte done;
}
