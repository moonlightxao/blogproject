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
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="../../bootstraps/css/bootstrap.min.css">
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <style>
        body {
            background-image: url("../../jquery-easyui-1.8.6/themes/icons/background1.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .top {
            overflow: hidden;
        }
        .user {
            float: left;
        }
        .logo {
            float: right;
        }
        .line {
            height: 2px;
            width: 100%;
            background-color: dimgrey;
            padding: 5px;
        }
        .nav>li {
            border-radius: 10%;
        }

        div>ul>li {
            font-size: 30px;
            background-color: #00ee00 ;
            margin: 15px;

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
            background-color: pink;
            height: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="top">
    <div class="user">
        <input  value="${nickName}"><input value="/userImageLink/${imageLink}">
    </div>
    <div  class="logo" align="right">
        <a href="index.jsp">
            <img   src="../../jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
        </a>
    </div>
</div>
<div align="center" class="line"></div>
<div class="nav_">
    <ul class="nav nav-pills color">
        <li role="presentation" ><a href="index.jsp">首页</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/Blog/toCreateBlog">新随笔</a></li>
        <li role="presentation"><a href="${pageContext.request.contextPath}/Blog/toManageBlog">管理</a></li>
    </ul>
</div>
<div align="center" class="myblog">
    <table >
        <c:forEach var="blog" items="${blogs}">
            <tr style="border-right:1px solid #F00;border-bottom:1px solid #F00">
                <td style="border-left:1px solid #F00;border-top:1px solid #F00">${blog.title}</td>
                <td style="border-left:1px solid #F00;border-top:1px solid #F00">${blog.blogAbstract}</td>
                <td style="border-left:1px solid #F00;border-top:1px solid #F00">${blog.time}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>