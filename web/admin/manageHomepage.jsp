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
    <title>更改个人模板</title>
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
                ">这里需要昵称</a>
            <img src="/userImageLink/${imageLink}">
        </div>
        <div id="tool">
            <div id="toolbar">
                <li><a href="${pageContext.request.contextPath}/" class="easyui-linkbutton"  data-options="iconCls:'icon-man',plain:true">个人主页</a></li>
                <li><a href="${pageContext.request.contextPath}/toManageAccount?usrId=${usrId}" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true">账号设置</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="easyui-linkbutton"  data-options="iconCls:'icon-no',plain:true">退出登录</a></li>
            </div>
        </div>
        <div  id="logo" >
            <a href="${pageContext.request.contextPath}/">
                <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   >
            </a>
        </div>
    </div>
    <div id="main" align="center">
        <form name="modelNum">
            <h1>模板列表</h1>
            <div  class="box" >
                <div class="model">
                    <div class="picture">
                        <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background2.jpg" alt="logo" width="220px">
                    </div>
                    <div class="info">
                        <li>[名称] red_autumnal_leaves</li>
                        <li>[标题]红叶</li>
                        <li>[简介]红白简约，一份暖心，一份宁静。</li>
                    </div>
                </div>
                <div align="left"> <input  class="easyui-radiobutton" name="model" value="1"> <span class="usemodel">选用该模板</span></div>
            </div>
            <div class="box">
                <div class="model">
                    <div class="picture">
                        <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background2.jpg" alt="logo" width="220px">
                    </div>
                    <div class="info">
                        <li>[名称] red_autumnal_leaves</li>
                        <li>[标题]红叶</li>
                        <li>[简介]红白简约，一份暖心，一份宁静。</li>
                    </div>
                </div>
                <div align="left"><input class="easyui-radiobutton " name="model" value="2"> <span class="usemodel">选用该模板</span></div>
            </div>
            <div class="box">
                <div class="model">
                    <div class="picture">
                        <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background2.jpg" alt="logo" width="220px">
                    </div>
                    <div class="info">
                        <li>[名称] red_autumnal_leaves</li>
                        <li>[标题]红叶</li>
                        <li>[简介]红白简约，一份暖心，一份宁静。</li>
                    </div>
                </div>
                <div align="left"><input class="easyui-radiobutton" name="model" value="3">  <span class="usemodel">选用该模板</span></div>
            </div>
            <div class="box" >
                <div class="model">
                    <div class="picture">
                        <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/background2.jpg" alt="logo" width="220px">
                    </div>
                    <div class="info">
                        <li>[名称] red_autumnal_leaves</li>
                        <li>[标题]红叶</li>
                        <li>[简介]红白简约，一份暖心，一份宁静。</li>
                    </div>
                </div>
                <div align="left"><input class="easyui-radiobutton" name="model" value="4"> <span class="usemodel">选用该模板</span> </div>
            </div>
            <td > <input  value="使用选定模板"   class="easyui-linkbutton comfirm"  type="submit" ></td>
        </form>
    </div>

</div>
<div class="bottom">
    <div id="friend_link" >
        <h5> 友情链接:</h5> <a href="#">百度云</a> &nbsp; <a href="#">阿里云</a> &nbsp; <a href="#">华为云</a>
        &nbsp; <a href="#">腾讯云</a> &nbsp; <a href="#">菜鸟教程</a> &nbsp; <a href="#">Bootstrap</a> &nbsp; <a href="#">jQuery</a> &nbsp; <a href="#">网易云</a>
    </div>
    <div id="communication">
        <h5>联系我们:</h5>
        <li>电话:13251266359</li>
        <li>邮箱:2675935418@qq.com</li>
    </div>
</div>
</body>
</html>
