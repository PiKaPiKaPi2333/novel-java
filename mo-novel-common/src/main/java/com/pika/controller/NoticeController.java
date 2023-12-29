package com.pika.controller;

import java.util.List;

import com.pika.request.NoticeQueryRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pika.common.ResponseDTO;
import com.pika.entity.Notice;
import com.pika.service.NoticeService;

import javax.annotation.Resource;

@RestController
@RequestMapping("/notice")
public class NoticeController {
	@Resource
	private NoticeService noticeservice;
	@GetMapping("/search")
	public ResponseDTO listNotice() {
		QueryWrapper<Notice> queryWrapper=new QueryWrapper<>();
		queryWrapper.orderByAsc("create_time").last("limit 5");
		List<Notice> notices=noticeservice.list(queryWrapper);
		return ResponseDTO.succ(notices);
	}

	@PostMapping("/page")
	public ResponseDTO pageNotice(@RequestBody NoticeQueryRequest noticeQueryRequest) {

		return noticeservice.pageNotice(noticeQueryRequest);
	}

	@PostMapping("/add")
	public ResponseDTO addNotice(@Validated @RequestBody Notice notice) {
		noticeservice.save(notice);
        return ResponseDTO.succ("发布成功");
	}

	@PostMapping("/edit")
	public  ResponseDTO editNotice(@Validated @RequestBody Notice notice) {
		noticeservice.updateById(notice);
		return ResponseDTO.succ("更新成功");
	}

	@GetMapping("/delete/{id}")
	public ResponseDTO deleteNotice(@PathVariable("id")Long id){
		noticeservice.removeById(id);
		return ResponseDTO.succ("删除成功");
	}

	@GetMapping("/get/{id}")
	public ResponseDTO getNotice(@PathVariable("id")Long id){
		Notice notice=noticeservice.getById(id);
		return ResponseDTO.succ(notice);
	}



}
