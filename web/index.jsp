<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:25
  To change this template use File | Settings | File Templates.
  这个页面用来管理账号，也就是修改账号的信息
--%>
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
      width: 90%;
      margin: 0 auto;
    }
    .main {
      width: 60%;
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
      padding: 0;
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      font-weight: bolder;
      font-style: inherit;
    }
    #title >h4 {
      margin: 0;
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
      <a  href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton "  iconCls="icon-ok" style="width:70px;height:32px" > 登录</a>
      <a  href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" style="width:70px;height:32px" > 注册</a>
    </div >
    <div id="logo">
      <a href="#" >
        <img src="jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   />
      </a>
    </div>
  </div>
  <div align="center">
    <div style="margin:20px 0;"></div>
    <input class="easyui-searchbox" data-options="labelPosition:'left',prompt:'搜索'" style="width:300px">
  </div>
  </div>
  <div class="blog" align="center">
    <c:forEach var="blog" items="${blogs}">
      <div class="main">
        <div id="title" align="left">
          <h4><a href="#">博客标题</a></h4>
        </div>
        <div align="left" id="maincontext">
          摘要:<span>博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘博客摘要博客摘要要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘博客摘要博客摘要要博客摘要博客摘要博客摘要博客摘要博客摘要博客摘要</span> <a href="#" id="all1">阅读全文</a>
        </div>
        <div align="right">
          <span id="time_nick"> 创建时间 &nbsp;&nbsp;&nbsp;用户昵称</span>
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