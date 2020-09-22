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
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var uname =document.forms["login"]["username"].value;
            var pwd =document.forms["login"]["password"].value;
            if (uname ==null || uname =="")
            {
                alert("用户名必须填写！");
                return false;
            }else if (pwd ==null || pwd =="")
            {
                alert("密码不能为空！");
                return false;
            }
        }
    </script>
    <style>
        body {
            background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background2.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .easyui-panel {
            background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background1.jpg");
        }
        #logo>a>img {
            width: 100px;
        }
    </style>
</head>
<body>
<div id="logo" align="left">
    <a href="#">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
    </a>
</div>
<div align="center">
    <form  name="login" action="${pageContext.request.contextPath}/login" class="easyui-panel " title="登录" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method = "post">
        <tr style="margin-bottom:20px">
            <td> <input name="username" class="easyui-textbox" label="用户名:" labelPosition="top" data-options="prompt:''" style="width:100%;"> </td>
        </tr>
        <tr style="margin-bottom:20px">
        <td > <input name="password" class="easyui-textbox" label="密码:" labelPosition="top" style="width:100%;"type="password"></td>
        </tr>

        <input id="remember" name="remember" value="on"  type="hidden">
        <tr>
            <td> <input value="登录"  class="easyui-linkbutton"  style="width:25%;height:32px" type="submit" ></td>
            <td> <a href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" style="width:25%;height:32px" >注册</a></td>
            <td> <a href="verifyAccount.jsp" class="easyui-linkbutton" iconCls="icon-help" style="width:40%;height:32px" >忘记密码</a></td>
        </tr>
    </form>
</div>
</body>
</html>