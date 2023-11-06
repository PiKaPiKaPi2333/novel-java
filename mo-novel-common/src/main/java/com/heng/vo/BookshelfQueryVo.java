package com.heng.vo;

import com.heng.common.BaseQuery;

import lombok.Data;

/**
 * @author LJohn
 * @since 2021-05-06
 */

@Data
public class BookshelfQueryVo extends BaseQuery {
    private Long userId;
    private Byte readingProcess;
    private Long bookId;
}