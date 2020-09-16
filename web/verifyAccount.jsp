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
    <title>verifyAccount</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" >
        function validateForm(){
            var realname = document.forms["verifyAccount"]["realname"].value;
            var phone = document.forms["verifyAccount"]["phone"].value;
            var birthday = document.forms["verifyAccount"]["birthday"].value;
            if (realname ==null || realname=="")
            {
                alert("真实姓名必须填写！");
                return false;
            }else if (phone ==null || phone =="")
            {
                alert("电话号码不能为空！");
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
<div id="logo" align="left">
    <a href="#">
        <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo" width="260px"  >
    </a>
</div>
<div align="center">
    <form name="verifyAccount"action="${pageContext.request.contextPath}/verify" class="easyui-panel center" title="验证" style="width:100%;max-width:400px;padding:30px 60px;" onsubmit="return validateForm()" method="post">
        <tr style="margin-bottom:20px">
            <input name="realname" class="easyui-textbox" label="真实姓名:" labelPosition="top" style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="phone" class="easyui-textbox" label="电话号码:" labelPosition="top" style="width:100%;">
        </tr>
        <tr style="margin-bottom:20px">
            <input name="birthday" class="easyui-textbox" label="生日:" labelPosition="top" style="width:100%;"type="date">
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="easyui-linkbutton"  style="width:30%;height:32px">退出验证</a> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</td><input  value="提交" class="easyui-linkbutton"  style="width:30%;height:32px" type="submit" >
        </tr>
    </form>
</div>
</body>
</html>