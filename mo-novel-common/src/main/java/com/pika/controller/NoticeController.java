package com.pika.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pika.common.ResponseDTO;
import com.pika.entity.Notice;
import com.pika.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService noticeservice;
	@GetMapping("search")
	public ResponseDTO listNotice() {
		QueryWrapper<Notice> queryWrapper=new QueryWrapper<>();
		queryWrapper.orderByAsc("create_time").last("limit 5");
		List<Notice> notices=noticeservice.list(queryWrapper);
		return ResponseDTO.succ(notices);
	}

}
