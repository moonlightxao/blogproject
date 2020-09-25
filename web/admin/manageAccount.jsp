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
    <title>账号设置</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/aboutaccount.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var username = document.forms["manageAccount"]["username"].value;
            var nickname =document.forms["manageAccount"]["nickname"].value;
            var password1 = document.forms["manageAccount"]["password"].value;
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
<body>
<div  align="left" id="logo">
    <a href="${pageContext.request.contextPath}/">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   >
    </a>
</div>
<div align="center">
    <div id="layout1"></div>
    <form name="manageAccount" action="${pageContext.request.contextPath}/manageAccount" class="easyui-panel center" title="信息修改" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" enctype="multipart/form-data" method="post">
        <tr >
            <input name="username" readonly="readonly" class="easyui-textbox boxwidth" label="用户名:" labelPosition="top"  value="${userName}">
        </tr>
        <tr>
            <input name="nickname" type="text" class="easyui-textbox boxwidth" label="昵称:" labelPosition="top"  >
        </tr>
        <tr >
            <input name="password" class="easyui-textbox boxwidth" label="新密码:" labelPosition="top" data-options="prompt:'请输入6-12位密码'" type="password" >
        </tr>
        <tr >
            <input name="password2" class="easyui-textbox boxwidth" label="再次输入密码:" labelPosition="top"  type="password">
        </tr>
        <tr >
            <input name="realname" class="easyui-textbox boxwidth" label="真实姓名:" labelPosition="top"  type="text">
        </tr>
        <tr >
            <input name="phone" class="easyui-textbox boxwidth" label="电话号码:" labelPosition="top"  type="text">
        </tr>
        <tr >
            <input name="birthday" class="easyui-textbox boxwidth" label="生日:" labelPosition="top" type="date" >
        </tr>
        <tr >
            <input name="sign" class="easyui-textbox boxwidth" label="个性签名:" labelPosition="top" >
        </tr>
        <tr >
            <td>选择头像:</td><input name="imageLink" class="boxwidth" label="选择头像" labelPosition="top" type="file">
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/Blog/toManageBlog?page=1" class="easyui-linkbutton button"  >退出</a> </td><input  value="确认修改" class="easyui-linkbutton button"  type="submit" >
        </tr>
    </form>
</div>
</body>
</html>
