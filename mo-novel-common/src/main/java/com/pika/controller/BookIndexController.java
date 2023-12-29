package com.pika.controller;


import com.pika.common.ResponseDTO;
import com.pika.entity.BookIndex;
import com.pika.service.BookIndexService;
import com.pika.request.BookIndexHistoryRequest;
import com.pika.request.BookIndexQueryRequest;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * <p>
 * 小说目录表 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@RestController
@RequestMapping("/bookindex")
public class BookIndexController {
    @Resource
    private BookIndexService bookIndexService;

    @GetMapping("getList/{bookId}")
    public ResponseDTO listBookIndex(@PathVariable Long bookId)
    {
        return bookIndexService.listBookIndex(bookId);
    }

    //翻页
    @PostMapping("search")
    public ResponseDTO searchBookIndex(@RequestBody BookIndexQueryRequest bookIndexQueryRequest)
    {
        return bookIndexService.searchBookIndex(bookIndexQueryRequest);
    }
    //根据indexId获得内容
    @GetMapping("get/{bookIndexId}/{userId}")
    public ResponseDTO getBookIndex(@PathVariable("bookIndexId") Long bookIndexId,@PathVariable("userId") Long userId){
        return bookIndexService.getBookIndex(bookIndexId,userId);
    }



    @PostMapping("add")
    public ResponseDTO addBookIndex(@Validated @RequestBody BookIndex bookIndex)
    {
/*        bookIndex.setContent(
                bookIndex.getContent()
                .replaceAll("\\n", "<br>")
                .replaceAll("\\s", "&nbsp;")
        );*/
        return bookIndexService.addBookIndex(bookIndex);
//        bookContentService.saveOrUpdate()
    }

    @PostMapping("edit")
    public ResponseDTO editBookIndex(@Validated @RequestBody BookIndex bookIndex)
    {
        return bookIndexService.editBookIndex(bookIndex);
    }

    @GetMapping("delete/{bookIndexId}")
    public ResponseDTO deleteBookIndex(@PathVariable Long bookIndexId)
    {
        return bookIndexService.deleteBookIndex(bookIndexId);
    }
}

