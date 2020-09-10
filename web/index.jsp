<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:19
  To change this template use File | Settings | File Templates.
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
    #back {

      background-image: url("jquery-easyui-1.8.6/themes/icons/background.jpg");
      background-position: right bottom, left top;
      background-repeat: no-repeat, repeat;
      padding: 15px;
      margin: 0px;
      width: 100%;
      height: 1000px;
    }
    h1{
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      color: #eb9316;
    }
  </style>
</head>
<body>
<div id="back" >
  <a  href="#" class="easyui-linkbutton "  iconCls="icon-ok" style="width:70px;height:32px" > 登录</a>
  <a  href="#" class="easyui-linkbutton" iconCls="icon-man" style="width:70px;height:32px" > 注册</a>
  <h1 align="right" >博客HOME</h1>
  <div align="center">
    <div style="margin:20px 0;"></div>
    <input  name="result" class="easyui-searchbox" data-options="prompt:'搜索',menu:'#mm'" style="width:300px" >
    <div id="mm">
      <div data-options="name:'bolg'">博客</div>
      <div data-options="name:'username'">用户名</div>
    </div>
  </div>
</div>
</body>
</html>