package com.pika.controller;


import com.pika.common.ResponseDTO;
import com.pika.service.BooklistService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 用户书单 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@RestController
@RequestMapping("/booklist")
public class BooklistController {
    @Resource
    private BooklistService booklistService;
    /**
     * 基于协同过滤算法实现的推荐功能
     */
    @GetMapping("/recommendList/{userId}")
    ResponseDTO getRecommendList(@PathVariable("userId") Long userId) {
        return booklistService.getRecommendList(userId);
    }
}

