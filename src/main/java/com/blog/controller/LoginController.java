package com.blog.controller;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.utils.CryptographyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    private BloggerService bloggerService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "/login";
    }

    @RequestMapping("/login")
    public String login(Blogger blogger, HttpServletRequest request){
        String userName = blogger.getUsername();
        String password = blogger.getPassword();

        /*对密码进行转化*/
        String pwd = CryptographyUtil.md5(password,"njust");

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(userName,pwd);
        try{
        subject.login(token);
        return "redirect:/homepage.jsp";
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("blogger",blogger);
/*            request.setAttribute("info","用户名或者密码错误");*/
        }
        return "login";
    }

    @RequestMapping("/toChangePwd")
    public String toChangePwd(){
        return "redirect:/admin/changePwd.jsp";
    }
}
