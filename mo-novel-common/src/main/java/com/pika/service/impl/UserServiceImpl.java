package com.pika.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pika.common.ResponseDTO;
import com.pika.entity.User;
import com.pika.mapper.UserMapper;
import com.pika.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pika.util.JwtUtil;
import com.pika.util.MD5Util;
import com.pika.vo.LoginVo;
import com.pika.vo.UserInfoVo;
import com.pika.vo.UserQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Objects;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author PIKAPIKAPI
 * @since 2023-12-25
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService  {
    @Autowired
    private UserMapper userMapper;


/*    @Autowired
    private PasswordEncoder passwordEncoder;*/

    @Override
    public User getUserByUsername(String username)
    {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("username", username);
        User user = userMapper.selectOne(userQueryWrapper);
        return user;
    }

    @Override
    public ResponseDTO login(LoginVo loginVo)
    {
        User user = getUserByUsername(loginVo.getUsername());
        if(user == null)
        {
            return ResponseDTO.fail("账户不存在");
        }

        if (!Objects.equals(MD5Util.md5(loginVo.getPassword()), user.getPassword()))
        {
            return ResponseDTO.fail("密码错误");
        }

        // 检查账户是否被禁用
        if (user.getStatus() == 0)
        {
            return ResponseDTO.fail("账户禁用，请联系管理员");
        }

        String roles[] = null;
        if(user.getRoleId()==1) {
        	roles=new String[] {"admin"} ;
        }else if(user.getRoleId()==2) {
        	roles=new String[] {"user"} ;
        }
        UserInfoVo userinfoVo=new UserInfoVo(user.getId(), user.getUsername(), roles, user.getAvatar());
        String jwt = JwtUtil.generateToken(userinfoVo);

        HashMap<String, String> map = new HashMap<>();
        map.put("token", jwt);
        return ResponseDTO.succ(map);
    }

    @Override
    public ResponseDTO info(String token)
    {
        UserInfoVo userinfovo=JwtUtil.getUserInfoFormToken(token);
//        JwtUtils.verity(token);
        return ResponseDTO.succ(userinfovo);
    }

    @Override
    public ResponseDTO searchUser(UserQueryVo userQueryVo)
    {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq(StringUtils.checkValNotNull(userQueryVo.getSex()), "sex", userQueryVo.getSex())
                .eq(StringUtils.checkValNotNull(userQueryVo.getRoleId()), "role_id", userQueryVo.getRoleId())
                .like(StringUtils.isNotBlank(userQueryVo.getUsername()), "username", userQueryVo.getUsername())
                .like(StringUtils.isNotBlank(userQueryVo.getEmail()), "email", userQueryVo.getEmail())
                .like(StringUtils.isNotBlank(userQueryVo.getMobile()), "mobile", userQueryVo.getMobile());

        Page<User> page = new Page<>(userQueryVo.getPage(), userQueryVo.getLimit());
        userMapper.selectPage(page, userQueryWrapper);
        HashMap<String, Object> map = new HashMap<>();
        map.put("items", page.getRecords());
        map.put("total", page.getTotal());
//        map.put("item", userMapper.selectUserAndRole());
        return ResponseDTO.succ(map);
    }

    @Override
    public ResponseDTO register(User user)
    {
        if(null != getUserByUsername(user.getUsername()))
            return ResponseDTO.fail("用户名已经存在!");
        if(0 >= userMapper.insert(user))
            return ResponseDTO.fail("注册失败");
        return ResponseDTO.succ("注册成功");
    }

}
