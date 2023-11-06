package com.heng.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author LJohn
 * @since 2021-05-06
 */
public class JWTToken implements AuthenticationToken {
    private String token;

    public JWTToken(String token)
    {
        this.token = token;
    }
    @Override
    public Object getPrincipal()
    {
        return token;
    }

    @Override
    public Object getCredentials()
    {
        return token;
    }
}
