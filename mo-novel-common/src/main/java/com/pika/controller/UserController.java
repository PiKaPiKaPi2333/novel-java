package com.pika.controller;


import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.pika.service.UserService;
import com.pika.vo.UserQueryVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;


    @GetMapping("/search")
    public ResponseDTO searchUser(UserQueryVo userQueryVo)
    {
        return userService.searchUser(userQueryVo);
    }

    @PostMapping("add")
    public ResponseDTO addUser(@Validated @RequestBody User user)
    {
        return userService.register(user);
    }

    @PostMapping("edit")
    public ResponseDTO editUser(@Validated @RequestBody User user)
    {
        userService.updateById(user);
        return ResponseDTO.succ("成功修改用户");
    }

    @GetMapping("delete/{userId}")
    public ResponseDTO deleteUser(@PathVariable Long userId)
    {

        if (userService.removeById(userId))
        {
            return ResponseDTO.succ("成功删除");
        }else
            return ResponseDTO.fail("删除失败");
    }
}

