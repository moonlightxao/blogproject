package com.blog.controller;


import com.blog.entity.Blog;
import com.blog.entity.Blogger;
import com.blog.service.BlogService;
import com.blog.utils.ResponseWrite;
import com.sun.deploy.net.HttpResponse;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Blog")
public class BlogController {
    @Resource
    private BlogService blogService;

    @RequestMapping("/toCreateBlog")
    public String toCreateBlog(HttpServletRequest request) {
        String tmp = request.getParameter("id");
        if(tmp == null){
            return "admin/createBlog";
        }else{
            int bid = Integer.valueOf(tmp);
            /*System.out.println(bid);*/
            Blog blog = blogService.findBlogById(bid);
            request.setAttribute("blogTitle",blog.getTitle());
            request.setAttribute("blogContent",blog.getContent());
            return "admin/createBlog";
        }
    }


    @RequestMapping("/createBlog")
    public String createBlog(Blog blog, int authority, HttpServletResponse response) throws IOException {
        blog.setTime(new Date());
        blog.setVisited(0);
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        boolean flag = blogService.addBlog(blog,curUser.getUserId(),authority);
        JSONObject jsonObject = new JSONObject();
        if(flag == true){
            jsonObject.put("success",Boolean.valueOf(true));
        }
        else {
            jsonObject.put("success", Boolean.valueOf(false));
        }
        ResponseWrite.writeJSON(response,jsonObject);
        //System.out.println("here is createBlog");
        /*"redirect:/Homepage/toHomepage"*/
        return null;
    }

    @RequestMapping("/toManageBlog")
    public String toManageBlog(HttpServletRequest request){
        /*获取当前用户对象以及用户的所有博客*/
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        List<Blog> blogs = blogService.findAllBlogByUsrId(curUser.getUserId());

        request.setAttribute("allBlog",blogs);
        request.setAttribute("curUser",curUser);
        return "admin/manageBlog";
    }

    @RequestMapping("/manageBlog")
    public String manageBlog(String blogId,HttpServletResponse response) throws IOException {
        int bid = Integer.valueOf(blogId);
        Blogger owner = blogService.findOwnById(bid);
        List<Blog> blogs = blogService.findAllBlogByUsrId(owner.getUserId());
        boolean flag = blogService.deleteBlogById(bid);

        JSONObject res = new JSONObject();
        if(flag == false){
            res.put("success",Boolean.valueOf(false));
        }else{
            res.put("success",Boolean.valueOf(true));
            res.put("allblog",blogs.toString());
        }
        ResponseWrite.writeJSON(response,res);
        return null;
    }

}
