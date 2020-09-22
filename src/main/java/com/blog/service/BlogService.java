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

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
    public boolean addBlog(Blog blog,int usrId,int authority){
        boolean flag = blogDao.addBlog(blog);
        Blog tmp = blogDao.findBlogByTitle(blog.getTitle());
        if(flag == false){
            return false;
        }
        /*添加own表记录，其中authority = 1 表示所有人可见，0表示仅自己可见*/
        flag = blogDao.addOwnerShip(usrId,tmp.getBlogId(),authority);
        return flag;
    }

    /*更新博客内容*/
    public boolean updateBlog(Blog blog , int authority){
        boolean flag = blogDao.updateBlog(blog);
        if(flag == false){
            return false;
        }
        flag = blogDao.updateOwnerShip(blog.getBlogId(),authority);
        return flag;
    }

    /*根据用户编号查找其所有的博客*/
    public List<Blog> findAllBlogByUsrId(int usrId){
        return blogDao.findAllBlogByUsrId(usrId);
    }

    /*根据博客编号删除指定博客*/
    public boolean deleteBlogById(int id){
        boolean flag = blogDao.deleteBlogById(id);
        if(flag == false){
            return false;
        }
        flag = blogDao.deleteOwnerShip(id);
        return flag;
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

    /*根据博客标题模糊查找所有博客,并且过滤所有进私人访问的博客*/
    public List<Blog> findAllBlogByTitle(String title){
        List<Blog> blogs = blogDao.findAllBlogByName(title);
        Iterator<Blog> iterator = blogs.iterator();
        while(iterator.hasNext()){
            int authority = blogDao.findAuthorityById(iterator.next().getBlogId());
            if( authority == 0){
                iterator.remove();
            }
        }
        return blogs;
    }

    /*根据博客编号展示博客，需要根据博客编号查到其拥有者，以及拥有者的页面编号*/
    public Map<String,Object> showBlog(int blogId){
        Blog blog = blogDao.findBlogById(blogId);
        /*如果根据编号没有找到博客，直接返回null*/
        if(blog == null){
            return null;
        }
        Blogger owner = bloggerDao.findBloggerById(blogDao.findOwnerById(blog.getBlogId()));
        int pageId = bloggerDao.findHomepageStyleById(owner.getUserId());
        /*将结果封装的map里*/
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("pageId",pageId); //封装这个博主的页面模板编号
        map.put("owner",owner); // 封装这个博主
        map.put("blog",blog);  //封装这个查到的博客

        return map;
    }

}
