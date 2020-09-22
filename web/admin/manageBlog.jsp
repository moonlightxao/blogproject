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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstraps/css/bootstrap.min.css">
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
            background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background1.jpg") ;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            padding: 15px;
            margin: 0;
            background-attachment: fixed;
        }
        .top {
            overflow: hidden;
            height: 100px;
        }
        #user {
            float: right;
        }
        #user>a {
            text-decoration: none;
        }
        #user>img {
            width: 50px;
            height: 50px;
        }
        #logo {
            float: left;
        }
        #logo>a>img {
            width: 100px;
        }
        .line {
            height: 2px;
            width: 100%;
            background-color: dimgrey;
            padding: 2px;
        }

        .nav {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            border: 1px solid #e7e7e7;
            background-color: #f3f3f3;
        }

        .nav>li {
            font-size: 15px;
            float: left;
        }

        .nav>li>a {
            display: block;
            color: #666;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .nav>li>a:hover {
            color:white;
            background-color: darkseagreen;
        }
        #user >a {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-weight: bolder;
            color: black;
            text-shadow: 5px 5px 6px rgba(0,0,0,.3);

        }
        #user >a:hover {
            text-decoration: none;
            color: #0c7cd5;
        }
        #showAllBlog
        {
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;
        }
        #showAllBlog {
            margin: 15px;
            width: 60%;
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
        a:hover {
            text-decoration: none;
        }
        #pagenav {
            width: 60%;
            padding: 10px;
            margin: 10px;
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
            <a href="#">${curUser.nickname}</a>
            <img src="/userImageLink/${curUser.imageLink}">
        </div>
        <div  id="logo" align="right">
            <a href="${pageContext.request.contextPath}/">
                <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
            </a>
        </div>
    </div>
    <div align="center" class="line"></div>
    <div>
        <ul class="nav">
            <li><a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${curUser.userId}">返回个人主页</a></li>
            <li><a href="${pageContext.request.contextPath}/Blog/toCreateBlog">修改个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/Blog/toManageBlog">更改主页模板</a></li>
        </ul>
    </div>
    <div class="bodyContent" align="center">
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
                    <td><span style="margin: 0">${blog.title}</span></td>
                    <td>${blog.time}</td>
                    <td>${blog.visited}</td>
                    <td id="verify"><a href="${pageContext.request.contextPath}/Blog/toCreateBlog?id=${blog.blogId}">编辑</a></td>
                    <td id="del"><a onclick=" return delConfirm()" href="javascript:deleteSelectBlog(${blog.blogId})" >删除</a></td>
                </tr>
            </c:forEach>
        </table>
        <div id=pagenav align="left">
            <nav aria-label="Page navigation">
                <ul class="pagination" >
                    <c:set var="exitId" value="0"></c:set>
                    <c:forEach var="i" begin="0" end="${pageBean.totalPage + 1}">
                        <c:if test="${pageBean.totalPage == 1 && exitId == 0}">
                            <li>
                                <a href="${pageContext.request.contextPath}/Blog/toManageBlog" aria-label="First">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <c:set var="exitId" value="1"></c:set>
                        </c:if>
                        <c:if test="${pageBean.totalPage != 1}">
                            <c:if test="${pageBean.page == 1 && i == 0}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Blog/toManageBlog" aria-label="First">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageBean.page != 1 && i == 0}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Blog/toManageBlog?page=${pageBean.page-1}" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${i != 0 && i != pageBean.totalPage + 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Blog/toManageBlog?page=${i}">
                                        <span aria-hidden="true">第${i}页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${i == pageBean.totalPage + 1 && pageBean.page == pageBean.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Blog/toManageBlog?page=${pageBean.page}" aria-label="Last">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${i == pageBean.totalPage + 1 && pageBean.page != pageBean.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Blog/toManageBlog?page=${pageBean.page + 1}" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </nav>
        </div>
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