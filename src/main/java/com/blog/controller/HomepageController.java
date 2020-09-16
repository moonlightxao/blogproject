package com.blog.controller;

import com.blog.entity.Blog;
import com.blog.entity.Blogger;
import com.blog.service.HomepageService;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Homepage")
public class HomepageController {
    @Resource
    private HomepageService homepageService;

    @RequestMapping("/toHomepage")
    public String toHomepage(HttpServletRequest request){
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        /*给前端传用户头像地址和用户名*/
        Map<String,Object> maps = homepageService.showHomepage(curUser);
        request.setAttribute("pageNum",maps.get("pageNum"));
        request.setAttribute("nickName",maps.get("nickName"));
        request.setAttribute("blogs",maps.get("blogs"));
        request.setAttribute("imageLink",maps.get("imageLink"));
        System.out.println("in toHomepage");

        System.out.println(maps);
        return "homepage";
    }
}
