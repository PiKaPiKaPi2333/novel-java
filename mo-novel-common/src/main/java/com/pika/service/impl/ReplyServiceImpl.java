package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Reply;
import com.pika.mapper.ReplyMapper;
import com.pika.service.ReplyService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 回复表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-05-01
 */
@Service
public class ReplyServiceImpl extends ServiceImpl<ReplyMapper, Reply> implements ReplyService {

}
