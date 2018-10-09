<%--
  Created by IntelliJ IDEA.
  User: acm-icpc
  Date: 18-10-6
  Time: 下午9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>实验中心</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">大数据学院实验中心</div>
        <ul class="layui-nav layui-layout-right">
                游客
            <c:if test="${ userName eq null or userName eq 'null'}">
                <li id="login" class="layui-nav-item">
                    <a href="javascript:;">
                    游客请登录
                    </a>
                </li>
            </c:if>

            <%--管理员--%>
            <c:if test="${ userName ne null && userName ne 'null'}" >
                    <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                            ${userName} &nbsp;&nbsp;欢迎您
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="">基本资料</a></dd>
                        <dd><a href="">安全设置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="/accounts/loginout">注销</a></li>
            </c:if>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">实验中心介绍</a>
                    <dl class="layui-nav-child">
                        <%--<dd><a href="javascript:;">列表一</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表二</a></dd>--%>
                        <%--TODO 增加admin限制--%>
                            <c:if test="${ userName ne null && userName ne 'null'}" >
                            <dd><a href="javascript:;">编辑</a></dd>
                        </c:if>
                        <%--<dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">资产管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">设备使用情况</a></dd>
                        <dd><a href="javascript:;">设备查询</a></dd>
                        <%--TODO admin限制--%>
                        <c:if test="${ userName ne null && userName ne 'null'}" >
                            <dd><a href="javascript:;">导入资产数据</a></dd>
                            <dd><a href="javascript:;">编辑资产数据</a></dd>
                            <dd><a href="javascript:;">设备清单查询</a></dd>
                        </c:if>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">资源使用情况</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">课表查询</a></dd>
                        <dd><a href="javascript:;">查询设备归还情况</a></dd>
                        <%--TODO admin限制--%>
                        <c:if test="${ userName ne null && userName ne 'null'}" >
                            <dd><a href="javascript:;">导入课表</a></dd>
                            <dd><a href="javascript:;">编辑课表</a></dd>
                            <dd><a href="javascript:;">设备归还管理</a></dd>
                        </c:if>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div id="matter_login" style="display: none">
            <jsp:include page="login.jsp"></jsp:include>
        </div>

    </div>

    <div class="layui-footer" align="center">
        <!-- 底部固定区域 -->
        Version 1.0 || Developed & Design By Lazines
    </div>
</div>
<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    $(document).ready(function () {

        $("#login").click(function () {
            document.getElementById("matter_login").style.display = "block";
        });
    });
</script>
</body>
</html>