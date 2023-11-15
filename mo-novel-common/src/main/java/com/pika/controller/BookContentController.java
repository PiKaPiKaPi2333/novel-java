package com.pika.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 小说章节内容表（mediumtext字段影响性能，从t_book_index表中分离） 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@RestController
@RequestMapping("/book-content")
public class BookContentController {
}

