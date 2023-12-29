package com.pika.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.pika.common.ResponseDTO;
import com.pika.common.ResponseStatus;
import com.pika.entity.Bookshelf;
import com.pika.service.BookshelfService;
import com.pika.request.BookshelfQueryRequest;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 用户书架 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@RestController
@RequestMapping("/bookshelf")
public class BookshelfController {
    @Resource
    private BookshelfService bookshelfService;

    @PostMapping("add")
    public ResponseDTO addBookshelf(@Validated @RequestBody Bookshelf bookshelf)
    {
        bookshelfService.saveOrUpdate(bookshelf);
        return ResponseDTO.succ("成功加入书架");
    }

    @GetMapping("delete/{bookshelfId}")
    public ResponseDTO deleteBookshelf(@PathVariable Long bookshelfId)
    {
        bookshelfService.removeById(bookshelfId);
        return ResponseDTO.succ("成功移除");
    }

    @PostMapping("edit")
    public ResponseDTO editBookshelf(@Validated @RequestBody Bookshelf bookshelf)
    {
        bookshelfService.updateById(bookshelf);
        return ResponseDTO.succ(ResponseStatus.SUCCESS.getMsg());
    }

    @GetMapping("list")
    public ResponseDTO BookshelfList(@PathVariable Long userId)
    {
        HashMap<String, Object> map = new HashMap<>();
        map.put("user_id", userId);
        List<Bookshelf> bookshelves = bookshelfService.listByMap(map);
        return ResponseDTO.succ(bookshelves);
    }
    
    @GetMapping("search")
    public ResponseDTO searchBookshelf(BookshelfQueryRequest bookshelfqueryvo)
    {
    	Long userId=bookshelfqueryvo.getUserId();
    	Long bookId=bookshelfqueryvo.getBookId();
    	QueryWrapper<Bookshelf> bookshelfquery=new QueryWrapper<>();
    	bookshelfquery.eq(StringUtils.checkValNotNull(userId),"user_id", userId)
    				  .eq(StringUtils.checkValNotNull(bookId),"book_id", bookId);
        List<Bookshelf> bookshelves = bookshelfService.list(bookshelfquery);
        return ResponseDTO.succ(bookshelves);
    }

    
}

