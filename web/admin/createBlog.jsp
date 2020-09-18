<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:24
  To change this template use File | Settings | File Templates.
  这个页面用来编写博客
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>编写博客</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function submitData(){
            var title = $("#title").val();
            var content = UE.getEditor('editor').getContent();
            var se = $("#auth").val();
            if(title == null || title == ''){
                alert("标题不能为空");
            }
            else if(content == null || content == ''){
                alert("内容不能为空");
            }
            if(se == null){
                se = 1;
            }
            $.post("${pageContext.request.contextPath}/Blog/createBlog",{'title':title,'content':content,'blogAbstract':UE.getEditor("editor").getContent().substr(0,100)+"......",'authority':se},
                function(data){
                    if(data.success){
                        $.messager.alert("系统提示","博客编写成功！");
                    }else{
                        $.messager.alert("系统提示","博客编写失败！");
                    }
                },"json"
            );
        }
    </script>
    <script type="text/javascript"></script>
</head>

<style>
    body {
        width:95%;
        height:100% ;
        overflow:auto;
        background: #f0f4ff;
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
    #content {
        padding:10px 10px 20px 10px ;
        width: 1024px;
        margin: 0 auto;
    }
    #blog_title {
        overflow: hidden;
        border-style: solid;
        border-color: gainsboro;
        border-width: 1px;
        width: 1024px;
    }
    #lead {
        font-weight: 700;
        padding: 5px;
        float: left;
        width: 10%;
        background-color: white;
        border-right-color: #00a0e9;
        border-right-width: 1px;
        border-right-style: solid;
    }
    #title {
        padding: 5px;
        float: right;
        border:0;
        outline: none;
        width: 90%;
    }
    #bottom {
        overflow: hidden;
        width: 1024px;
        border-style: solid;
        border-color: gainsboro;
        border-width: 1px;
        background-color: white;
    }
    #right {
        float: left;
        font-weight: 600;
    }
    #select {
        float: left;
    }
    #output {
        float: right;
        align-content: center;
    }
    #output>a {
        align-content: center;
        height: 25px;
        width: 100%;
    }
</style>
<body>
<div class="top">
    <div id="user">
        <a href="${pageContext.request.contextPath}/Homepage/toHomepage" title="返回个人主页" class="easyui-tooltip">${user.nickname}</a>
    </div>
    <div  id="logo" align="right">
        <a href="index.jsp">
            <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
        </a>
    </div>
</div>
<div id="content">
    <input id="con" type="hidden" value="${blogContent}">
    <div id="blog_title" >
        <span id="lead">博客标题:</span>
        <span id="title_box"><input type="text" id="title" name="title"  value="${blogTitle}"></span>
    </div>
    <div>
        <script id="editor" type="text/plain" style="width: 1024px;height: 500px;"></script>
    </div>
    <div id="bottom">
        <div id="right">访问权限:</div>
        <div id="select">
            <select  id="auth"  >
                <option value="1">所有人可见</option>
                <option value="0">仅自己可见</option>
            </select>
        </div>
        <div id="output">
            <a href="javascript:submitData()" class="easyui-linkbutton" iconCls="icon-ok">发布博客</a>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    //实例化ueditor编辑器
    var ue = UE.getEditor("editor");
    ue.ready(function(){
        ue.setContent($("#con").val());
    });
</script>
</html>