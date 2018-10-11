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
        <div id="m_login" style="display: none">
            <jsp:include page="login.jsp"></jsp:include>
        </div>
        <div id="m_content_view" style="display: block">
            <jsp:include page="content_view.jsp"></jsp:include>
        </div>
        <div id="m_device_view" style="display: none">
            <jsp:include page="device_view.jsp"></jsp:include>
        </div>
        <div id="m_course_view" style="display: none">
            <jsp:include page="course_view.jsp"></jsp:include>
        </div>
        <div id="m_content_edit" style="display: none">
            <jsp:include page="content_edit.jsp"></jsp:include>
        </div>
        <div id="m_device_input" style="display: none">
            <jsp:include page="device_input.jsp"></jsp:include>
        </div>
        <div id="m_device_edit" style="display: none">
            <jsp:include page="device_edit.jsp" flush="true"></jsp:include>
        </div>
        <div id="m_course_input" style="display: none">
            <jsp:include page="course_input.jsp"></jsp:include>
        </div>
        <div id="m_course_edit" style="display: none">
            <jsp:include page="course_edit.jsp"></jsp:include>
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
    // 菜单与对应的网页的div对应的id
    var menu = new Array("login","content_view","device_view","course_view","content_edit","device_input","device_edit","course_input","course_edit");
    var action = new Array("m_login","m_content_view","m_device_view","m_course_view","m_content_edit","m_device_input","m_device_edit","m_course_input","m_course_edit");
    $(document).ready(function () {


        // 控制主题部分，当点击某一个事件的时候，将其他的部分进行隐藏，对应的部分显示
        $("#login").click(function () {
            display("login");
        });
        $("#content_view").click(function () {
            display("content_view");
        });
        $("#device_view").click(function () {
            // alert("device_view");
            display("device_view");
        });
        $("#course_view").click(function () {
            display("course_view");
        });
        $("#content_edit").click(function () {
            display("content_edit");
        });
        $("#device_input").click(function () {
            display("device_input");
        });
        $("#device_edit").click(function () {
            display("device_edit");
        });
        $("#course_input").click(function () {
            display("course_input");
        });
        $("#course_edit").click(function () {
            display("course_edit");
        });
        function display (str) {
            for(var i = 0;i < 9;i ++) {
                if(menu[i] == str) {
                    // alert(menu[i] + "   ->    " + action[i]);
                    document.getElementById(action[i]).style.display = "block";
                } else {
                    document.getElementById(action[i]).style.display = "none";
                }
            }
        }
    });
</script>

<%--device_edit.jsp的js--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        //展示已知数据
        table.render({
            elem: '#demo'
            ,height: 420
            ,url:'/data/device'
            ,title: '资产数据表'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
            ,cellMinWidth: 100
            ,cols: [[ //标题栏
                {type: 'checkbox', fixed: 'left',width:40},
                {field: 'deviceUnitId', title: '领用单位', align: 'center'},
                {field: 'deviceUnitName', title: '领用单位名称', align: 'center', },
                {field: 'deviceNumber', title: '仪器编号', align: 'center', sort:true},
                {field: 'deviceCategory_number', title: '分类号', align: 'center',sort:true},
                {field: 'deviceName', title: '仪器名称', align: 'center'},
                {field: 'deviceVersion', title: '仪器型号', align: 'center'},
                {field: 'devicePrice', title: '单价', align: 'center'},
                {field: 'deviceMenufactor', title: '生产厂家', align: 'center'},
                {field: 'deviceDate', title: '购置日期', align: 'center', sort:true },
                {field: 'deviceGetter', title: '领用人', align: 'center'},
                {field: 'deviceSubject', title: '经费科目名', align: 'center'},
                {field: 'deviceUse_deriction', title: '使用方向', align: 'center', sort:true},
                {field: 'deviceRoom', title: '使用房间', align: 'center',sort:true},
                {field: 'deviceHander', title: '经手人', align: 'center'},
                {field: 'deviceStatus', title: '设备状态', align: 'center'},
                {field: 'isUsed', title: '设备使用情况', align: 'center'},
                {fixed: 'right', title:'操作', toolbar: '#barDemo', width:150,align: 'center'}

            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    // "msg": res.message, //解析提示文本
                    // "count": res.total, //解析数据长度
                    "data": res //解析数据列表
                };
            }
            // ,data: [{
            //     "device_unit_id": "10001"
            //     ,"device_unit_name": "杜甫"
            //     ,"device_number": "xianxin@layui.com"
            //     ,"device_category_number": "男"
            //     ,"device_name": "浙江杭州"
            //     ,"device_version": "人生恰似一场修行"
            //     ,"device_price": "116"
            //     ,"device_menufactor": "192.168.0.8"
            //     ,"device_date": "108"
            //     ,"device_getter": "2016-10-14"
            //     ,"device_subject": "108"
            //     ,"device_use_deriction": "2016-10-14"
            //     ,"device_room": "108"
            //     ,"device_hander": "2016-10-14"
            //     ,"is_used": "2016-10-14"
            // }]
        });
    });
</script>

</body>
</html>