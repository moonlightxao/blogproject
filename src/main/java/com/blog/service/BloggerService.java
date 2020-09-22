package com.blog.service;

import com.blog.dao.BlogDao;
import com.blog.dao.BloggerDao;
import com.blog.dao.HomepageDao;
import com.blog.entity.Blogger;
import com.blog.entity.Homepage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

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

    /*根据编号获得博主信息*/
    public Blogger findBloggerById(int usrId){
        return bloggerDao.findBloggerById(usrId);
    }

    /*管理博客的业务逻辑*/
    public boolean manageAccount(Map<String,String> map) throws ParseException {
        boolean flag = false;
        Date day = new SimpleDateFormat("yyyy-MM-dd").parse(map.get("birthday"));
        String sign = map.get("sign");
        String image = map.get("image");
        String username = map.get("username");
        String nickname = map.get("nickname");
        String password = map.get("password");
        String realname = map.get("realname");
        String phone = map.get("phone");
        Blogger user = bloggerDao.findBloggerByUsrName(username);
        Blogger blogger = new Blogger(user.getUserId(),username,password,nickname,realname,phone,day,sign,image);
        flag = bloggerDao.updateBlogger(blogger);
        return flag;
    }
}
