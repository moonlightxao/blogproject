package com.blog.controller;


import com.blog.entity.Blog;
import com.blog.entity.BlogWithNickname;
import com.blog.entity.Blogger;
import com.blog.entity.PageBean;
import com.blog.service.BlogService;
import com.blog.utils.DateTransferUtil;
import com.blog.utils.PagingUtil;
import com.blog.utils.ResponseWrite;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/Blog")
public class BlogController {
    @Resource
    private BlogService blogService;

    @RequestMapping("/toCreateBlog")
    public String toCreateBlog(HttpServletRequest request) {
        String tmp = request.getParameter("id");
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        if(tmp == null){
            request.setAttribute("user",curUser);
            return "admin/createBlog";
        }else{
            int bid = Integer.valueOf(tmp);
            /*System.out.println(bid);*/
            request.setAttribute("user",curUser);
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
        //System.out.println(blog);
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
    public String toManageBlog(String page,HttpServletRequest request){
        /*获取当前用户对象以及用户的所有博客*/
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        List<Blog> blogs = blogService.findAllBlogByUsrId(curUser.getUserId());
        PageBean pageBean = new PageBean();
        if(page == null || page.equals("")){
            page= "1";
        }
        pageBean.setPageSize(5);
        pageBean.setPage(Integer.valueOf(page));
        pageBean.setTotalRecord(blogs.size());
        int tp = pageBean.getTotalRecord()/5;
        if(pageBean.getTotalRecord()%5 != 0 ){
            tp +=1;
        }
        pageBean.setTotalPage(tp);
        //System.out.println("ManageBlog show pageBean = "+pageBean);

        List<Blog> pagingBlog = PagingUtil.pagingFromList(blogs,pageBean);
        List<BlogWithNickname> blogWithNicknameList = new LinkedList<BlogWithNickname>();
        for(Blog b:pagingBlog){
            BlogWithNickname blogWithNickname = new BlogWithNickname(b,null,DateTransferUtil.transferTime(b.getTime()));
            blogWithNicknameList.add(blogWithNickname);
        }
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("allBlog",blogWithNicknameList);
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
    public String searchBlog(String value,String page,HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
        /*如果是搜索用户名，就返回该用户的所有可见的博客。如果搜索的是博客就返回博客(都是模糊搜索)*/
        String title = new String(value.getBytes("iso-8859-1"),"utf-8");
        List<Blog> blogs = blogService.findAllBlogByTitle(title);
        if(page == null || page == ""){
            page = "1";
        }
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(5);
        pageBean.setPage(Integer.valueOf(page));
        pageBean.setTotalRecord(blogs.size());
        int tp = pageBean.getTotalRecord()/5;
        if(pageBean.getTotalRecord()%5 != 0 ){
            tp +=1;
        }
        pageBean.setTotalPage(tp);


        List<Blog> pagingBlog = PagingUtil.pagingFromList(blogs,pageBean);
        List<BlogWithNickname> blogWithNicknameList = new LinkedList<BlogWithNickname>();
        for(Blog blog : pagingBlog){
            Blogger owner = blogService.findOwnById(blog.getBlogId());
            BlogWithNickname blogWithNickname = new BlogWithNickname(blog,owner.getNickname(), DateTransferUtil.transferTime(blog.getTime()));
            blogWithNicknameList.add(blogWithNickname);
        }
        /*获取所有得cookies*/
        Cookie[] c = request.getCookies();
        boolean rem = false;
        if(c != null)
        {
            for(Cookie cookie:c){
                //System.out.println(cookie.getName());
                if(cookie.getName().equals("rememberMe")){
                    rem = true;
                }
            }
        }
        request.setAttribute("keyword",title);
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("rememberMe",rem);
        request.setAttribute("list",blogWithNicknameList);
        return "searchPage";
    }

    @RequestMapping("/toShowBlog")
    public String toShowBlog(String bid,HttpServletRequest request) throws ParseException {
        int blogId = Integer.valueOf(bid);
        Map<String,Object> map = blogService.showBlog(blogId);
        int pageId = (Integer) map.get("pageId");
        Blog blog = (Blog) map.get("blog");
        String tranTime = DateTransferUtil.transferTime(blog.getTime());
        request.setAttribute("owner",map.get("owner"));
        request.setAttribute("blog",blog);
        request.setAttribute("pageNum",pageId);
        request.setAttribute("time",tranTime);

        return "showBlog";
    }

    @RequestMapping("/index")
    public String showIndex(String page, HttpServletRequest request) throws ParseException {
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(5);
        pageBean.setPage(Integer.valueOf(page));
        pageBean.setTotalRecord(blogService.findAllBlog().size());
        int tp = pageBean.getTotalRecord()/5;
        if(pageBean.getTotalRecord()%5 != 0 ){
            tp +=1;
        }
        pageBean.setTotalPage(tp);
        /*接收到异步请求之后返回所有博客结果*/
        List<Blog> blogs = PagingUtil.pagingFromList(blogService.findAllBlog(),pageBean);
        List<BlogWithNickname> blogWithNicknameList = new LinkedList<BlogWithNickname>();
        for(Blog blog : blogs){
            Blogger owner = blogService.findOwnById(blog.getBlogId());
            BlogWithNickname blogWithNickname = new BlogWithNickname(blog,owner.getNickname(), DateTransferUtil.transferTime(blog.getTime()));
            blogWithNicknameList.add(blogWithNickname);
        }
        /*获取所有得cookies*/
        Cookie[] c = request.getCookies();
        boolean rem = false;
        if(c != null)
        {
            for(Cookie cookie:c){
                if(cookie.getName().equals("rememberMe")){
                    rem = true;
                }
            }
        }
        request.setAttribute("rememberMe",rem);
        request.setAttribute("list",blogWithNicknameList);
        request.setAttribute("pageBean",pageBean);
        return "index";
    }
}
