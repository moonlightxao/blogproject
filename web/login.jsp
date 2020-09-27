<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:21
  To change this template use File | Settings | File Templates.
  这个页面用来登录
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个性化博客登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/aboutaccount.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var name =document.forms["login"]["username"].value;
            var pwd =document.forms["login"]["password"].value;
            if (name ==null || name =="")
            {
                $.messager.alert("登录提示","用户名不能为空！");
                return false;
            }else if (pwd ==null || pwd =="")
            {
                $.messager.alert("登录提示","密码不能为空！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div id="logo" align="left">
    <a href="${pageContext.request.contextPath}/">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo">
    </a>
</div>
<div align="center">
    <div id="layout1"></div>
    <form  name="login" class="easyui-panel " action="${pageContext.request.contextPath}/login" title="登录" onsubmit="return validateForm()" style="width:100%;max-width:400px;padding:30px 60px;" method="post">
        <h2> ${message}</h2>
        <tr >
            <td> <input name="username" class="easyui-textbox boxwidth" label="用户名:" labelPosition="top" data-options="prompt:''" > </td>
        </tr>
        <tr >
        <td > <input name="password" class="easyui-textbox boxwidth" label="密码:" labelPosition="top" type="password"></td>
        </tr>

        <input name="remember" value="on"  type="hidden">
        <tr>
            <td> <input href="javascript:void(0)" value="登录"  onsubmit="center()" class="easyui-linkbutton login"  type="submit" ></td>
            <td> <a href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton create" iconCls="icon-man" >注册</a></td>
            <td> <a href="verifyAccount.jsp" class="easyui-linkbutton forget" iconCls="icon-help"  >忘记密码</a></td>
        </tr>
    </form>
</div>
</body>
</html>