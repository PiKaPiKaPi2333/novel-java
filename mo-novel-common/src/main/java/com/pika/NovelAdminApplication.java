package com.pika;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.pika.mapper")
public class NovelAdminApplication {
    public static void main(String[] args)
    {
        SpringApplication.run(NovelAdminApplication.class);
    }
}
