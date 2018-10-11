<%--
  User: acm-icpc
  Date: 18-10-6
  Time: 下午9:52
  主界面代码
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
    <link rel="stylesheet" href="../markdown_editor/examples/css/style.css" />
    <link rel="stylesheet" href="../markdown_editor/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
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
                    <a class="" href="javascript:;">实验中心</a>
                    <dl class="layui-nav-child">
                        <%--<dd><a href="javascript:;">列表一</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表二</a></dd>--%>
                        <%--TODO 增加admin限制--%>
                        <dd id="content_view"><a href="javascript:;">介绍说明</a></dd>
                        <c:if test="${ userName ne null && userName ne 'null'}" >
                            <dd id="content_edit"><a href="javascript:;">编辑</a></dd>
                        </c:if>
                        <%--<dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">资产管理</a>
                    <dl class="layui-nav-child">
                        <dd id="device_view"><a href="javascript:;">设备使用归还情况查询</a></dd>
                        <%--TODO admin限制--%>
                        <c:if test="${ userName ne null && userName ne 'null'}" >
                            <dd id="device_input"><a href="javascript:;">导入资产数据</a></dd>
                            <dd id="device_edit"><a href="javascript:;">资产归还查询编辑</a></dd>
                        </c:if>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">资源使用情况</a>
                    <dl class="layui-nav-child">
                        <dd id="course_view"><a href="javascript:;">课表查询</a></dd>
                        <%--TODO admin限制--%>
                        <c:if test="${ userName ne null && userName ne 'null'}" >
                            <dd id="course_input"><a href="javascript:;">导入课表</a></dd>
                            <dd id="course_edit"><a href="javascript:;">编辑课表</a></dd>
                        </c:if>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <%--<div id="m_content_edit" style="display: block">--%>
            <%--<jsp:include page="test2.jsp"></jsp:include>--%>
        <%--</div>--%>


    </div>

    <div class="layui-footer" align="center">
        <!-- 底部固定区域 -->
        Version 1.0 || Developed & Design By Lazines
    </div>
</div>

<script src="../markdown_editor/examples/js/jquery.min.js"></script>
<script src="../markdown_editor/lib/marked.min.js"></script>
<script src="../markdown_editor/lib/prettify.min.js"></script>
<script src="../markdown_editor/lib/raphael.min.js"></script>
<script src="../markdown_editor/lib/underscore.min.js"></script>
<script src="../markdown_editor/lib/sequence-diagram.min.js"></script>
<script src="../markdown_editor/lib/flowchart.min.js"></script>
<script src="../markdown_editor/lib/jquery.flowchart.min.js"></script>
<script src="../markdown_editor/editormd.js"></script>
<script src="../markdown_editor/examples/js/jquery.min.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<script>
    // $(document).ready(function () {
    //    $("#content_edit").click(function () {
    //        document.getElementById("m_content_edit").innerHTML.style.display = "block";
    //    });
    // });
</script>

<script>
    $(function () {
        // 将temp.md的内容加载到content.jsp中
        $.ajax({ url: "./temp.md",
            async:false,
            success: function(md){
                document.getElementById("md").innerHTML = md;
            }
        });

        editormd.markdownToHTML("test-editormd", {
            htmlDecode      : "style,script,iframe",
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true  // 默认不解析
        });
    });

</script>
</body>
</html>