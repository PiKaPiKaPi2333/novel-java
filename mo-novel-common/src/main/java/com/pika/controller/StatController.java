package com.pika.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.pika.service.BookService;
import com.pika.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 后台数据统计
 * @Author yuxin.qiu
 * @Date 2023/12/29
 */

@RestController
@RequestMapping("/stat")
public class StatController {

    @Resource
    private UserService userService;

    @Resource
    private BookService bookService;

    @GetMapping("/fanSta")
    public ResponseDTO fanSta(){

        Map<String,Object> res=new HashMap();
        //总小说类型占比
//        res.put("categoryCountOfBook",);
        //用户收藏类型占比
//        res.put("categoryCountOfBookshelf",);
        return ResponseDTO.succ(res);


    }

    @GetMapping("/countSta")
    public ResponseDTO countSta(){
        Map<String,Object> res=new HashMap();
        res.put("userCount",userService.count(new QueryWrapper<>()));
        res.put("bookCount",bookService.count(new QueryWrapper<>()));
        return ResponseDTO.succ(res);
    }
}
