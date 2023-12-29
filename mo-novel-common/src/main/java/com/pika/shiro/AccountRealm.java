package com.pika.shiro;

import com.pika.entity.User;
import com.pika.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.HashSet;

@Slf4j
/**
 * 通过数据库查询并添加用户的授权认证到Subject
 */
public class AccountRealm extends AuthorizingRealm {
    @Resource
    private UserService userService;

    @Resource
    private com.pika.shiro.JwtUtil jwtUtil;

    /**
     * shiro默认supports的是UsernamePasswordToken，而我们现在采用了jwt的方式，所以这里我们自定义一个JwtToken，来完成shiro的supports方法。
     * @param token
     * @return
     */
    @Override
    public boolean supports(AuthenticationToken token)
    {
        return token instanceof JWTToken;
    }

    /**
     * 二次认证请求头带有token
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection)
    {
        log.debug("执行了Real授权");
        Subject subject = SecurityUtils.getSubject();
        User user = (User)subject.getPrincipal();

        // 设置角色
        HashSet<String> roles = new HashSet<>();
        if (user.getRoleId() == 1) roles.add("admin");
//        roles.addAll(user.getRoles());
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo(roles);

        // 设置权限
        HashSet<String> permissions = new HashSet<>();
        simpleAuthorizationInfo.addStringPermissions(permissions);

//        return null;
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException
    {
        log.debug("执行了Real认证");
        log.debug("subject.login(token);");
        JWTToken jwt = (JWTToken) authenticationToken;
        String userId = jwtUtil.getClaimByToken((String) jwt.getPrincipal()).getSubject();
        User user = userService.getById(userId);

/*        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        UserInfoVo userInfoVo = JwtUtil.getUserInfoFormToken((String) token.getPrincipal());

        User user = userService.getUserByUsername(userInfoVo.getName());*/
        if(null == user) throw new UnknownAccountException("账户不存在");

        if(0 == user.getStatus()) throw new LockedAccountException("账户已被锁定！");

        // 密码校验
        return new SimpleAuthenticationInfo(user, jwt.getCredentials(), getName());
/*        if (null != user)
        {
            log.info("第一个参数principalCollection可以传给授权(subject)");
            // 密码校验
            return new SimpleAuthenticationInfo(user, token.getPassword(), user.getUsername());
        }

        // 账号不存在
        return null;*/
    }

}
