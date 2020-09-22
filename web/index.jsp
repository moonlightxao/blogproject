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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/index.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
  <style>
  #user>a {
    /*width:70px;height:32px;*/
  }
  </style>
</head>
<body>
<div class="back" >
  <div class="top">
    <div id="user">
      <c:if test="true">
        <a id="login" href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton "  iconCls="icon-ok"  > 登录</a>
        <a  id="create" href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" > 注册</a>
      </c:if>
      <c:if test="${rememberMe == true}">
        <a id="username" href="${pageContext.request.contextPath}/" class="easyui-linkbutton "  iconCls="icon-ok" >欢迎您！</a>
      </c:if>
    </div >
    <div id="logo">
      <a href="index.jsp" >
        <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   />
      </a>
    </div>
  </div>
  <div align="center">
    <div id="layout"></div>
    <input class="easyui-searchbox" data-options="labelPosition:'left',prompt:'搜索',searcher:doSearch" >
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
        <div id="title" align="left" >
          <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.value.blogId}">${iMap.value.title}</a></h4>
        </div>
        <div align="left" style="margin: 0">
          <span style="margin: 0">${iMap.value.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.value.blogId}" id="all">阅读全文</a>
        </div>
        <div align="right">
          <span id="time_nick"> 创建时间:${iMap.value.time} &nbsp;&nbsp;&nbsp;用户昵称:${iMap.key}</span>
        </div>
      </div>
    </c:forEach>
    <div id=pagenav align="left">
    <nav aria-label="Page navigation" >
      <ul class="pagination">
        <li>
          <a href="#" aria-label="First">
            <span aria-hidden="true">首页</span>
          </a>
        </li>
        <li>
          <a href="#" aria-label="Previous">
            <span aria-hidden="true">上一页</span>
          </a>
        </li>
        <li>
          <a href="#" aria-label="Next">
            <span aria-hidden="true">下一页</span>
          </a>
        </li>
        <li>
          <a href="#" aria-label="Last">
            <span aria-hidden="true">尾页</span>
          </a>
        </li>
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