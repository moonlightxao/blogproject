package com.blog.entity;

import org.springframework.stereotype.Component;

@Component
public class BlogWithNickname {
    private Blog blog;
    private String nickname;
    private String time;

    public BlogWithNickname(){}
    public BlogWithNickname(Blog blog, String nickname) {
        this.blog = blog;
        this.nickname = nickname;
    }

    public BlogWithNickname(Blog blog, String nickname, String time) {
        this.blog = blog;
        this.nickname = nickname;
        this.time = time;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
