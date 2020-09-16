<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:22
  To change this template use File | Settings | File Templates.
  这个页面是博客的管理界面，也就是博主的后台，需要登录才能访问
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理博客页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function deleteSelectBlog(id){
             $.post("${pageContext.request.contextPath}/Blog/manageBlog",{'blogId':id},
                 function(result){
                    if(result.success){
                        $.messager.alert("系统提示","删除成功！");
                        window.location.reload();
                    }else{
                        $.messager.alert("系统提示","删除失败！");
                    }
                 },"json");
        }
    </script>
    <style>
        #showAllBlog
        {
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;
        }
        #showAllBlog td, #showAllBlog th
        {
            font-size:1em;
            border:1px solid #98bf21;
            padding:3px 7px 2px 7px;
        }
        #showAllBlog th
        {
            font-size:1.1em;
            text-align:left;
            padding-top:5px;
            padding-bottom:4px;
            background-color:#A7C942;
            color:#ffffff;
        }
        #showAllBlog tr.alt td
        {
            color:#000000;
            background-color:#EAF2D3;
        }
        #showAllBlog>tr>td:hover {
            background-color: #00ee00;
        }
    </style>
</head>
<body>
<div class="headTop">
    <a href="${pageContext.request.contextPath}/Homepage/toHomepage">返回个人首页</a>
    <h1>博客HOME</h1>
    <a href="#">更换个人主页模板</a>
    用户名：<b>${curUser.username}</b>
</div>
<div class="bodyContent">
    <table id="showAllBlog">
        <tr>
            <th>标题</th>
            <th>发布时间</th>
            <th>访问数</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        <c:forEach var="blog" items="${allBlog}">
            <tr class="alt">
                <td>${blog.title}</td>
                <td>${blog.time}</td>
                <td>${blog.visited}</td>
                <td><a href="${pageContext.request.contextPath}/Blog/toCreateBlog?id=${blog.blogId}">编辑</a></td>
                <td><a href="javascript:deleteSelectBlog(${blog.blogId})">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
