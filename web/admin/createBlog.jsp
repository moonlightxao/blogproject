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
    <title>gxblog--编写博客</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/utf8-jsp/ueditor.all.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/createblog.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function submitData(){
            var title = $("#title").val();
            var content = UE.getEditor('editor').getContent();
            var se = $("#auth").val();
            if(title == null || title == ''){
                $.messager.alert("系统提示","博客标题不能为空");
                return;
            }
            else if(content == null || content == ''){
                $.messager.alert("系统提示","博客内容不能为空");
                return;
            }
            if(se == null){
                se = 1;
            }
            $.post("${pageContext.request.contextPath}/Blog/createBlog",{'title':title,'content':content,'blogAbstract':UE.getEditor("editor").getContent().substr(0,100)+"......",'authority':se},
                function(data){
                    if(data.success){
                        $.messager.alert("系统提示","博客编写成功！","info",function(){
                            location.href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${user.userId}";
                        });
                    }else{
                        $.messager.alert("系统提示","博客编写失败！");
                    }
                },"json"
            );
        }
    </script>
    <script type="text/javascript"></script>
</head>
<body>
<div class="top">
    <div id="user">
        <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${user.userId}" title="返回个人主页" class="easyui-tooltip">${user.nickname}</a>
    </div>
    <div  id="logo" align="right">
        <a href="${pageContext.request.contextPath}/">
            <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
        </a>
    </div>
</div>
<div id="content">
    <input id="con" type="hidden" value='${blogContent}'>
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