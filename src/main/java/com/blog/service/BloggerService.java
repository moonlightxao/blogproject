package com.blog.service;

import com.blog.dao.BlogDao;
import com.blog.dao.BloggerDao;
import com.blog.dao.HomepageDao;
import com.blog.entity.Blogger;
import com.blog.entity.Homepage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BloggerService {
    @Autowired
    private BloggerDao bloggerDao;

    @Autowired
    private BlogDao blogDao;

    @Autowired
    private HomepageDao homepageDao;

    public Blogger getBloggerByName(String name){
        return bloggerDao.findBloggerByUsrName(name);
    }

    public int showHomepage(int usrId){
        return bloggerDao.findHomepageStyleById(usrId);
    }


    /*添加一个博主*/
    public boolean addBlogger(Blogger blogger){
        return bloggerDao.addBlogger(blogger);
    }
}
