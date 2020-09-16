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
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="../../jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var password = document.forms["changePwd"]["password"].value;
            var password1 = document.forms["changePwd"]["password1"].value();

            if(password == null||password1 == null){
                alert("密码不能为空！");
                return  false;
            }
            if(password != password1) {
                alert("两次输入的密码不同！")
                return false;
            }
        }
    </script>
</head>
<body>
<div align="center">
    <div style="margin:20px 0;"></div>
    <form name="changePwd" action="${pageContext.request.contextPath}/changePwd"  class="easyui-panel center" title="注册" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method="post">
        <input type="hidden" name="username" value="${userName}">
        <tr style="margin-bottom:20px">
            <input  name="password" type="password"class="easyui-textbox" label="密码:" labelPosition="top" data-options="prompt:'请输入6-12位密码'" style="width:100%;"type="password">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="password1" class="easyui-textbox" label="再次输入密码:" labelPosition="top"  style="width:100%;"type="password">
        </tr>
        <tr>
            <td>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td><input  value="注册" class="easyui-linkbutton"  style="width:30%;height:32px" type="submit" >
        </tr>
    </form>
</div>
</body>
</html>

