package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Carousel;
import com.pika.mapper.CarouselMapper;
import com.pika.service.BookSettingService;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/15
 */

@Service
public class BookSettingServiceImpl extends ServiceImpl<CarouselMapper,Carousel> implements BookSettingService {


}