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
  <title>Search Category - jQuery EasyUI Demo</title>
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.8.6/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.8.6/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="jquery-easyui-1.8.6/demo/demo.css">
  <script type="text/javascript" src="jquery-easyui-1.8.6/jquery.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
  <style>
    body {
      padding: 0;
    }
    .back {
      height: 800px;
      background-image: url("jquery-easyui-1.8.6/themes/icons/background1.jpg") ;
      background-position: initial;
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
      margin: 0 auto;
      padding: 20px;
      border: 10px;
      width: 80%;
      height: 300px;
      background-color: pink;
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
    a:link {
      color: grey;
      text-decoration: none;
    }
    a:visited {
      color: grey;
    }
    a:hover {
      color: grey;
    }
    a:active {
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
    <input  name="result" class="easyui-searchbox" data-options="prompt:'搜索',menu:'#mm'" style="width:300px" type="search" >
    <div id="mm">
      <div data-options="name:'blog'">博客</div>
      <div data-options="name:'username'">用户名</div>
    </div>
  </div>
  <div class="blog" >
    博客主题内容
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