package com.pika.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.common.ResponseDTO;
import com.pika.common.ResponseStatus;
import com.pika.entity.Book;
import com.pika.entity.Comment;
import com.pika.entity.User;
import com.pika.exception.BusinessException;
import com.pika.mapper.BookMapper;
import com.pika.mapper.CommentMapper;
import com.pika.mapper.UserMapper;
import com.pika.response.CommentPageResponse;
import com.pika.service.CommentService;
import com.pika.request.CommentQueryRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 * 评价表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-05-01
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
	@Resource
    private CommentMapper commentMapper;
	@Resource
    private BookMapper bookMapper;

    @Resource
    private UserMapper userMapper;

	@Override
	public ResponseDTO searchComment(CommentQueryRequest queryParams) {
		QueryWrapper<Comment> commentQueryWrapper=new QueryWrapper<>();
		commentQueryWrapper.eq(StringUtils.checkValNotNull(queryParams.getResourceId()),"resource_id",queryParams.getResourceId());
		Page<Comment> commentPage = new Page<>(queryParams.getPage(), queryParams.getLimit());
        commentMapper.selectPage(commentPage, commentQueryWrapper);

        List<CommentPageResponse> commentPageResponses=new ArrayList<>();
        commentPage.getRecords().forEach(comment -> {
            User commentor=userMapper.selectById(comment.getUserId());
            CommentPageResponse commentPageResponse=CommentPageResponse.builder()
                    .id(comment.getId())
                    .createTime(comment.getCreateTime())
                    .updateTime(comment.getUpdateTime())
                    .resourceId(comment.getResourceId())
                    .resourceType(comment.getResourceType())
                    .bookName(bookMapper.selectById(comment.getResourceId()).getTitle())
                    .star(comment.getStar())
                    .content(comment.getContent())
                    .userAvatar(commentor.getAvatar())
                    .userName(commentor.getUsername())
                    .build();
            commentPageResponses.add(commentPageResponse);
        });

        HashMap<String, Object> map = new HashMap<>();
        map.put("items",commentPageResponses);
        map.put("total", commentPage.getTotal());
        return ResponseDTO.succ(map);
	}
	
	@Override
	public void saveComment(Comment comment) {
		 Book book = bookMapper.selectById(comment.getResourceId());
         if(StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
         //更新小说的评分
         Integer commentCount = commentMapper.selectCount(new QueryWrapper<Comment>().eq("resource_id", comment.getResourceId()));
         book.setScore((book.getScore()*commentCount + comment.getStar())/(commentCount+1));
         bookMapper.updateById(book);
         //保存评论
         comment.setResourceType((byte) 1);
         commentMapper.insert(comment);
	}
	

    @Override
    public ResponseDTO editBookComment(Comment comment)
    {
        //修改小说的评分
        Book book = bookMapper.selectById(comment.getResourceId());
        if(StringUtils.checkValNull(book)) throw new BusinessException("小说不存在");
        Comment oldComment = commentMapper.selectById(comment.getId());
        Integer commentCount = commentMapper.selectCount(new QueryWrapper<Comment>().eq("resource_id", comment.getResourceId()));
        book.setScore((book.getScore()*commentCount - oldComment.getStar() + comment.getStar())/(commentCount));
        bookMapper.updateById(book);
        commentMapper.updateById(comment);
        return ResponseDTO.succ(ResponseStatus.SUCCESS.getMsg());
    }

}
