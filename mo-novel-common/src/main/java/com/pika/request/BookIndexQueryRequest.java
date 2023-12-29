package com.pika.request;

import com.pika.common.BaseQuery;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-05
 */
@Data
public class BookIndexQueryRequest extends BaseQuery {
    @NotNull(message = "小说ID不能为空")
    private Long bookId;

    @NotNull(message = "小说章节不能为空")
    private Long chapter;

    @NotNull(message = "用户ID不能为空")
    private Long userId;
}
