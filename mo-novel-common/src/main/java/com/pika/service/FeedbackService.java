package com.pika.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.common.ResponseDTO;
import com.pika.entity.Feedback;
import com.pika.request.FeedBackQueryRequest;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/21
 */

public interface FeedbackService extends IService<Feedback> {

    ResponseDTO searchFeedback(FeedBackQueryRequest request);

    ResponseDTO addFeedback(Feedback feedback);

    ResponseDTO editFeedback(Feedback feedback);

    ResponseDTO deleteFeedback(Long id);
}
