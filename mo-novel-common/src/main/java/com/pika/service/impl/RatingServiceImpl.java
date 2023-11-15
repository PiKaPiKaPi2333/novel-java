package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Rating;
import com.pika.mapper.RatingMapper;
import com.pika.service.RatingService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 小说五星评分 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class RatingServiceImpl extends ServiceImpl<RatingMapper, Rating> implements RatingService {

}
