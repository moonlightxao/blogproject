<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 19:30
  To change this template use File | Settings | File Templates.
  这个页面用来修改密码
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var newPwd = document.forms["changePwd"]["newpwd"].value;
            var newPwd2 = document.forms["changePwd"]["newpwd2"].value;
            if (newPwd==null || newPwd =="")
            {
                alert("请输入新密码！");
                return false;
            }else if (newPwd2 ==null || newPwd2 =="")
            {
                alert("请再次输入密码！");
                return false;
            }else if (newPwd!=newPwd2) {
                alert("两次密码输入不一致！");
                return false;
            }
        }
    </script>
</head>
<body>

<div style="margin:20px 0;"></div>

<form name="changePwd" class="easyui-panel center" title="修改密码" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method="get">
    <tr style="margin-bottom:20px">
        <input name="newpwd" class="easyui-textbox" label="新密码:" labelPosition="top" data-options="prompt:'请输入6-12位密码'" style="width:100%;" type="password">
    </tr>
    <tr style="margin-bottom:20px">
        <input name="newpwd2" class="easyui-textbox" label="请再次输入:" labelPosition="top"  style="width:100%;"type="password">
    </tr>
    <tr>
        <td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td><input  value="提交" class="easyui-linkbutton"  style="width:30%;height:32px" type="submit" >
    </tr>
</form>
</body>
</html>