package com.pika.mapper;

import com.pika.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
public interface UserMapper extends BaseMapper<User> {

/*    @Results(id = "id", value = {
            @Result(property = "id", column = "id"),
            @Result(property = "username", column = "usernmae"),
            @Result(property = "roles", column = "role_id", one = @One(select = "com.heng.mapper.RoleMapper.selectById"))
    })
    @Select("select * from `t_user`")
    List<User> selectUserAndRole();*/
}
