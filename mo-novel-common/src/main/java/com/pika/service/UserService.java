package com.pika.service;

import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pika.vo.LoginVo;
import com.pika.vo.UserQueryVo;

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

    ResponseDTO login(LoginVo loginVo);

    ResponseDTO info(String token);

    ResponseDTO searchUser(UserQueryVo userQueryVo);

    ResponseDTO register(User user);
}
