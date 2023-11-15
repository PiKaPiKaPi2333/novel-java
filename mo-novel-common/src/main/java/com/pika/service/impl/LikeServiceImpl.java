package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Like;
import com.pika.mapper.LikeMapper;
import com.pika.service.LikeService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 点赞踩表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class LikeServiceImpl extends ServiceImpl<LikeMapper, Like> implements LikeService {

}
