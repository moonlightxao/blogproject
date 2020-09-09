package com.blog.entity;
/*
* 博客的实体类实现
*
*
* */


import java.util.Date;

public class Blog {
    private Integer blogId;
    private String title;
    private String blogAbstract;
    private Date time;
    private String content;
    private Integer visited;

    public Blog(){

    }
    public Blog(String title, String blogAbstract, Date time, String content, Integer visited) {
        this.title = title;
        this.blogAbstract = blogAbstract;
        this.time = time;
        this.content = content;
        this.visited = visited;
    }

    public Blog(Integer blogId, String title, String blogAbstract, Date time, String content, Integer visited) {
        this.blogId = blogId;
        this.title = title;
        this.blogAbstract = blogAbstract;
        this.time = time;
        this.content = content;
        this.visited = visited;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBlogAbstract() {
        return blogAbstract;
    }

    public void setBlogAbstract(String blogAbstract) {
        this.blogAbstract = blogAbstract;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getVisited() {
        return visited;
    }

    public void setVisited(Integer visited) {
        this.visited = visited;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blogId=" + blogId +
                ", title='" + title + '\'' +
                ", blogAbstract='" + blogAbstract + '\'' +
                ", time=" + time +
                ", content='" + content + '\'' +
                ", visited=" + visited +
                '}';
    }
}
