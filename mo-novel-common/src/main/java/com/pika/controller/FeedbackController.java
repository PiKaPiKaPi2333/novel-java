package com.pika.controller;

import com.pika.common.ResponseDTO;
import com.pika.entity.Feedback;
import com.pika.request.FeedBackQueryRequest;
import com.pika.service.FeedbackService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.xml.ws.Response;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/21
 */

@Slf4j
@RestController
@RequestMapping("/feedback")
public class FeedbackController {

    @Resource
    private FeedbackService feedbackService;

    @PostMapping("/search")
    public ResponseDTO searchFeedback(@RequestBody FeedBackQueryRequest request){
        return feedbackService.searchFeedback(request);
    }

    @PostMapping("/add")
    public ResponseDTO addFeedback(@RequestBody Feedback feedback){
        return feedbackService.addFeedback(feedback);
    }

    @PostMapping("/edit")
    public ResponseDTO editFeedback(@RequestBody Feedback feedback){
        return feedbackService.editFeedback(feedback);
    }

    @GetMapping("/delete/{id}")
    public ResponseDTO deleteFeedback(@PathVariable("id") Long id){
        return feedbackService.deleteFeedback(id);
    }

}
