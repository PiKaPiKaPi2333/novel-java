package com.pika.service;


import com.pika.common.ResponseDTO;
import com.pika.entity.Book;
import com.pika.request.BookIndexHistoryRequest;
import com.pika.response.BookHistoryResponse;

import java.util.List;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/20
 */

public interface BookHistoryService {
    ResponseDTO listBookHistory(Long userId);

    void setReadHistory(BookIndexHistoryRequest bookIndexHistoryRequest);

    ResponseDTO deleteBookHistory(BookIndexHistoryRequest bookIndexHistoryRequest);

    List<Book> listUserReadHistory(Long userId);

    ResponseDTO clearBookHistory(Long userId);
}
