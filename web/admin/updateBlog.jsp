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
    <title>修改博客</title>
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
            var bid = $("#bd").val();
            var vi = $("#vi").val();
            if(title == null || title == ''){
                alert("标题不能为空");
            }
            if(content == null || content == ''){
                alert("内容不能为空");
            }
            if(se == null){
                se = 1;
            }
            $.post("${pageContext.request.contextPath}/Blog/updateBlog",{'blogId':bid,'title':title,'content':content,'blogAbstract':UE.getEditor("editor").getContent().substr(0,70)+"....",'visited':vi,'au':se},
                function(data){
                    if(data.success){
                        $.messager.alert("系统提示","博客修改成功！");
                    }else{
                        $.messager.alert("系统提示","博客修改失败！");
                    }
                },"json"
            );
        }
    </script>
    <script type="text/javascript"></script>
</head>

<style>
    body {
        background: #f0f4ff;
    }
</style>

<body style="width:95%;height:100% ;overflow:auto">
<div style="padding:10px 10px 20px 10px">

    <input id="vi" type="hidden" value="${vis}">
    <input id="bd" type="hidden" value="${blogNum}">
    <input id="con" type="hidden" value='${blogContent}'>
    <table cellpadding="5"  style="font-size: 14px">
        <tr>
            <td>博客标题:</td>
            <td><input type="text" id="title" name="title" value='${blogTitle}'></td>
        </tr>
        <tr>
            <td>博客内容:</td>
            <td><script id="editor" type="text/plain" style="width: 100%;height: 500px;"></script></td>
        </tr>
        <tr>
            <td>访问权限</td>
            <td>
                <select id="auth">
                    <option value="1">所有人可见</option>
                    <option value="0">仅自己可见</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><a href="${pageContext.request.contextPath}/Homepage/toHomepage">返回个人主页面</a></td>
            <td><a href="javascript:submitData()" >保存修改</a></td>
        </tr>
    </table>
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