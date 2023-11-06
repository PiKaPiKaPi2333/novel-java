package com.heng.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.heng.entity.Notice;
import com.heng.mapper.NoticeMapper;
import com.heng.service.NoticeService;

@Service
public class NoticeServieImpl extends ServiceImpl<NoticeMapper,Notice> implements NoticeService{

}
