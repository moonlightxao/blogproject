package com.blog.dao;

import com.blog.entity.Homepage;

import java.util.List;

public interface HomepageDao {
    /*返回所有的主页实体*/
    List<Homepage> findAllPage();

    /*根据页面编号返回相应的页面*/
    Homepage findPageById(int id);

    /*根据页面名称返回相应的页面*/
    Homepage findPageByName(String name);

    /*添加一个页面*/
    boolean addHomepage(Homepage homepage);

    /*更新一个页面*/
    boolean updateHomepage(Homepage homepage);

    /*删除一个页面*/
    boolean deleteHomepageById(int id);
}
