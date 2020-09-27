<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 19:29
  To change this template use File | Settings | File Templates.
  这个页面用来验证账号信息，验证成功才可以修改密码
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息验证</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/aboutaccount.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var username = document.forms["verifyAccount"]["username"].value;
            var realname = document.forms["verifyAccount"]["realname"].value;
            var phone = document.forms["verifyAccount"]["phone"].value;
            var birthday = document.forms["verifyAccount"]["birthday"].value;
            if(username == null || username == ""){
                $.messager.alert("信息验证提示","用户名必须填写！");
                return false;
            }
            else if (realname ==null || realname=="")
            {
                $.messager.alert("信息验证提示","真实姓名必须填写！");
                return false;
            }else if (phone ==null || phone =="")
            {
                $.messager.alert("信息验证提示","电话号码不能为空！");
                return false;
            }else if (birthday ==null || birthday =="")
            {
                $.messager.alert("信息验证提示","生日不能为空！");
                return false;
            }
        }
    </script>
</head>
<body>
<div id="logo" align="left">
    <a href="${pageContext.request.contextPath}/">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" >
    </a>
</div>
<div align="center">
    <div id="layout1"></div>
    <form name="verifyAccount"action="${pageContext.request.contextPath}/verify" class="easyui-panel center" title="验证" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method="post">
        <h2>${errorBuf}</h2>
        <tr>
            <input name="username" class="easyui-textbox boxwidth" label="用户名:" labelPosition="top" >
        </tr>
        <tr>
            <input name="realname" class="easyui-textbox boxwidth" label="真实姓名:" labelPosition="top">
        </tr>
        <tr>
            <input name="phone" class="easyui-textbox boxwidth" label="电话号码:" labelPosition="top">
        </tr>
        <tr>
            <input name="birthday" class="easyui-textbox boxwidth" label="生日:" labelPosition="top" type="date">
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton button" >退出验证</a></td><input  value="提交" class="easyui-linkbutton button"  type="submit" >
        </tr>
    </form>
</div>
</body>
</html>