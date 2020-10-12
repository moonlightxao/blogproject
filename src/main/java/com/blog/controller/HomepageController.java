package com.blog.controller;

import com.blog.entity.*;
import com.blog.service.HomepageService;
import com.blog.utils.DateTransferUtil;
import com.blog.utils.PagingUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Homepage")
public class HomepageController {
    @Resource
    private HomepageService homepageService;

    /*
    * 访问自己的主页的时候经过这个方法
    * */
    @RequestMapping("/toHomepage")
    public String toHomepage(int usrId,String page,HttpServletRequest request){
        //Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        /*给前端传用户头像地址和用户名*/
        Map<String,Object> maps = homepageService.showHomepageById(usrId);
        List<Blog> blogs = (List<Blog>) maps.get("blogs");
        PageBean pageBean = new PageBean();
        if(page == null || page == ""){
            page = "1";
        }
        pageBean.setPageSize(5);
        pageBean.setPage(Integer.valueOf(page));
        pageBean.setTotalRecord(blogs.size());
        int tp = pageBean.getTotalRecord()/5;
        if(pageBean.getTotalRecord()%5 != 0 ){
            tp +=1;
        }
        pageBean.setTotalPage(tp);
        //System.out.println("Homepage show pageBean = "+pageBean);

        List<Blog> pagingBlog = PagingUtil.pagingFromList(blogs,pageBean);
        List<BlogWithNickname> blogWithNicknameList = new LinkedList<BlogWithNickname>();
        for(Blog b:pagingBlog){
            BlogWithNickname blogWithNickname = new BlogWithNickname(b,null, DateTransferUtil.transferTime(b.getTime()));
            blogWithNicknameList.add(blogWithNickname);
        }

        request.setAttribute("owner",maps.get("owner"));
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("pageNum",maps.get("pageNum"));
        request.setAttribute("homepegeBlogs",blogWithNicknameList);
        return "homepage";
    }

    /*
    * 处理进入到个人主页模板页面的请求
    * */
    @RequestMapping("/toManageHomepage")
    public String toManageHomepage(HttpServletRequest request){
        Blogger curUser = (Blogger) SecurityUtils.getSubject().getSession().getAttribute("currentUser");
        List<Homepage> homepages = homepageService.findAllPages();
        List<HomepageWithTime> homepageWithTimes = new LinkedList<HomepageWithTime>();
        for(Homepage homepage:homepages){
            HomepageWithTime homepageWithTime = new HomepageWithTime(homepage,DateTransferUtil.transferTime(homepage.getReleaseTime()));
            homepageWithTimes.add(homepageWithTime);
        }


        request.setAttribute("usrId",curUser.getUserId());
        request.setAttribute("imageLink",curUser.getImageLink());
        request.setAttribute("nickName",curUser.getNickname());
        request.setAttribute("allPages",homepageWithTimes);

        return "admin/manageHomepage";
    }

    /*
    * 处理更换个人主页模板页面的请求
    * */
    @RequestMapping("/manageHomepage")
    public String manageHomepage(String model, int usrId, String page){
        boolean flag = homepageService.updatePageByUsrId(usrId,Integer.valueOf(model));
        if(flag == false){
            return null;
        }
        String url = "redirect:/Homepage/toHomepage?usrId="+usrId+"&page="+page;
        return url;
    }
}
