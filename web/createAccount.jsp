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
    <title>gxblog--创建账号</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/aboutaccount.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
<script type="text/javascript" >
    function validateForm(){
        var username = document.forms["verifyAccount"]["userName"].value;
        var nickname = document.forms["verifyAccount"]["nickname"].value;
        var password = document.forms["verifyAccount"]["password"].value;
        var password2 = document.forms["verifyAccount"]["password2"].value;
        var realname = document.forms["verifyAccount"]["realname"].value;
        var phone = document.forms["verifyAccount"]["phone"].value;
        var birthday = document.forms["verifyAccount"]["birthday"].value;
        var sign = document.forms["verifyAccount"]["sign"].value;
        if(username == null || username == ""){
            $.messager.alert("信息验证提示","用户名必须填写！");
            return false;
        }else if (nickname ==null || nickname=="")
        {
            $.messager.alert("信息验证提示","请输入昵称！");
            return false;
        }else if (password ==null || password=="")
        {
            $.messager.alert("信息验证提示","请输入密码！");
            return false;
        }
        else if (password2 ==null || password2=="")
        {
            $.messager.alert("信息验证提示","请再次输入密码！");
            return false;
        }else if (realname ==null || realname=="")
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
        }else if (sign ==null || sign =="")
        {
            $.messager.alert("信息验证提示","个性签名请填写！");
            return false;
        }else if (password !==password2 )
        {
            $.messager.alert("信息验证提示","两次输入密码不同！");
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
    <form name="verifyAccount"action="${pageContext.request.contextPath}/createAccount" class="easyui-panel center" enctype="multipart/form-data" title="注册" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method="post">
        <h2>${errorBuf}</h2>
        <tr>
            <input id="username" name="userName" class="easyui-textbox boxwidth" data-options="events:{blur:fun}" label="用户名:" labelPosition="top" ><span id="usernameInfo"></span>
            <script type="text/javascript">
                var fun = function(){
                    $("#username").textbox('setValue',$(this).val());
                    var username = $("#username").textbox('getText');
                    if(username == null){
                        return false;
                    }
                    $.post("${pageContext.request.contextPath}/checkUsername",{'username':username},function(data){
                        var usernameInfo = "";
                        if(data.isExit){
                            usernameInfo = "该用户名已存在，请重新输入";
                            $("#usernameInfo").css("color","red");
                        }else{
                            usernameInfo = "该用户名可以使用";
                            $("#usernameInfo").css("color","green");
                        }
                        $("#usernameInfo").html(usernameInfo);

                    },"json");
                }
            </script>
        </tr>
        <tr>
            <input name="nickname" class="easyui-textbox boxwidth" label="昵称:" labelPosition="top" >
        </tr>
        <tr>
            <input name="password" class="easyui-textbox boxwidth" label="密码:" labelPosition="top" data-options="prompt:'请输入6-12位密码'" type="password">
        </tr>
        <tr>
            <input name="password2" class="easyui-textbox boxwidth" label="再次输入密码:" labelPosition="top" type="password" >
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
            <input name="sign" class="easyui-textbox boxwidth" label="个性签名:" labelPosition="top" >
        </tr>
        <tr >
            <td>选择头像:</td><input name="imageLink" class="boxwidth" label="选择头像" labelPosition="top" type="file">
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton button" >取消注册</a></td><input  value="注册" class="easyui-linkbutton button"  type="submit" >
        </tr>
    </form>
</div>
</body>
</html>