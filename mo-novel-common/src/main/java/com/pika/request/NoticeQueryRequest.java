package com.pika.request;

import com.pika.common.BaseQuery;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/29
 */

@Data
@Accessors(chain = true)
public class NoticeQueryRequest extends BaseQuery {
    private String title;
}
