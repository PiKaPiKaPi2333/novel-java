package com.pika.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Notice;
import com.pika.mapper.NoticeMapper;
import com.pika.service.NoticeService;

@Service
public class NoticeServieImpl extends ServiceImpl<NoticeMapper,Notice> implements NoticeService{

}
