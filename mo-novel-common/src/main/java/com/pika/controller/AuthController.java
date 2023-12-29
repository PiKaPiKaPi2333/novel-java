package com.pika.controller;

import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.pika.service.UserService;
import com.pika.request.LoginRequest;
import org.apache.shiro.SecurityUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 用户认证
 *
 * @author PIKAPIKAPI
 * @since 2023-05-06
 */
@RestController
@RequestMapping("/auth")
public class AuthController {
    @Resource
    private UserService userService;

    @PostMapping("register")
    public ResponseDTO register(@Validated @RequestBody User user)
    {
        return userService.register(user);
    }

    @PostMapping("/logout")
    public ResponseDTO logout(@RequestHeader("X-Token") String token)
    {
        SecurityUtils.getSubject().logout();
        return ResponseDTO.succ("成功退出登录");
    }


    /**
     * jwt+shiro
     * 一次认证 二次认证在Realm
     * @param loginRequest
     * @return
     */
    @PostMapping("/login")
    public ResponseDTO login(@RequestBody LoginRequest loginRequest)
    {
        return userService.login(loginRequest);
    }

    @GetMapping("/info")
    public ResponseDTO info(String token)
    {
        return userService.info(token);
    }

}
