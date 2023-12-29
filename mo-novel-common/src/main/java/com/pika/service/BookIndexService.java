package com.pika.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.common.ResponseDTO;
import com.pika.entity.BookIndex;
import com.pika.request.BookIndexHistoryRequest;
import com.pika.request.BookIndexQueryRequest;

/**
 * <p>
 * 小说目录表 服务类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
public interface BookIndexService extends IService<BookIndex> {
    ResponseDTO addBookIndex(BookIndex bookIndex);

    ResponseDTO deleteBookIndex(Long bookIndexId);

    ResponseDTO editBookIndex(BookIndex bookIndex);

    ResponseDTO searchBookIndex(BookIndexQueryRequest bookIndexQueryRequest);

    ResponseDTO getBookIndex(Long bookIndexId,Long userId);

    ResponseDTO listBookIndex(Long bookId);
}
