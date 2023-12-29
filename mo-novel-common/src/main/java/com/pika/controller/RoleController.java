package com.pika.controller;


import com.pika.common.ResponseDTO;
import com.pika.entity.Role;
import com.pika.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@RestController
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @PostMapping("/add")
    public ResponseDTO add(Role role)
    {
        if(roleService.save(role))
            return ResponseDTO.succ("成功添加新角色");
        return ResponseDTO.fail("添加角色失败");
    }
}

