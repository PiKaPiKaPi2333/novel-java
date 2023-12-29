package com.pika.service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/15
 */

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import javax.annotation.Resource;

@SpringBootTest
class Springboot09RedisApplicationTests {


    @Resource
    private RedisTemplate redisTemplate;


    @Test
    void firstTest() {
        redisTemplate.opsForValue().set("name","pika");
        String name = (String) redisTemplate.opsForValue().get("name");
        System.out.println(name);

    }



}
