package com.blog.dao;

import com.blog.entity.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface BlogDao {
    /*查找所有的博客*/
    List<Blog> findAllBlog();

    /*通过用户编号查找其所有博客*/
    List<Blog> findAllBlogByUsrId(int urdId);

    /*通过博客编号查找博客*/
    Blog findBlogById(int id);

    /*通过博客名称查找博客*/
    Blog findBlogByTitle(String title);

    /*添加博客*/
    boolean addBlog(@Param(value = "b") Blog blog);

    /*更新博客内容*/
    boolean updateBlog(Blog blog);

    /*根据博客编号删除相关的博客*/
    boolean deleteBlogById(int id);

    /*根据博客编号查看博客的访问权限*/
    int findAuthorityById(int id);

    /*根据博客编号查看其拥有者的用户编号*/
    int findOwnerById(int id);

    /*根据博客名称模糊搜索博客*/
    List<Blog> findAllBlogByName(String name);

    /*添加博客的同时还要给own关系表添加一个记录*/
    boolean addOwnerShip(@Param(value = "uid") int usrId,@Param(value = "bid")int blogId,@Param(value = "au")int authority);

    /*更新own关系表的一个记录*/
    boolean updateOwnerShip(@Param(value = "bid")int blogId,@Param(value = "au")int authority);

    /*删除own关系表的一个记录*/
    boolean deleteOwnerShip(@Param(value = "bid")int blogId);
}
