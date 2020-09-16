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
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var username = document.forms["manageAccount"]["username"].value;
            var nickname =document.forms["manageAccount"]["nickname"].value;
            var password1 = document.forms["manageAccount"]["password1"].value;
            var password2 = document.forms["manageAccount"]["password2"].value;
            var realname = document.forms["manageAccount"]["realname"].value;
            var phone = document.forms["manageAccount"]["phone"].value;
            var birthday = document.forms["manageAccount"]["birthday"].value;
            if (username ==null || username =="")
            {
                alert("用户名必须填写！");
                return false;
            } else if (nickname ==null || nickname =="")
            {
                alert("请输入昵称！");
                return false;
            }else if (password1 ==null || password1 =="")
            {
                alert("密码不能为空！");
                return false;
            }else if (password2 ==null || password2 =="")
            {
                alert("需要再次输入密码！");
                return false;
            }else if (realname ==null || realname=="")
            {
                alert("真实姓名必须填写！");
                return false;
            }else if (phone ==null || phone =="")
            {
                alert("电话不能为空！");
                return false;
            }else if (birthday ==null || birthday =="")
            {
                alert("生日不能为空！");
                return false;
            }else if (password1 !=password2)
            {
                alert("两次密码输入不同！");
                return false;
            }
        }
    </script>
</head>
<style>
    body {
        background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background2.jpg");
        background-repeat: no-repeat;
        background-size: 100%;
    }
    .easyui-panel {
        background-image: url("${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background1.jpg");
    }
</style>
<body>
<div  align="right">
    <a href="#">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
    </a>
</div>
<div align="center">
    <div style="margin:20px 0;"></div>
    <form name="manageAccount"  class="easyui-panel center" title="信息修改" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method="get">
        <tr style="margin-bottom:20px">
            <input name="username" class="easyui-textbox" label="用户名:" labelPosition="top"  style="width:100%;"value="username">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="nickname" class="easyui-textbox" label="昵称:" labelPosition="top"  style="width:100%;" value="nickname">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="password1" class="easyui-textbox" label="新密码:" labelPosition="top" data-options="prompt:'请输入6-12位密码'" style="width:100%;"type="password" >
        </tr>
        <tr style="margin-bottom:20px">
            <input name="password2" class="easyui-textbox" label="再次输入密码:" labelPosition="top"  style="width:100%;"type="password">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="realname" class="easyui-textbox" label="真实姓名:" labelPosition="top" style="width:100%;" value="realname">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="phone" class="easyui-textbox" label="电话号码:" labelPosition="top" style="width:100%;" value="phone">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="birthday" class="easyui-textbox" label="生日:" labelPosition="top" style="width:100%;"type="date" value="birthday">
        </tr>
        <tr>
            <td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td><input  value="注册" class="easyui-linkbutton"  style="width:30%;height:32px" type="submit" >
        </tr>
    </form>
</div>
</body>
</html>
