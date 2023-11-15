package com.pika.controller;

import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.pika.service.UserService;
import com.pika.vo.LoginVo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 用户认证
 *
 * @author PIKAPIKAPI
 * @since 2023-05-06
 */
@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
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
     * @param loginVo
     * @return
     */
    @PostMapping("/login")
    public ResponseDTO login(@RequestBody LoginVo loginVo)
    {
        return userService.login(loginVo);
    }

    @GetMapping("/info")
    public ResponseDTO info(String token)
    {
        return userService.info(token);
    }

}
