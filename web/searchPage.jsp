<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Category - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.8.6/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mycss/searchblog.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/jquery.easyui.min.js"></script>
</head>
<body>
<div class="back">
    <div class="top">
        <div id="user">
            <c:if test="${rememberMe == false}">
                <a id="login" href="${pageContext.request.contextPath}/toLogin" class="easyui-linkbutton "  iconCls="icon-ok"  > 登录</a>
                <a id="create" href="${pageContext.request.contextPath}/toCreateAccount" class="easyui-linkbutton" iconCls="icon-man" > 注册</a>
            </c:if>
            <c:if test="${rememberMe == true}">
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
                ">这里需要用户名</a>
                <img src="/userImageLink/${imageLink}">
                <div id="tool">
                    <div id="toolbar">
                        <li><a href="${pageContext.request.contextPath}/toManageAccount?usrId=${usrId}" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true">账号设置</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout" class="easyui-linkbutton"  data-options="iconCls:'icon-no',plain:true">退出登录</a></li>
                    </div>
                </div>
            </c:if>
        </div >
        <div id="logo">
            <a href="${pageContext.request.contextPath}/" >
                <img src="${pageContext.request.contextPath}/jquery-easyui-1.8.6/themes/icons/logo.png" alt="logo"   />
            </a>
        </div>
    </div>
    <div align="center">
        <div style="margin:20px 0;"></div>
        <input class="easyui-searchbox" data-options="labelPosition:'left',prompt:'搜索',searcher:doSearch"  style="width:300px">
    </div>
    <script>
        function doSearch(value){
            var url = "${pageContext.request.contextPath}/Blog/searchBlog?value="+value;
            window.location.href= url;
        }
    </script>
    <div>
        <div class="blog" align="center">
            <h3 style="text-align: left"> 搜索结果:</h3>
            <c:forEach var="iMap" items="${map}">
                <div class="main">
                    <div id="title" align="left" >
                        <h4><a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.key.blogId}"><span style="margin: 0">${iMap.key.title}</span></a></h4>
                    </div>
                    <div align="left" style="margin: 0" >
                        <span style="margin: 0">${iMap.key.blogAbstract}</span> <a href="${pageContext.request.contextPath}/Blog/toShowBlog?bid=${iMap.key.blogId}" id="all">阅读全文</a>
                    </div>
                    <div align="right">
                        <span id="time_nick"> 创建时间: ${iMap.key.time}&nbsp;&nbsp;&nbsp;用户昵称:${iMap.value}</span>
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
                                    <a href="${pageContext.request.contextPath}/Blog/searchBlog?value=${keyword}&page=1" aria-label="First">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                <c:set var="exitId" value="1"></c:set>
                            </c:if>
                            <c:if test="${pageBean.totalPage != 1}">
                                <c:if test="${pageBean.page == 1 && i == 0}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/Blog/searchBlog?value=${keyword}&page=1" aria-label="First">
                                            <span aria-hidden="true">首页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${pageBean.page != 1 && i == 0}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/Blog/searchBlog?value=${keyword}&page=${pageBean.page-1}" aria-label="Previous">
                                            <span aria-hidden="true">上一页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${i != 0 && i != pageBean.totalPage + 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/Blog/searchBlog?value=${keyword}&page=${i}">
                                            <span aria-hidden="true">第${i}页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${i == pageBean.totalPage + 1 && pageBean.page == pageBean.totalPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/Blog/searchBlog?value=${keyword}&page=${pageBean.page}" aria-label="Last">
                                            <span aria-hidden="true">尾页</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${i == pageBean.totalPage + 1 && pageBean.page != pageBean.totalPage}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/Blog/searchBlog?value=${keyword}&page=${pageBean.page + 1}" aria-label="Next">
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