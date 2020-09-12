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
}
