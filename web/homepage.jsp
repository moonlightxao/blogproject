<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:21
  To change this template use File | Settings | File Templates.
  这是博主的个人主页面，包含了分页显示的博客列表以及一些导航栏
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstraps/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <style>
        body {
            padding: 0;
        }
        .back {
            background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background1.jpg") ;
            background-repeat: no-repeat;
            background-size: 100%;
            padding: 15px;
            margin: 0;
            background-attachment: fixed;
        }
        .top {
            overflow: hidden;
            height: 100px;
        }
        #user {
            float: right;
        }
        /*用户昵称*/
        #user >a {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-weight: bolder;
            color: black;
            text-shadow: 5px 5px 6px rgba(0,0,0,.3);

        }
        #user >a:hover {
            text-decoration: none;
            color: #0c7cd5;
        }
        .main a:link {
            color: #00a0e9;
        }
        .main a:visited {
            color: #00a0e9;
        }
        a {
            text-decoration: none;
        }
        .main a:hover{
            color: #0c7cd5;
            text-decoration: none;
        }
        #user>img {
            width: 50px;
            height: 50px;
        }
        #logo {
            float: left;
        }
        #logo>a>img {
            width: 100px;
        }
        .line {
            height: 2px;
            width: 100%;
            background-color: dimgrey;
            padding: 2px;
        }
        .child_line {
            height: 1px;
            width: 100%;
            border-radius:10%;
            background-color:darkseagreen;
            padding: 1px;
        }
        div>ul>li {
            font-size: 20px;
            background-color: #00ee00 ;
            margin: 0px;
        }
        div>ul>li>a {
            color: black;
        }
        div>ul>li>a:hover {
            color:dodgerblue;
        }
        .myblog {
            overflow: hidden;
            width: 90%;
            margin: 0 auto;
        }
        .main {
            border-style: solid;
            width: 60%;
            padding: 10px;
            margin: 10px;
            -webkit-border-top-right-radius: 10%;
            border-bottom-width: 3px;
            border-right-width: 3px;
            border-left-width: 1px;
            border-top-width: 1px;
            border-right-color: grey;
            border-bottom-color: grey;
            background-color: lightgoldenrodyellow;
        }
        #title >h4>a {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-weight: bolder;
            font-style: inherit;
        }
        #time_nick {
            color:dimgrey;
        }
        .bottom {
            overflow: hidden;
            background-color: whitesmoke;
            color: grey;
        }
        #friend_link {
            float: left;
            padding: 15px;
            width: 50%;
        }
        #friend_link>a:link {
            color: grey;
            text-decoration: none;
        }
        #friend_link>a:visited {
            color: grey;
        }
        #friend_link>a:hover {
            color: grey;
        }
        #friend_link>a:active {
            color: grey;
        }
        #communication {
            float: left;
            padding: 15px;
            width: 50%;
        }
    </style>
</head>
<body>
<div class="back" >
<div class="top">
    <div id="user">
            <a href="#">${nickName}</a>
        <img src="/userImageLink/${imageLink}">
    </div>
    <div  id="logo" >
        <a href="index.jsp">
            <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   >
        </a>
    </div>
</div>
<div align="center" class="line"></div>
<div>
    <ul class="nav nav-pills color">
        <li role="presentation" ><a href="index.jsp">首页</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/Blog/toCreateBlog">新随笔</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/Blog/toManageBlog">管理</a></li>
    </ul>
</div>
<div align="center" class="myblog">
    <c:forEach var="blog" items="${blogs}">
        <div class="main">
        <div id="title" align="left">
            <h4><a href="#">${blog.title}</a></h4>
        </div>
        <div class="child_line">

        </div>
        <div align="left">
           摘要:<span>${blog.blogAbstract}</span> <a href="#" id="all">阅读全文</a>
        </div>
        <div align="right">
            <span id="time_nick"> ${blog.time}</span> &nbsp;&nbsp;&nbsp;<span>${nickName}</span>
        </div>
        </div>
    </c:forEach>
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