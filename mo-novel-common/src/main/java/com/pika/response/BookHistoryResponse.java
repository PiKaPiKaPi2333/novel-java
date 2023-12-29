package com.pika.response;

import com.pika.entity.Book;
import com.pika.entity.BookIndex;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/21
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookHistoryResponse {
    private Book book;

    private BookIndex bookIndex;

    private String date;

    private Integer progress;

}
