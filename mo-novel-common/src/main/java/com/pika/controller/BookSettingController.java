package com.pika.controller;

import com.pika.common.ResponseDTO;
import com.pika.entity.Book;
import com.pika.entity.Bookshelf;
import com.pika.entity.Carousel;
import com.pika.service.BookSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/15 
 */

@RestController
@RequestMapping("/bookSetting")
public class BookSettingController {
    @Autowired
    private BookSettingService bookSettingService;

    @GetMapping("getAll")
    public ResponseDTO getAllBookSetting()
    {
        List<Carousel> carouselList=bookSettingService.list();
        return ResponseDTO.succ(carouselList);
    }
}
