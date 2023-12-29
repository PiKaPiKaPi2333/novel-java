package com.pika.controller;

import com.pika.common.ResponseDTO;
import com.pika.entity.Carousel;
import com.pika.service.CarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/15 
 */

@RestController
@RequestMapping("/carousel")
public class CarouselController {
    @Resource
    private CarouselService carouselService;

    @GetMapping("getList")
    public ResponseDTO getAllBookSetting()
    {
        List<Carousel> carouselList= carouselService.list();
        return ResponseDTO.succ(carouselList);
    }
}
