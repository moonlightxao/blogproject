<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:21
  To change this template use File | Settings | File Templates.
  这个页面用来展示博客的内容，会根据博主的不同页面模板设置而改变
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${blog.title}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <c:if test=" ">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/showblog.css">
    </c:if>
    <c:if test=" ">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/showblog.css">
    </c:if>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
</head>
<body>
<div class="back" >
    <div class="top">
        <div id="user">
            <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}">${owner.nickname}</a>
            <img src="/userImageLink/${owner.imageLink}">
        </div>
        <div  id="logo" >
            <a href="${pageContext.request.contextPath}/">
                <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   >
            </a>
        </div>
    </div>
    <div align="center" class="line"></div>
    <div>
        <ul class="nav">
            <li role="presentation" ><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/Blog/toCreateBlog">新随笔</a></li>
            <li role="presentation"><a href="${pageContext.request.contextPath}/Blog/toManageBlog">管理</a></li>
        </ul>
    </div>
    <div id="center">
        <div align="center" id="myblog">
            <div class="main">
                <div id="title" align="left">
                    <h4><a href="#"><span>${blog.title}</span></a></h4>
                </div>
                <div class="child_line"></div>
                <div align="left">
                    <span>${blog.content}</span>
                </div>
                <div align="right">
                    <span id="time_nick"> ${blog.time} &nbsp;${owner.nickname}</span>
                </div>
            </div>
        </div>
        <div id="info">
            <h3>public notice </h3>
            <div>
                <li>昵称:${owner.nickname}</li>
                <li>个性签名:${owner.sign}</li>
                <li>访问量:${blog.visited}</li>
            </div>
        </div>
    </div>
</div>
<div class="bottom">
    <div id="friend_link" >
        <h5> 友情链接:</h5> <a href="#">百度云</a> &nbsp; <a href="#">阿里云</a> &nbsp; <a href="#">华为云</a>
        &nbsp; <a href="#">腾讯云</a> &nbsp; <a href="#">菜鸟教程</a> &nbsp; <a href="#">Bootstrap</a> &nbsp; <a href="#">jQuery</a> &nbsp; <a href="#">网易云</a>
    </div>
    <div id="communication">
        <h5>联系我们:</h5>
        <li>电话:13251266359</li>
        <li>邮箱:2675935418@qq.com</li>
    </div>
</div>
</body>
</html>