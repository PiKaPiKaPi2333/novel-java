package com.pika.controller;

import com.pika.common.ResponseDTO;
import com.pika.request.BookIndexHistoryRequest;
import com.pika.service.BookHistoryService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 读者阅读的历史记录
 * @Author PIKAPIKAPI
 * @Date 2023/11/20
 */

@RestController
@RequestMapping("/book-history")
public class BookHistoryController {

    @Resource
    private BookHistoryService bookHistoryService;
    @GetMapping("/list/{userId}")
    public ResponseDTO listBookHistory(@PathVariable Long userId)
    {
        return bookHistoryService.listBookHistory(userId);
    }

    @GetMapping("/delete")
    public ResponseDTO deleteBookHistory(@RequestBody BookIndexHistoryRequest bookIndexHistoryRequest){
    return bookHistoryService.deleteBookHistory(bookIndexHistoryRequest);
    }

    @GetMapping("/clear/{userId}")
    public ResponseDTO clearBookHistory(@PathVariable Long userId){
        return bookHistoryService.clearBookHistory(userId);
    }
}
