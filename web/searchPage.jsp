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
    <title>Search Category - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <style>
        body {
            background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background1.jpg");
            background-position: right bottom, left top;
            background-repeat: no-repeat;
            background-size: 100%;
            background-attachment: fixed;
            height: 1080px;
            padding: 15px;
            margin: 0;
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
    </style>
</head>
<body >
<div class="top">
    <div class="user">
        <input  value="name"><input value=头像>
    </div>
    <div  class="logo" >
        <a href="#">
            <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
        </a>
    </div>
</div>
<div align="center">
    <div style="margin:20px 0;"></div>
    <input  name="result" class="easyui-searchbox" data-options="prompt:'搜索',menu:'#mm'" style="width:300px" >
    <div id="mm">
        <div data-options="name:'bolg'">博客</div>
        <div data-options="name:'username'">用户名</div>
    </div>
</div>
</body>
</html>