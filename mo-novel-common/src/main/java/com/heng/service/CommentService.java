package com.heng.service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.heng.common.ResponseDTO;
import com.heng.entity.Comment;
import com.heng.vo.CommentQueryVo;

/**
 * <p>
 * 评价表 服务类
 * </p>
 *
 * @author LJohn
 * @since 2021-05-01
 */
public interface CommentService extends IService<Comment> {

	ResponseDTO searchComment(CommentQueryVo queryParams);

	void saveComment(Comment comment);

	boolean existsBookComment(Comment comment);

	ResponseDTO editBookComment(Long commentId, String content);
}
