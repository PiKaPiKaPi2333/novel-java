package com.pika.controller;


import com.pika.common.ResponseDTO;
import com.pika.common.ResponseStatus;
import com.pika.entity.Book;
import com.pika.entity.Comment;
import com.pika.request.BookQueryRequest;
import com.pika.service.BookService;
import com.pika.service.CommentService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 小说信息表 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@RestController
@RequestMapping("/book")
public class BookController {
    @Resource
    private BookService bookService;

    @Resource
    private CommentService commentService;

    @GetMapping("getAll")
    public ResponseDTO getAllBook()
    {
        List<Book> books = bookService.list();
        HashMap<String, Object> map = new HashMap<>();
        map.put("total", books.size());
        map.put("items", books);
        return ResponseDTO.succ(map);
    }

    @PostMapping("/search")
    public ResponseDTO searchBook(@RequestBody BookQueryRequest queryParams)
    {
        return bookService.searchBook(queryParams);
    }

    @GetMapping("get/{bookId}")
    public ResponseDTO get(@PathVariable("bookId")Long bookId)
    {
        //增加小说浏览量
        bookService.addVisitCount(bookId, 1L);
        return bookService.selectBookById(bookId);
    }

    @PostMapping("add")
    public ResponseDTO addBook(@Validated @RequestBody Book book)
    {
        bookService.save(book);
        return ResponseDTO.succ("成功添加小说");
    }

    @PostMapping("edit")
    public ResponseDTO editBook(@Validated @RequestBody Book book)
    {
        bookService.updateById(book);
        return ResponseDTO.succ("成功修改小说");
    }

    @GetMapping("delete/{bookId}")
    public ResponseDTO deleteBook(@PathVariable("bookId") Long bookId)
    {
        bookService.removeById(bookId);
        return ResponseDTO.succ("成功删除小说");
    }
    
    @GetMapping("listClickRank")
    public ResponseDTO listClickRank() 
    {
    	List<Book> books=bookService.listclickRank();
    	return ResponseDTO.succ(books);
    }
    
    @GetMapping("listUpdateRank")
    public ResponseDTO listUpdateRank() 
    {
    	List<Book> books=bookService.listupdateRank();
    	return ResponseDTO.succ(books);
    }
    
    @GetMapping("listNewRank")
    public ResponseDTO listNewRank() 
    {
    	List<Book> books=bookService.listnewRank();
    	return ResponseDTO.succ(books);
    }
}

