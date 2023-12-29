package com.pika.controller;

import com.pika.entity.EsBook;
import com.pika.service.EsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/22
 */

@RestController
@RequestMapping("/elasticSearch")
public class EsController {
    @Resource
    private EsService esService;

    @PostMapping("/createIndex")
    public boolean createIndex(Class<?> classType) {
        return esService.createIndex(classType);
    }

    @PostMapping("/saveList")
    public Iterable save(@RequestBody Iterable entities){
        return esService.save(entities);
    }
}
