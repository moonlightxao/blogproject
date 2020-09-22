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
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <style>
        body {
            padding: 0;
        }
        .back {
            min-height: 700px;
            background-color: lightblue;
            background-size: 100% 100%;
            padding: 15px;
            margin: 0;
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
        .nav {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            border: 1px solid #e7e7e7;
            background-color: #f3f3f3;
        }
        .nav>li {
            font-size: 15px;
            float: left;
        }

        .nav>li>a {
            display: block;
            color: #666;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .nav>li>a:hover {
            color:white;
            background-color: darkseagreen;
        }
        #center {
            overflow: hidden;
        }
        #myblog {
            float: left;
            width: 80%;

        }
        #info {
            float: left;
            background-color: white;
            width: 15%;
            padding: 10px;
            margin: 10px;
            border-style: solid;
            border-color: grey;
            border-width: 2px;
        }
        #info>h3 {
            text-align: center;
        }
        .main {
            border-style: solid;
            width: 80%;
            padding: 10px;
            margin: 10px;
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
            <a href="该博主的个人主页">${ownerName}</a>
            <img src="博客拥有者的用户头像">
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
            <li><a href="index.jsp">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/Blog/toCreateBlog">新随笔</a></li>
            <li><a href="${pageContext.request.contextPath}/Blog/toManageBlog">管理</a></li>
        </ul>
    </div>
    <div id="center">
    <div align="center" id="myblog">
        <c:forEach var="blog" items="${blogs}">
            <div class="main">
                <div id="title" align="left">
                    <h4><a href="">${blog.title}</a></h4>
                </div>
                <div class="child_line">

                </div>
                <div align="left">
                    <span>${blog.content}</span>
                </div>
                <div align="right">
                    <span id="time_nick"> ${blog.time} &nbsp;${ownerName}</span>
                </div>
            </div>
        </c:forEach>
    </div>
        <div id="info">
           <h3>public notice </h3>
            <div>
                <li>昵称:“作者昵称”</li>
                <li>个性签名:"作者签名"</li>
                <li>访问量:访问量</li>
            </div>
        </div>
</div>


</div>
</body>
</html>
