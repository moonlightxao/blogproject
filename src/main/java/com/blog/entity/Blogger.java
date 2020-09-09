package com.blog.entity;

import java.util.Date;

public class Blogger {
    private Integer userId;
    private String username;
    private String password;
    private String nickname;
    private String realName;
    private Integer phone;
    private Date birthday;
    private String sign;
    private String imageLink;
    public Blogger(){

    }

    public Blogger(String username, String password, String nickname, String realName, Integer phone, Date birthday, String sign, String imageLink) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.realName = realName;
        this.phone = phone;
        this.birthday = birthday;
        this.sign = sign;
        this.imageLink = imageLink;
    }

    public Blogger(Integer userId, String username, String password, String nickname, String realName, Integer phone, Date birthday, String sign, String imageLink) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.realName = realName;
        this.phone = phone;
        this.birthday = birthday;
        this.sign = sign;
        this.imageLink = imageLink;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    @Override
    public String toString() {
        return "Blogger{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", realName='" + realName + '\'' +
                ", phone=" + phone +
                ", birthday=" + birthday +
                ", sign='" + sign + '\'' +
                ", imageLink='" + imageLink + '\'' +
                '}';
    }
}
