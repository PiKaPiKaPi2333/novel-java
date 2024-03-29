package com.pika.common;

import lombok.*;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-05
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class BaseQuery {
    private Integer page = 1;
    private Integer limit = 10;

    public void setPage(Integer page)
    {
        this.page = page < 0 ? 1 : page;
    }

    public void setLimit(Integer limit)
    {
        this.limit = limit < 0 ? 10 : limit;
    }
}
