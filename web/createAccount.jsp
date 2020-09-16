<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:25
  To change this template use File | Settings | File Templates.
  这个页面用来创建账号
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>createAccount</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var username = document.forms["createAccount"]["username"].value;
            var password = document.forms["createAccount"]["password"].value;
            var realname = document.forms["createAccount"]["realName"].value;
            var phone = document.forms["createAccount"]["phone"].value;
            var nickname = document.forms["createAccount"]["nickname"].value;
            var sign = document.forms["createAccount"]["sign"].value;
            var birthday = document.forms["createAccount"]["birthday"].value;
            if (username ==null || username =="")
            {
                alert("用户名必须填写！");
                return false;
            }else if (password ==null || password =="")
            {
                alert("密码不能为空！");
                return false;
            }else if (realname ==null || realname=="")
            {
                alert("真实姓名必须填写！");
                return false;
            }else if (phone ==null || phone =="")
            {
                alert("电话不能为空！");
                return false;
            }else if (nickname ==null || nickname =="")
            {
                alert("昵称必须填写！");
                return false;
            }else if (sign ==null || sign =="")
            {
                alert("请填写个性签名！");
                return false;
            }else if (birthday ==null || birthday =="")
            {
                alert("生日不能为空！");
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
<div  align="left" id="logo">
    <a href="#">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
    </a>
</div>
<div align="center">
    <form name="createAccount" action="${pageContext.request.contextPath}/createAccount" class="easyui-panel center" title="注册" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" enctype="multipart/form-data" method="post">
        <tr style="margin-bottom:20px">
            <input name="username" class="easyui-textbox" label="用户名:" labelPosition="top"  style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="password" class="easyui-textbox" label="密码:" labelPosition="top" data-options="prompt:'请输入6-12位密码'" style="width:100%;"type="password">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="realName" class="easyui-textbox" label="真实姓名:" labelPosition="top" style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="phone" class="easyui-textbox" label="电话号码:" labelPosition="top" style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="day" class="easyui-textbox" label="生日:" labelPosition="top" style="width:100%;"type="date">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="nickname" class="easyui-textbox" label="昵称:" labelPosition="top" style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="sign" class="easyui-textbox" label="个性签名:" labelPosition="top" style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="imageLink" required="required" type="file"  label="选择头像" labelPosition="top" style="width:100%;">
        </tr>
        <tr>
            <td>&nbsp; &nbsp;<a href="#" class="easyui-linkbutton"  style="width:30%;height:32px">取消注册</a>   &nbsp; &nbsp; &nbsp;</td><input  value="注册" class="easyui-linkbutton"  style="width:30%;height:32px" type="submit" >
        </tr>
    </form>
</div>
</body>
</html>