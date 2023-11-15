package com.pika.controller;


import com.pika.common.ResponseDTO;
import com.pika.entity.BookIndex;
import com.pika.service.BookIndexService;
import com.pika.vo.BookIndexQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
    @Autowired
    private BookIndexService bookIndexService;

    @GetMapping("search")
    public ResponseDTO searchBookIndex(BookIndexQueryVo bookIndexQueryVo)
    {
        return bookIndexService.searchBookIndex(bookIndexQueryVo);
    }

    @GetMapping("get/{bookIndexId}")
    public ResponseDTO getBookIndex(@PathVariable Long bookIndexId)
    {
        return bookIndexService.getBookIndex(bookIndexId);
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

