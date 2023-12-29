package com.pika.service;

import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.request.LoginRequest;
import com.pika.request.UserQueryRequest;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
public interface UserService extends IService<User> {
    User getUserByUsername(String username);

    ResponseDTO login(LoginRequest loginRequest);

    ResponseDTO info(String token);

    ResponseDTO searchUser(UserQueryRequest userQueryRequest);

    ResponseDTO register(User user);

    ResponseDTO getUser(Long userId);
}
