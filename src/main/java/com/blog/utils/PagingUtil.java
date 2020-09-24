package com.blog.utils;

import com.blog.entity.Blog;
import com.blog.entity.PageBean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PagingUtil {
    public static List<Blog> pagingFromList(List<Blog> list , PageBean pageBean){
        int pc = pageBean.getPage();
        int ps = pageBean.getPageSize();
        int tr = list.size();
        List<Blog> res = new ArrayList<Blog>();
        for(int i = (pc - 1) * ps ; i < pc * ps ;i++){
            if( i + 1 <= tr){
                //System.out.println(list.get(i).getTitle());
                res.add(list.get(i));
            }else break;
        }
        return res;
    }
}
