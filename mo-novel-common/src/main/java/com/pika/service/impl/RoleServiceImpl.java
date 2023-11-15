package com.pika.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.entity.Role;
import com.pika.mapper.RoleMapper;
import com.pika.service.RoleService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-28
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
