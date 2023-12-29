package com.pika.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pika.common.ResponseDTO;
import com.pika.request.NoticeQueryRequest;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Notice;
import com.pika.mapper.NoticeMapper;
import com.pika.service.NoticeService;

import javax.annotation.Resource;
import java.util.HashMap;

@Service
public class NoticeServieImpl extends ServiceImpl<NoticeMapper,Notice> implements NoticeService{

    @Resource
    private NoticeMapper noticeMapper;
    @Override
    public ResponseDTO pageNotice(NoticeQueryRequest noticeQueryRequest) {
        QueryWrapper<Notice> noticeQueryWrapper=new QueryWrapper<>();
        if(noticeQueryRequest.getTitle()!=null){
            noticeQueryWrapper.like("title",noticeQueryRequest.getTitle());
        }
        Page<Notice> noticePage=new Page<>(noticeQueryRequest.getPage(),noticeQueryRequest.getLimit());
        noticeMapper.selectPage(noticePage,noticeQueryWrapper);

        HashMap<String, Object> map = new HashMap<>();
        map.put("items",noticePage.getRecords());
        map.put("total", noticePage.getTotal());
        return ResponseDTO.succ(map);
    }
}
