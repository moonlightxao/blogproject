package com.blog.service;

import com.blog.dao.BlogDao;
import com.blog.dao.BloggerDao;
import com.blog.dao.HomepageDao;
import com.blog.entity.Blog;
import com.blog.entity.Blogger;
import com.blog.entity.Homepage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HomepageService {

    @Autowired
    private HomepageDao homepageDao;

    @Autowired
    private BloggerDao bloggerDao;

    @Autowired
    private BlogDao blogDao;

    /*查询所有的页面*/
    public List<Homepage> findAllPages(){
        return homepageDao.findAllPage();
    }

    /*根据页面编号查询页面*/
    public Homepage findPageById(int id){
        return homepageDao.findPageById(id);
    }

    /*根据页面名称查询页面*/
    public Homepage findPageByName(String name){
        return homepageDao.findPageByName(name);
    }

    /*新增一个页面*/
    public boolean addHomepage(Homepage homepage){
        return homepageDao.addHomepage(homepage);
    }

    /*更新一个页面的信息*/
    public boolean updatePage(Homepage homepage){
        return homepageDao.updateHomepage(homepage);
    }

    /*根据用户查询其使用的页面模板编号*/
    public Map<String,Object> showHomepage(Blogger blogger){
        /*获取用户昵称以及用户头像地址以及页面编号,所有博客*/
        int pageNum = bloggerDao.findHomepageStyleById(blogger.getUserId());
        List<Blog> blogs = blogDao.findAllBlogByUsrId(blogger.getUserId());

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("pageNum",pageNum);
        map.put("nickName",blogger.getNickname());
        map.put("blogs",blogs);
        map.put("imageLink",blogger.getImageLink());
        return map;
    }

    /*根据用户名查询页面模板编号*/
    public Map<String,Object> showHomepageById(int usrId){
        /*获取用户昵称以及用户头像地址以及页面编号,所有博客*/
        int pageNum = bloggerDao.findHomepageStyleById(usrId);
        List<Blog> blogs = blogDao.findAllBlogByUsrId(usrId);
        //System.out.println("展示所有博客内容 = " + blogs.toString());
        Blogger blogger = bloggerDao.findBloggerById(usrId);

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("usrId",blogger.getUserId());
        map.put("pageNum",pageNum);
        map.put("nickName",blogger.getNickname());
        map.put("blogs",blogs);
        map.put("imageLink",blogger.getImageLink());
        return map;
    }

    /*根据页面编号删除页面*/
    public boolean deletePageById(int id){
        return homepageDao.deleteHomepageById(id);
    }

    /*根据用户编号更新其use_style表*/
    public boolean updatePageByUsrId(int usrId, int pageId){
        return bloggerDao.updateUseStyleByBlogger(usrId,pageId);
    }


}
