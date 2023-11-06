package com.heng.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.heng.common.ResponseDTO;
import com.heng.common.ResponseStatus;
import com.heng.entity.Book;
import com.heng.entity.Bookshelf;
import com.heng.entity.Comment;
import com.heng.service.CommentService;
import com.heng.vo.CommentQueryVo;

/**
 * <p>
 * 评价表 前端控制器
 * </p>
 *
 * @author LJohn
 * @since 2021-05-01
 */
@RestController
@RequestMapping("/bookcomment")
public class CommentController {
	 @Autowired
	 private CommentService commentservice;
	 
	 @GetMapping("search")
	 public ResponseDTO searchComment(CommentQueryVo queryParams) {
		 return commentservice.searchComment(queryParams);
	 }
	 
	 @PostMapping("add")
	 public ResponseDTO addComment(@RequestBody Comment comment)
	    {
	        commentservice.saveComment(comment);
	        return ResponseDTO.succ("成功添加评论");
	  }
	 
	 @GetMapping("delete/{id}")
	 public ResponseDTO deleteBookComment(@PathVariable Long id)
	    {
	        commentservice.removeById(id);
	        return ResponseDTO.succ(ResponseStatus.SUCCESS.getMsg());
	    }
	 
}

