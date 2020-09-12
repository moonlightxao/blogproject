package com.blog.service;

import com.blog.dao.BlogDao;
import com.blog.dao.BloggerDao;
import com.blog.dao.HomepageDao;
import com.blog.entity.Blog;
import com.blog.entity.Blogger;
import com.blog.entity.Homepage;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogDao blogDao;

    @Autowired
    private BloggerDao bloggerDao;

    @Autowired
    private HomepageDao homepageDao;

    /*查找所有博客*/
    public List<Blog> findAllBlog(){
        return blogDao.findAllBlog();
    }

    /*根据博客编号查找博客*/
    public Blog findBlogById(int id){
        return blogDao.findBlogById(id);
    }

    /*添加一个博客*/
    public boolean addBlog(Blog blog){
        return blogDao.addBlog(blog);
    }

    /*更新博客内容*/
    public boolean updateBlog(Blog blog){
        return blogDao.updateBlog(blog);
    }

    /*根据用户编号查找其所有的博客*/
    public List<Blog> findAllBlogByUsrId(int usrId){
        return blogDao.findAllBlogByUsrId(usrId);
    }

    /*根据博客编号删除指定博客*/
    public boolean deleteBlogById(int id){
        return blogDao.deleteBlogById(id);
    }

    /*根据博客编号查询其访问权限*/
    public int findAuthorityById(int id){
        return blogDao.findAuthorityById(id);
    }

    /*根据博客编号查询其作者的编号*/
    public Blogger findOwnById(int id){
        int usrId = blogDao.findOwnerById(id);
        return bloggerDao.findBloggerById(usrId);
    }

    /*根据博客编号查询其展示页面模板*/
    public int showHomepageStyle(int id){
        int usrId = blogDao.findOwnerById(id);
        return bloggerDao.findHomepageStyleById(usrId);
    }

}
