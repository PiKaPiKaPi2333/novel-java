package com.pika.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.common.ResponseDTO;
import com.pika.entity.Feedback;
import com.pika.mapper.FeedbackMapper;
import com.pika.mapper.UserMapper;
import com.pika.request.FeedBackQueryRequest;
import com.pika.response.FeedbackPageResponse;
import com.pika.service.FeedbackService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/21
 */

@Service
public class FeedbackServiceImpl extends ServiceImpl<FeedbackMapper, Feedback> implements FeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    @Resource
    private UserMapper userMapper;
    @Override
    public ResponseDTO searchFeedback(FeedBackQueryRequest request) {
        QueryWrapper<Feedback> feedbackQueryWrapper=new QueryWrapper<>();
        if (request.getUserId() != null) {
            feedbackQueryWrapper.eq("user_id", request.getUserId());
        }
        if (request.getDone()!=0) {
            feedbackQueryWrapper.eq("done",request.getDone());
        }
        Page<Feedback> feedbackPage=new Page<>(request.getPage(),request.getLimit());
        feedbackMapper.selectPage(feedbackPage,feedbackQueryWrapper);
        List<FeedbackPageResponse> feedbackPageResponseList=new ArrayList<>();
        for (Feedback feedback : feedbackPage.getRecords()) {
            FeedbackPageResponse feedbackPageResponse=FeedbackPageResponse.builder()
                    .content(feedback.getContent())
                    .createTime(feedback.getCreateTime())
                    .updateTime(feedback.getUpdateTime())
                    .userName(userMapper.selectById(feedback.getUserId()).getUsername())
                    .done(feedback.getDone())
                    .id(feedback.getId()).build();
            feedbackPageResponseList.add(feedbackPageResponse);
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("items",feedbackPageResponseList);
        map.put("total", feedbackPage.getTotal());
        return ResponseDTO.succ(map);
    }

    @Override
    public ResponseDTO addFeedback(Feedback feedback) {
        feedbackMapper.insert(feedback);
        return ResponseDTO.succ("反馈成功！");

    }

    @Override
    public ResponseDTO editFeedback(Feedback feedback) {
        feedbackMapper.updateById(feedback);
        return ResponseDTO.succ("修改反馈成功");
    }

    @Override
    public ResponseDTO deleteFeedback(Long id) {
        feedbackMapper.deleteById(id);
        return ResponseDTO.succ("删除成功！");

    }
}
