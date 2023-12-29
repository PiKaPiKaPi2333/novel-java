package com.pika.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pika.common.ResponseDTO;
import com.pika.common.ResponseStatus;
import com.pika.entity.Comment;
import com.pika.service.CommentService;
import com.pika.request.CommentQueryRequest;

import javax.annotation.Resource;

/**
 * <p>
 * 评价表 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-05-01
 */
@RestController
@RequestMapping("/bookcomment")
public class CommentController {
	 @Resource
	 private CommentService commentservice;
	 
	 @GetMapping("search")
	 public ResponseDTO searchComment(CommentQueryRequest queryParams) {
		 return commentservice.searchComment(queryParams);
	 }
	 
	 @PostMapping("add")
	 public ResponseDTO addComment(@RequestBody Comment comment)
	    {
	        commentservice.saveComment(comment);
	        return ResponseDTO.succ("成功添加评论");
	  }

	  @PostMapping("edit")
	  public ResponseDTO editComment(@RequestBody Comment comment){
		  return commentservice.editBookComment(comment);
	  }
	 
	 @GetMapping("delete/{id}")
	 public ResponseDTO deleteBookComment(@PathVariable Long id)
	    {
	        commentservice.removeById(id);
	        return ResponseDTO.succ(ResponseStatus.SUCCESS.getMsg());
	    }
	 
}

