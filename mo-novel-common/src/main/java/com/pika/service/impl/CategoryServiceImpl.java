package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Category;
import com.pika.mapper.CategoryMapper;
import com.pika.service.CategoryService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 小说分类表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

}
