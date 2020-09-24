package com.blog.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Homepage {
    private Integer id;
    private String pageName;
    private String description;
    private String creator;
    private Date releaseTime;
    private String imagelink;

    public Homepage(){

    }

    public Homepage(String pageName, String description, String creator, Date releaseTime,String imagelink) {
        this.pageName = pageName;
        this.description = description;
        this.creator = creator;
        this.releaseTime = releaseTime;
        this.imagelink = imagelink;
    }

    public Homepage(Integer id, String pageName, String description, String creator, Date releaseTime,String imagelink) {
        this.id = id;
        this.pageName = pageName;
        this.description = description;
        this.creator = creator;
        this.releaseTime = releaseTime;
        this.imagelink = imagelink;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getImagelink() {
        return imagelink;
    }

    public void setImagelink(String imagelink) {
        this.imagelink = imagelink;
    }

    @Override
    public String toString() {
        return "Homepage{" +
                "id=" + id +
                ", pageName='" + pageName + '\'' +
                ", description='" + description + '\'' +
                ", creator='" + creator + '\'' +
                ", releaseTime=" + releaseTime +
                ", imagelink='" + imagelink + '\'' +
                '}';
    }
}
