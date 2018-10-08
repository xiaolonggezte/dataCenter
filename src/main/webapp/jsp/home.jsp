<%--
  Created by IntelliJ IDEA.
  User: acm-icpc
  Date: 18-10-6
  Time: 下午9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <%--<ul class="layui-nav layui-layout-left">--%>
            <%--<li class="layui-nav-item"><a href="">控制台</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">商品管理</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">用户</a></li>--%>
            <%--<li class="layui-nav-item">--%>
                <%--<a href="javascript:;">其它系统</a>--%>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="">邮件管理</a></dd>--%>
                    <%--<dd><a href="">消息管理</a></dd>--%>
                    <%--<dd><a href="">授权管理</a></dd>--%>
                <%--</dl>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">注销</a></li>
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
                        <c:if test="{ ${user} != null}">
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
                        <dd><a href="javascript:;">导入资产数据</a></dd>
                        <dd><a href="javascript:;">编辑资产数据</a></dd>
                        <dd><a href="javascript:;">设备清单查询</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">资源使用情况</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">课表查询</a></dd>
                        <dd><a href="javascript:;">查询设备归还情况</a></dd>
                        <%--TODO admin限制--%>
                        <dd><a href="javascript:;">导入课表</a></dd>
                        <dd><a href="javascript:;">编辑课表</a></dd>
                        <dd><a href="javascript:;">设备归还管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">内容主体区域</div>
    </div>

    <div class="layui-footer" align="center">
        <!-- 底部固定区域 -->
        Version 1.0 || Developed & Design By Lazines
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>