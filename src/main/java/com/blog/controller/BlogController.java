package com.blog.controller;


import com.blog.entity.Blog;
import com.blog.entity.Blogger;
import com.blog.service.BlogService;
import com.blog.utils.ResponseWrite;
import com.sun.deploy.net.HttpResponse;
import net.sf.json.JSON;
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
import java.util.Map;

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
            request.setAttribute("blogNum",bid);
            request.setAttribute("vis",blog.getVisited());
            return "admin/updateBlog";
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
    @RequestMapping("/updateBlog")
    public String updateBlog(Blog blog,int au,HttpServletResponse response) throws IOException {
        blog.setTime(new Date());
        boolean flag = blogService.updateBlog(blog,au);
        JSONObject jsonObject = new JSONObject();
        if(flag == true){
            jsonObject.put("success",Boolean.valueOf(true));
        }else{
            jsonObject.put("success",Boolean.valueOf(false));
        }
        ResponseWrite.writeJSON(response,jsonObject);
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

    @RequestMapping("/searchBlog")
    public String searchBlog(String value,HttpServletRequest request) throws UnsupportedEncodingException {
        /*如果是搜索用户名，就返回该用户的所有可见的博客。如果搜索的是博客就返回博客(都是模糊搜索)*/
        String title = new String(value.getBytes("iso-8859-1"),"utf-8");
        List<Blog> blogs = blogService.findAllBlogByTitle(title);
        request.setAttribute("blogs",blogs);
        return "searchPage";
    }

    @RequestMapping("/toShowBlog")
    public String toShowBlog(String bid,HttpServletRequest request){
        int blogId = Integer.valueOf(bid);
        Map<String,Object> map = blogService.showBlog(blogId);
        int pageId = (Integer) map.get("pageId");
        /*这里根据页面模板编号选择跳转，目前只有一个就直接跳*/
        request.setAttribute("ownerName",map.get("ownerName"));
        request.setAttribute("blog",map.get("blog"));

        //if(pageId == 1)
        return "showBlog";
    }

}
