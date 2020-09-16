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

    /*更新博主信息*/
    public boolean updateBlogger(Blogger blogger){
        return bloggerDao.updateBlogger(blogger);
    }

    /*添加一个博主*/
    public boolean addBlogger(Blogger blogger){
        boolean flag = bloggerDao.addBlogger(blogger);
        int usrId = bloggerDao.findBloggerByUsrName(blogger.getUsername()).getUserId();
        if(flag == false){
            return false;
        }
        flag = bloggerDao.addUseStyle(usrId,1);
        return flag;
    }
}
