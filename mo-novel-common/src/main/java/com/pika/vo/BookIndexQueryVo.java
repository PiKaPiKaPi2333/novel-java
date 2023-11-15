package com.pika.vo;

import com.pika.common.BaseQuery;
import lombok.Data;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-05
 */
@Data
public class BookIndexQueryVo extends BaseQuery {
//    @NotNull(message = "小说ID不能为空")
    private Long bookId;
    private String title;
    private Byte status;
}
