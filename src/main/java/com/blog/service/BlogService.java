package com.blog.service;

import com.blog.dao.BlogDao;
import com.blog.entity.Blog;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogDao blogDao;

    public void setBlogDao(BlogDao blogDao) {
        this.blogDao = blogDao;
    }

    public List<Blog> findAllBlog(){
        return blogDao.findAllBlog();
    }

    public Blog findBlogById(int id){
        return blogDao.findBlogById(id);
    }

    public boolean addBlog(Blog blog){
        return blogDao.addBlog(blog);
    }

    public boolean updateBlog(Blog blog){
        return blogDao.updateBlog(blog);
    }
}
