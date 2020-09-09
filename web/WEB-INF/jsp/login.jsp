<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:21
  To change this template use File | Settings | File Templates.
  这个页面用来登录
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <script type="text/javascript" >
        function validateForm(){
            var username = document.forms["login"]["username"].value;
            var password = document.forms["login"]["password"].value;
            if (username ==null || username =="")
            {
                alert("用户名必须填写！");
                return false;
            }else if (password ==null || password =="")
            {
                alert("密码不能为空！");
                return false;
            }
        }
    </script>

</head>
<body>
<form name="login"  action="LoginController" onsubmit="return validateForm()" method = "get">
    <table>
        <tr>  <td> 用户名：</td><td><input  type = "text" name = "username"> </td> </tr>
        <tr>  <td> 密码：</td><td><input  type = "password" name = "password"></td> </tr>
    </table>
    <input  type = "submit" value = "登录"> <a href="createAccount.jsp" >注册</a> <a href="verifyAccount.jsp" >忘记密码</a>
</form>
</body>
</html>