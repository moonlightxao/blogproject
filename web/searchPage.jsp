<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:23
  To change this template use File | Settings | File Templates.
  这个页面用来搜索博客，同时显示搜索结果
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>搜索</title>
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
            min-height: 800px;
            background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background1.jpg") ;
            background-repeat: no-repeat;
            background-size: 100%;
            padding: 15px;
            margin: 0;
            background-attachment: fixed;
        }
        .top {
            overflow: hidden;
        }
        #logo>a>img {
            width: 100px;
            float: left;
        }
        #user {
            float: right;
        }
        .blog {
            overflow: hidden;
            width: 60%;
            margin: 15px auto;
        }
        .main {
            border-width: 2px;
            border-style: solid;
            width: 80%;
            padding: 10px;
            margin: 10px;
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
        #title >h4>a {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-weight: bolder;
            font-style: inherit;
            padding: 0;
        }
        #title >h4 {
            margin: 0;
        }
        #time_nick {
            color:dimgrey;
        }
        #pagenav {
            width: 60%;
            padding: 10px;
            margin: 10px;
        }
        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        .pagination li:first-child a {
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .pagination li:last-child a {
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        ul.pagination li a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;

        }
        ul.pagination li a:hover:not(.active) {background-color: #ddd;}
    </style>
</head>
<body class="back" >
    <div class="top">
        <div id="user">
            <a  href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton "  iconCls="icon-ok" style="width:70px;height:32px" > 登录</a>
            <a  href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" style="width:70px;height:32px" > 注册</a>
        </div >
        <div id="logo">
            <a href="index.jsp" >
                <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   />
            </a>
        </div>
    </div>
    <div align="center">
        <div style="margin:20px 0;"></div>
        <input class="easyui-searchbox" data-options="labelPosition:'left',prompt:'搜索',searcher:doSearch"  style="width:300px">
    </div>
    <script>
        function doSearch(value,name){
            var url = "${pageContext.request.contextPath}/Blog/searchBlog?value="+value;
            window.location.href= url;
        }
    </script>
<div>
    <div class="blog" align="center">
        <h3 style="text-align: left"> 搜索结果:</h3>
        <c:forEach var="blog" items="${blogs}">
            <div class="main">
                <div id="title" align="left" >
                    <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${blog.blogId}">${blog.title}</a></h4>
                </div>
                <div align="left" style="margin: 0" >
                    <span style="margin: 0">${blog.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${blog.blogId}" id="all">阅读全文</a>
                </div>
                <div align="right">
                    <span id="time_nick"> 创建时间: ${blog.time}&nbsp;&nbsp;&nbsp;用户昵称:这里需要用户的昵称</span>
                </div>
            </div>
        </c:forEach>
        <div id=pagenav align="left">
            <nav aria-label="Page navigation" >
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="First">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">上一页</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">下一页</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" aria-label="Last">
                            <span aria-hidden="true">尾页</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>