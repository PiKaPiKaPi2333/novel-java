package com.pika.service;

import com.pika.common.ResponseDTO;
import com.pika.entity.Book;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.entity.Comment;
import com.pika.request.BookQueryRequest;

/**
 * <p>
 * 小说信息表 服务类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
public interface BookService extends IService<Book> {
    ResponseDTO searchBook(BookQueryRequest queryParams);

    ResponseDTO selectBookById(Long bookId);

    boolean addVisitCount(Long bookId, Long visitCount);

	List<Book> listclickRank();

	List<Book> listnewRank();

	List<Book> listupdateRank();
}
