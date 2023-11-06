package com.heng.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.heng.common.ResponseDTO;
import com.heng.common.ResponseStatus;
import com.heng.entity.Bookshelf;
import com.heng.service.BookshelfService;
import com.heng.vo.BookshelfQueryVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户书架 前端控制器
 * </p>
 *
 * @author LJohn
 * @since 2021-04-25
 */
@RestController
@RequestMapping("/bookshelf")
public class BookshelfController {
    @Autowired
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
    public ResponseDTO searchBookshelf(BookshelfQueryVo bookshelfqueryvo)
    {
    	Long userId=bookshelfqueryvo.getUserId();
    	Long bookId=bookshelfqueryvo.getBookId();
    	QueryWrapper<Bookshelf> bookshelfquery=new QueryWrapper<>();
    	bookshelfquery.eq(StringUtils.checkValNotNull(userId),"user_id", userId)
    				  .eq(StringUtils.checkValNotNull(bookId),"book_id", bookId);
        List<Bookshelf> bookshelves = bookshelfService.list(bookshelfquery);
        return ResponseDTO.succ(bookshelves);
    }

    @GetMapping("getRecommandBooks")
    public ResponseDTO getRecommandBooks(@PathVariable Long userId){
        //基于协同过滤算法实现
        return null;
    }
    
}

