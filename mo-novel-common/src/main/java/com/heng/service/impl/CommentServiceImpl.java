package com.heng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.heng.common.ResponseDTO;
import com.heng.common.ResponseStatus;
import com.heng.entity.Book;
import com.heng.entity.Comment;
import com.heng.exception.BusinessException;
import com.heng.mapper.BookMapper;
import com.heng.mapper.CommentMapper;
import com.heng.service.CommentService;
import com.heng.vo.CommentQueryVo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评价表 服务实现类
 * </p>
 *
 * @author LJohn
 * @since 2021-05-01
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
	@Autowired
	   private CommentMapper commentMapper;
	@Autowired
		private BookMapper bookMapper;
	@Override
	public ResponseDTO searchComment(CommentQueryVo queryParams) {
		QueryWrapper<Comment> commentQueryWrapper=new QueryWrapper<>();
		commentQueryWrapper.eq(StringUtils.checkValNotNull(queryParams.getResourceId()),"resource_id",queryParams.getResourceId());
		Page<Comment> commentPage = new Page<>(queryParams.getPage(), queryParams.getLimit());
        commentMapper.selectPage(commentPage, commentQueryWrapper);
        HashMap<String, Object> map = new HashMap<>();
        map.put("items", commentPage.getRecords());
        map.put("total", commentPage.getTotal());
        return ResponseDTO.succ(map);
	}
	
	@Override
	public void saveComment(Comment comment) {
		 Book book = bookMapper.selectById(comment.getResourceId());
	        if(StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
	        comment.setResourceType((byte) 1);
	        commentMapper.insert(comment);
	}
	

    @Override
    public ResponseDTO editBookComment(Long commentId, String content)
    {
        Comment comment = commentMapper.selectById(commentId);
        comment.setContent(content);
        commentMapper.updateById(comment);

        return ResponseDTO.succ(ResponseStatus.SUCCESS.getMsg());
    }

	@Override
    public boolean existsBookComment(Comment comment)
    {
        HashMap<String, Object> map = new HashMap<>();
        map.put("resource_type", comment.getResourceType());
        map.put("resource_id", comment.getResourceId());
        map.put("user_id", comment.getUserId());
        List<Comment> bookComments = commentMapper.selectByMap(map);
        if (bookComments.isEmpty()) return false;
        else return true;
    }
}
