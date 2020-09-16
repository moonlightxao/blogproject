package com.blog.config;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

public class UserRealm extends AuthorizingRealm {
    @Resource
    private BloggerService bloggerService;

    /*授权*/
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    /*登录认证*/
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String userName = (String) token.getPrincipal();
        Blogger blogger = bloggerService.getBloggerByName(userName);
        if(blogger != null){
            SecurityUtils.getSubject().getSession().setAttribute("currentUser",blogger);
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(blogger.getUsername(),blogger.getPassword(),getName());
            return authenticationInfo;
        }
        return null;
    }
}
