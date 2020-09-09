package com.blog.dao;

import com.blog.entity.Blogger;
import com.blog.entity.Homepage;

import java.util.List;

public interface BloggerDao {
    /*查找所有的博主*/
    List<Blogger> findAllBlogger();

    /*根据用户编号查找博主*/
    Blogger findBloggerById(int id);

    /*根据用户名查找博主*/
    Blogger findBloggerByUsrName(String name);

    /*根据昵称查找博主*/
    Blogger findBloggerByNickname(String nickname);

    /*添加一个博主*/
    boolean addBlogger(Blogger blogger);

    /*更新博主信息*/
    boolean updateBlogger(Blogger blogger);

    /*根据用户编号删除博主*/
    boolean deleteBloggerById(int id);

    /*根据用户名模糊搜索博主*/
    List<Blogger> findAllBloggerByName(String name);

    /*根据昵称模糊搜索博主*/
    List<Blogger> findAllBloggerByNickname(String nickname);

    /*查找博主的个人主页编号*/
    int findHomepageStyleById(int id);
}
