package com.pika.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.common.ResponseDTO;
import com.pika.entity.Comment;
import com.pika.vo.CommentQueryVo;

/**
 * <p>
 * 评价表 服务类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-05-01
 */
public interface CommentService extends IService<Comment> {

	ResponseDTO searchComment(CommentQueryVo queryParams);

	void saveComment(Comment comment);

	boolean existsBookComment(Comment comment);

	ResponseDTO editBookComment(Long commentId, String content);
}
