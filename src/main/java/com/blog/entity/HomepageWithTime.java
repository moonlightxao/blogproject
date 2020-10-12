package com.blog.entity;

import org.springframework.stereotype.Component;

@Component
public class HomepageWithTime {
    private Homepage homepage;
    private String time;

    public HomepageWithTime(){}

    public HomepageWithTime(Homepage homepage, String time) {
        this.homepage = homepage;
        this.time = time;
    }

    public Homepage getHomepage() {
        return homepage;
    }

    public void setHomepage(Homepage homepage) {
        this.homepage = homepage;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
