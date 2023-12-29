package com.pika.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.common.ResponseDTO;
import com.pika.entity.Notice;
import com.pika.request.NoticeQueryRequest;

public interface NoticeService extends IService<Notice> {

    ResponseDTO pageNotice(NoticeQueryRequest noticeQueryRequest);
}
