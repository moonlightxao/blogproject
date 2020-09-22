<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
</head>
<body class="back" >
<div class="top">
    <div id="user">
        <a  href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton "  iconCls="icon-ok" style="width:70px;height:32px" > 登录</a>
        <a  href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" style="width:70px;height:32px" > 注册</a>
    </div >
    <div id="logo">
        <a href="${pageContext.request.contextPath}/" >
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
        <c:forEach var="iMap" items="${map}">
            <div class="main">
                <div id="title" align="left" >
                    <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.key.blogId}"><span style="margin: 0">${iMap.key.title}</span></a></h4>
                </div>
                <div align="left" style="margin: 0" >
                    <span style="margin: 0">${iMap.key.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.key.blogId}" id="all">阅读全文</a>
                </div>
                <div align="right">
                    <span id="time_nick"> 创建时间: ${iMap.key.time}&nbsp;&nbsp;&nbsp;用户昵称:${iMap.value}</span>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>