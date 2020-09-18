<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>index</title>
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
      height: 800px;
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
    }
    .child_line {
      height: 1px;
      width: 100%;
      border-radius:10%;
      background-color:darkseagreen;
      padding: 1px;
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
<body >
<div class="back" >
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
    <input  name="result" class="easyui-searchbox" data-options="prompt:'搜索',menu:'#mm',searcher:doSearch" style="width:300px" type="search" >
    <div id="mm">
      <div data-options="name:'blog'">博客</div>
      <div data-options="name:'username'">用户名</div>
    </div>
  </div>
  <script>
    function doSearch(value,name){
      var url = "${pageContext.request.contextPath}/Blog/searchBlog?value="+value;
      window.location.href= url;
    }
  </script>
  <div class="blog" align="center">
    <c:forEach var="iMap" items="${map}">
      <div class="main">
        <div id="title" align="left">
          <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.value.blogId}">${iMap.value.title}</a></h4>
        </div>
        <div class="child_line">
        </div>
        <div align="left">
          摘要:<span>${iMap.value.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.value.blogId}" id="all">阅读全文</a>
        </div>
        <div align="right">
          <span id="time_nick"> 创建时间:${iMap.value.time} &nbsp;&nbsp;&nbsp;用户昵称:${iMap.key}</span>
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