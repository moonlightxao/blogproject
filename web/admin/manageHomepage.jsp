<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:26
  To change this template use File | Settings | File Templates.
  这个页面是管理个人主页的页面，同样属于后台界面，需要登录才能使用
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>gxblog--更改个人页面模板</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/managehome.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
</head>
<body>
<div class="back">
    <div class="top">
        <div id="user" >
            <a id="nickname" href="javascript:void(0)" class="easyui-tooltip" data-options="
                    hideEvent: 'none',
                    content: function(){
                        return $('#toolbar');
                    },
                    onShow: function(){
                        var t = $(this);
                        t.tooltip('tip').focus().unbind().bind('blur',function(){
                            t.tooltip('hide');
                        });
                    }
                ">${nickName}</a>
            <img src="/userImageLink/${imageLink}">
        </div>
        <div id="tool">
            <div id="toolbar">
                <li><a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${usrId}&page=1" class="easyui-linkbutton"  data-options="iconCls:'icon-man',plain:true">个人主页</a></li>
                <li><a href="${pageContext.request.contextPath}/toManageAccount?usrId=${usrId}" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true">账号设置</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="easyui-linkbutton"  data-options="iconCls:'icon-no',plain:true">退出登录</a></li>
            </div>
        </div>
        <div  id="logo" >
            <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo">
            </a>
        </div>
    </div>
    <div id="main" align="center" >
        <form name="modelNum" method="post" action="${pageContext.request.contextPath}/Homepage/manageHomepage">
            <input type="hidden" name="usrId" value="${usrId}">
            <input type="hidden" name="page" value="1">
            <h1>模板列表</h1>
            <c:forEach var="page" items="${allPages}">
                <div class="box">
                    <div class="model">
                        <div class="picture">
                            <img src="${pageContext.request.contextPath}/pageView/${page.imagelink}" alt="logo" width="220px">
                        </div>
                        <div class="info">
                            <li>[名称]${page.pageName}</li>
                            <li>[简介]${page.description}</li>
                            <li>[创建者]${page.creator}</li>
                            <li>[创建时间]${page.releaseTime}</li>
                        </div>
                    </div>
                    <div align="left"> <input  class="easyui-radiobutton" name="model" value="${page.id}"> <span class="usemodel">选用该模板</span></div>
                </div>
            </c:forEach>
            <td > <input  value="使用选定模板"   class="easyui-linkbutton comfirm"  type="submit" ></td>
        </form>
    </div>

</div>
<div class="bottom">
    <div id="friend_link" >
        <h5> 友情链接:</h5> <a href="https://cloud.baidu.com/" target="_blank">百度云</a> &nbsp; <a href="https://www.aliyun.com/" target="_blank">阿里云</a> &nbsp; <a href="https://www.huaweicloud.com/" target="_blank">华为云</a>
        &nbsp; <a href="https://cloud.tencent.com/" target="_blank">腾讯云</a> &nbsp; <a href="https://www.runoob.com/" target="_blank">菜鸟教程</a> &nbsp; <a href="https://www.bootcss.com/" target="_blank">Bootstrap</a> &nbsp; <a href="https://jquery.com/" target="_blank">jQuery</a> &nbsp; <a href="https://www.163yun.com" target="_blank">网易云</a>
    </div>
    <div id="communication">
        <h5>联系我们:</h5>
        <li>电话:13251266359</li>
        <li>邮箱:2675935418@qq.com</li>
        <li>电话:19825001749</li>
        <li>邮箱:1057294949@qq.com</li>
    </div>
</div>
</body>
</html>
