<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 柳智添
  Date: 2020/9/3
  Time: 10:21
  To change this template use File | Settings | File Templates.
  这是博主的个人主页面，包含了分页显示的博客列表以及一些导航栏
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${owner.nickname}的个人主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <c:if test="${pageNum == 1}">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/homepage.css">
    </c:if>
    <c:if test="${pageNum == 2}">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/pagemodel/homemodel1.css">
    </c:if>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
</head>
<body>
<div class="back" >
    <div class="top">
        <div id="user">
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
                ">${owner.nickname}</a>
            <img src="/userImageLink/${owner.imageLink}">
        </div>
        <div id="tool">
            <div id="toolbar">
                <li><a href="${pageContext.request.contextPath}/toManageAccount" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true">账号设置</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="easyui-linkbutton"  data-options="iconCls:'icon-no',plain:true">退出登录</a></li>
            </div>
        </div>
        <div  id="logo" >
            <a href="${pageContext.request.contextPath}/">
                <img   src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   >
            </a>
        </div>
    </div>
    <div align="center" class="line"></div>
    <div>
        <ul class="headnav">
            <li><a href="${pageContext.request.contextPath}/">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/Blog/toCreateBlog">新随笔</a></li>
            <li><a href="${pageContext.request.contextPath}/Blog/toManageBlog?usrId=${owner.userId}&page=1">管理</a></li>
        </ul>
    </div>
    <div id="myblogbox">
    <div align="center" class="myblog">
        <c:if test="${homepegeBlogs.size() == 0}">
            <h3>这个人非常懒，还没有写任何博客哦！</h3>
        </c:if>
        <c:forEach var="homepageBlog" items="${homepegeBlogs}">
            <div class="main" onclick="location.href='${pageContext.request.contextPath}/Blog/toShowBlog?bid=${homepageBlog.blog.blogId}'">
                <div id="title" align="left">
                    <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${homepageBlog.blog.blogId}">${homepageBlog.blog.title}</a></h4>
                </div>
                <div class="child_line">

                </div>
                <div align="left">
                    摘要:<span>${homepageBlog.blog.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${homepageBlog.blog.blogId}" id="all">阅读全文</a>
                </div>
                <div align="right">
                    <span id="time_nick"> ${homepageBlog.time}</span> &nbsp;&nbsp;&nbsp;<span>${owner.nickname}</span>
                </div>
            </div>
        </c:forEach>
        <div id=pagenav align="left">
            <nav aria-label="Page navigation">
                <ul class="pagination" >
                    <c:set var="exitId" value="0"></c:set>
                    <c:forEach var="i" begin="0" end="${pageBean.totalPage + 1}">
                        <c:if test="${pageBean.totalPage == 1 && exitId == 0}">
                            <li>
                                <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}" aria-label="First">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <c:set var="exitId" value="1"></c:set>
                        </c:if>
                        <c:if test="${pageBean.totalPage != 1}">
                            <c:if test="${pageBean.page == 1 && i == 0}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}" aria-label="First">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageBean.page != 1 && i == 0}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}&page=${pageBean.page-1}" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${i != 0 && i != pageBean.totalPage + 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}&page=${i}">
                                        <span aria-hidden="true">第${i}页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${i == pageBean.totalPage + 1 && pageBean.page == pageBean.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}&page=${pageBean.page}" aria-label="Last">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${i == pageBean.totalPage + 1 && pageBean.page != pageBean.totalPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/Homepage/toHomepage?usrId=${owner.userId}&page=${pageBean.page + 1}" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
    <div id="info">
        <h3>public notice </h3>
        <div>
            <li>昵称:${owner.nickname}</li>
            <li>个性签名:${owner.sign}</li>
        </div>
    </div>
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