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
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <style>
        #back {

            background-image: url("../../jquery-easyui-1.8.6/themes/icons/background.jpg");
            background-position: right bottom, left top;
            background-repeat: no-repeat, repeat;
            padding: 15px;
            margin: 0;
            border: #eb9316;
            width: 100%;
            height: 1000px;
        }
        #home {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 50px;
            color: #eb9316;
            text-align: right;

        }
        #mine {
            font-family: cursive;
            font-size: 30px;
            color:dodgerblue;
            text-align: right;
        }
    </style>
</head>
<body >
<div id="back" >
    用户照片 用户昵称
    <div id="home" >
        <a href="#">博客HOME </a>
    </div>
    <div  id="mine" >
        <a href="#">我的博客</a>
    </div>
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