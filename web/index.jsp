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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstraps/css/bootstrap.min.css">
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
      <c:if test="${rememberMe == false}">
          <a  href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton "  iconCls="icon-ok" style="width:70px;height:32px" > 登录</a>
          <a  href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" style="width:70px;height:32px" > 注册</a>
      </c:if>
        <c:if test="${rememberMe == true}">
            <a href="${pageContext.request.contextPath}/"   style="width:70px;height:32px">欢迎您！</a>
        </c:if>
    </div >
    <div id="logo">
      <a href="${pageContext.request.contextPath}/?page=1" >
        <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   />
      </a>
    </div>

  </div>
  <div align="center">
    <div style="margin:20px 0;"></div>
    <input class="easyui-searchbox" data-options="labelPosition:'left',prompt:'搜索',searcher:doSearch"  style="width:300px">
  </div>
  <script>
    function doSearch(value){
      var url = "${pageContext.request.contextPath}/Blog/searchBlog?value="+value;
      window.location.href= url;
    }
  </script>
  <div class="blog" align="center">
    <c:forEach var="iMap" items="${map}">
      <div class="main">
        <div id="title" align="left">
          <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.key.blogId}"><span style="margin: 0">${iMap.key.title}</span></a></h4>
        </div>
        <div align="left" style="margin: 0">
          <span style="margin: 0">${iMap.key.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.key.blogId}" id="all">阅读全文</a>
        </div>
        <div align="right">
          <span id="time_nick"> 创建时间:${iMap.key.time} &nbsp;&nbsp;&nbsp;用户昵称:${iMap.value}</span>
        </div>
      </div>
    </c:forEach>
    <div id=pagenav align="left">
      <nav aria-label="Page navigation" >
        <ul class="pagination" >
            <c:set var="exitId" value="0"></c:set>
           <c:forEach var="i" begin="0" end="${pageBean.totalPage + 1}">
               <c:if test="${pageBean.totalPage == 1 && exitId == 0}">
                   <li>
                       <a href="${pageContext.request.contextPath}/" aria-label="First">
                           <span aria-hidden="true">首页</span>
                       </a>
                   </li>
                   <c:set var="exitId" value="1"></c:set>
               </c:if>
               <c:if test="${pageBean.totalPage != 1}">
                   <c:if test="${pageBean.page == 1 && i == 0}">
                       <li>
                           <a href="${pageContext.request.contextPath}/" aria-label="First">
                               <span aria-hidden="true">首页</span>
                           </a>
                       </li>
                   </c:if>
                   <c:if test="${pageBean.page != 1 && i == 0}">
                       <li>
                           <a href="${pageContext.request.contextPath}/?page=${pageBean.page-1}" aria-label="Previous">
                               <span aria-hidden="true">上一页</span>
                           </a>
                       </li>
                   </c:if>
                   <c:if test="${i != 0 && i != pageBean.totalPage + 1}">
                       <li>
                           <a href="${pageContext.request.contextPath}/?page=${i}">
                               <span aria-hidden="true">第${i}页</span>
                           </a>
                       </li>
                   </c:if>
                   <c:if test="${i == pageBean.totalPage + 1 && pageBean.page == pageBean.totalPage}">
                       <li>
                           <a href="${pageContext.request.contextPath}/?page=${pageBean.page}" aria-label="Last">
                               <span aria-hidden="true">尾页</span>
                           </a>
                       </li>
                   </c:if>
                   <c:if test="${i == pageBean.totalPage + 1 && pageBean.page != pageBean.totalPage}">
                       <li>
                           <a href="${pageContext.request.contextPath}/?page=${pageBean.page + 1}" aria-label="Next">
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