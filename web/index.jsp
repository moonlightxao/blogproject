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
  <script type="text/javascript" >
    function inValidateSession(){
      session.invalidate();
    }

    function delConfirm(){
      if(confirm("确定删除吗？")){
        return true;
      }
      else{
        return false;
      }

    }

  </script>
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
      width: 50%;
    }
    /*表单*/
    #customers
    {
      font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
      width:100%;
      border-collapse:collapse;
    }
    #customers td, #customers th
    {
      font-size:1em;
      border:1px solid #98bf21;
      padding:3px 7px 2px 7px;
    }
    #customers th
    {
      font-size:1.1em;
      text-align:left;
      padding-top:5px;
      padding-bottom:4px;
      background-color:#A7C942;
      color:#ffffff;
    }
    #customers tr.alt td
    {
      color:#000000;
      background-color:#EAF2D3;
    }
    #customers>tr>td:hover {
      background-color: #00ee00;
    }
  </style>
</head>
<body>
<div class="back" >
  <div class="top">
    <div id="user">
      <a  href="#" class="easyui-linkbutton "  iconCls="icon-ok" style="width:70px;height:32px" > 登录</a>
      <a  href="#" class="easyui-linkbutton" iconCls="icon-man" style="width:70px;height:32px" > 注册</a>
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
      <div data-options="name:'bolg'">博客</div>
      <div data-options="name:'username'">用户名</div>
    </div>
  </div>
  <div class="blog" >
    <table id="customers">
      <tr>
        <th>标题</th>
        <th>发布时间</th>
        <th>访问数</th>
        <th>编辑</th>
        <th>删除</th>
      </tr>
      <tr class="alt">
        <td>Alfreds Futterkiste</td>
        <td>Maria Anders</td>
        <td>Germany</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Berglunds snabbköp</td>
        <td>Christina Berglund</td>
        <td>Sweden</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Centro comercial Moctezuma</td>
        <td>Francisco Chang</td>
        <td>Mexico</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Ernst Handel</td>
        <td>Roland Mendel</td>
        <td>Austria</td>
        <td>编辑</td>
        <td>删除</td>
      </tr >
      <tr class="alt">
        <td>Island Trading</td>
        <td>Helen Bennett</td>
        <td>UK</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Königlich Essen</td>
        <td>Philip Cramer</td>
        <td>Germany</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Laughing Bacchus Winecellars</td>
        <td>Yoshi Tannamuri</td>
        <td>Canada</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Magazzini Alimentari Riuniti</td>
        <td>Giovanni Rovelli</td>
        <td>Italy</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>North/South</td>
        <td>Simon Crowther</td>
        <td>UK</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
      <tr class="alt">
        <td>Paris spécialités</td>
        <td>Marie Bertrand</td>
        <td>France</td>
        <td>编辑</td>
        <td>删除</td>
      </tr>
    </table>
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