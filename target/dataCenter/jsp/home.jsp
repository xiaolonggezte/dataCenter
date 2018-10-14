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
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
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
            <jsp:include page="device_edit.jsp"></jsp:include>
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

<%--course_edit--%>

<script type="text/html" id="barDemo_course_edit">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../markdown_editor/examples/js/jquery.min.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;


        //展示已知数据
        table.render({
            elem: '#demo_course_edit'
            ,height: 420
            ,url:'/data/course'
            ,title: '资产数据表'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
            ,cellMinWidth: 100
            ,cols: [[ //标题栏
                {type: 'checkbox', fixed: 'left',width:40},
                {field: 'courseNumber', title: '课程编号', align: 'center', sort:true, fixed:'left' , width:150},
                {field: 'courseId', title: 'ID', align: 'center', sort:true},
                {field: 'courseUnit', title: '开课单位', align: 'center', width:150},
                {field: 'courseName', title: '课程名称', align: 'center', width:150},
                {field: 'courseProjectNumber', title: '项目编号', align: 'center',sort:true, width:150},
                {field: 'courseProjectName', title: '项目名称', align: 'center', width:150},
                {field: 'courseWeek', title: '周次', align: 'center'},
                {field: 'courseDay', title: '星期', align: 'center'},
                {field: 'courseNode', title: '节次', align: 'center'},
                {field: 'coursePlace', title: '地点', align: 'center', width:150, sort:true },
                {field: 'courseTecher', title: '指导老师', align: 'center'},
                {field: 'courseClass', title: '学生班级', align: 'center', edit: 'text'},
                {field: 'courseCount', title: '学生人数', align: 'center', sort:true, edit: 'text'},
                {field: 'courseIsClose', title: '是否停课', align: 'center', edit: 'text'},
                {fixed: 'right', title:'操作', toolbar: '#barDemo_course_edit', width:150,align: 'center'}
            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    // "msg": res.message, //解析提示文本
                    // "count": res.total, //解析数据长度
                    "data": res //解析数据列表
                };
            }
            ,id: 'testReload_course_edit'
        });
        var $ = layui.$, active = {
            reload: function() {
                var demoReload = $('#course_edit_courseNumber');
                // alert("reload");
                // alert(demoReload.val());
                //执行重载
                table.reload('testReload_course_edit', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        courseNumber : demoReload.val(),
                        courseWeek : $('#course_edit_courseWeek').val(),
                        coursePlace : $('#course_edit_coursePlace').val()
                    }
                });
            }
        };

        $('#course_edit_search').on('click', function(){
            // alert("click");
            var type = $(this).data('type');
            // alert(type + "   ---->    " + active[type]);
            active[type] ? active[type].call(this) : '';
        });


        //监听表格复选框选择
        table.on('checkbox(course_edit_filter)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(course_edit_filter)', function(obj){
            layer.msg("工具条生效");
            var data = obj.data;
            if(obj.event === 'detail'){
                // layer.msg("detail");
                // alert("detail");
            } else if(obj.event === 'del') {
                layer.confirm('真的删除行么', function(index){

                    $.ajax({
                        type:'POST'
                        ,url:'/course/delete'
                        ,async:false
                        ,data:JSON.stringify(data)
                        ,dataType : 'json'
                        ,contentType : 'application/json'
                        ,success: function(){
                            console.log("success");
                            layer.msg("删除成功");
                        }
                        ,error: function(XMLHttpRequest,msg) {
                            console.log(msg);
                            layer.msg("删除成功");
                        }
                    });
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){

                layer.confirm('确认信息是否这样修改', function(index){

                    $.ajax({
                        type:'POST'
                        ,url:'/course/update'
                        ,async:false
                        ,data:JSON.stringify(data)
                        ,dataType : 'json'
                        ,contentType : 'application/json'
                        ,success: function(){
                            console.log("success");
                            layer.msg("修改成功")
                        }
                        ,error: function(XMLHttpRequest,msg) {
                            console.log(msg);
                            layer.msg("修改失败");
                        }
                    });
                    layer.close(index);
                });
            }
        });

        //监听头工具栏事件
        table.on('toolbar(course_edit_filter)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('后续加入，敬请期待');
                    break;
                case 'update':
                    layer.alert("请利用每行右侧工具栏进行逐行更改");
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除所选行么', function(index){
                            $.ajax({
                                type:'POST'
                                ,url:'/course/deleteList'
                                ,async:false
                                ,data:JSON.stringify(data)
                                ,dataType : 'json'
                                ,contentType : 'application/json'
                                ,success: function(){
                                    console.log("success");
                                    layer.msg("删除成功");
                                }
                                ,error: function(XMLHttpRequest,msg) {
                                    console.log(msg);
                                    layer.msg("删除成功");
                                }
                            });
                            layer.close(index);
                        });
                    }
                    break;
            }
        });
    });
</script>
    <%--course_input--%>

<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#select_file_course_input'
            ,url: '/course/upload'
            ,auto: false
            ,accept:'file'
            ,bindAction: '#upload_file_course_input'
            ,done: function(res){
                console.log(res);
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                } else {
                    return layer.msg('上传成功');
                }
            }
            ,error: function(res){
                // alert(res.responseText);
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });

</script>

    <%--course_view--%>


<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;


        //展示已知数据
        table.render({
            elem: '#demo_course_view'
            ,height: 420
            ,url:'/data/course'
            ,title: '资产数据表'
            ,page: true //开启分页
            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
            ,cellMinWidth: 100
            ,cols: [[ //标题栏
                {field: 'courseNumber', title: '课程编号', align: 'center', sort:true, fixed:'left', width:150},
                {field: 'courseId', title: 'ID', align: 'center', sort:true},
                {field: 'courseUnit', title: '开课单位', align: 'center', width:150},
                {field: 'courseName', title: '课程名称', align: 'center', width:150 },
                {field: 'courseProjectNumber', title: '项目编号', align: 'center',sort:true, width:150},
                {field: 'courseProjectName', title: '项目名称', align: 'center', width:150},
                {field: 'courseWeek', title: '周次', align: 'center'},
                {field: 'courseDay', title: '星期', align: 'center'},
                {field: 'courseNode', title: '节次', align: 'center'},
                {field: 'coursePlace', title: '地点', align: 'center', sort:true, width:150 },
                {field: 'courseTecher', title: '指导老师', align: 'center'},
                {field: 'courseClass', title: '学生班级', align: 'center'},
                {field: 'courseCount', title: '学生人数', align: 'center', sort:true},
                {field: 'courseIsClose', title: '是否停课', align: 'center'}
            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    // "msg": res.message, //解析提示文本
                    // "count": res.total, //解析数据长度
                    "data": res //解析数据列表
                };
            }
            ,id: 'testReload_device_view'
        });
        var $ = layui.$, active = {
            reload: function() {
                var demoReload = $('#course_view_courseNumber');
                // alert("reload");
                // alert(demoReload.val());
                //执行重载
                table.reload('testReload_device_view', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        courseNumber : demoReload.val(),
                        courseWeek : $('#course_view_courseWeek').val(),
                        coursePlace : $('#course_view_coursePlace').val()
                    }
                });
            }
        };

        $('#course_view_search').on('click', function(){
            // alert("click");
            var type = $(this).data('type');
            // alert(type + "   ---->    " + active[type]);
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

<%--device_edit--%>
<script type="text/html" id="barDemo_device_edit">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="../markdown_editor/examples/js/jquery.min.js"></script>
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
                {field: 'deviceNumber', title: '仪器编号', align: 'center', sort:true, fixed:'left', width:150},
                {field: 'deviceId', title: 'ID', align: 'center', sort:true},
                {field: 'deviceUnitId', title: '领用单位', align: 'center', width:150},
                {field: 'deviceUnitName', title: '领用单位名称', align: 'center', width:150},
                {field: 'deviceCategoryNumber', title: '分类号', align: 'center',sort:true, width:150},
                {field: 'deviceName', title: '仪器名称', align: 'center', width:150},
                {field: 'deviceVersion', title: '仪器型号', align: 'center', width:200, width:150},
                {field: 'devicePrice', title: '单价', align: 'center'},
                {field: 'deviceMenufactor', title: '生产厂家', align: 'center', width:150},
                {field: 'deviceDate', title: '购置日期', align: 'center', sort:true },
                {field: 'deviceGetter', title: '领用人', align: 'center'},
                {field: 'deviceSubject', title: '经费科目名', align: 'center', width:150},
                {field: 'deviceUseDeriction', title: '使用方向', align: 'center', sort:true},
                {field: 'deviceRoom', title: '使用房间', align: 'center', edit: 'text' ,sort:true, width:200},
                {field: 'deviceHander', title: '经手人', align: 'center'},
                {field: 'deviceStatus', title: '设备状态', align: 'center', edit: 'text'},
                {field: 'isUsed', title: '设备使用情况', align: 'center', edit: 'text'},
                {fixed: 'right', title:'操作', toolbar: '#barDemo_device_edit', width:150,align: 'center'}

            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    // "msg": res.message, //解析提示文本
                    // "count": res.total, //解析数据长度
                    "data": res //解析数据列表
                };
            }
            ,id: 'testReload_device_edit'
        });
        //监听表格复选框选择
        table.on('checkbox(device_edit_table)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(device_edit_table)', function(obj){

            var data = obj.data;
            if(obj.event === 'detail'){
                // layer.msg("detail");
                // alert("detail");
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    $.ajax({
                        type:'POST'
                        ,url:'/device/delete'
                        ,async:false
                        ,data:JSON.stringify(data)
                        ,dataType : 'json'
                        ,contentType : 'application/json'
                        ,success: function(){
                            console.log("success");
                            layer.msg("删除成功");
                        }
                        ,error: function(XMLHttpRequest,msg) {
                            console.log(msg);
                            layer.msg("删除成功");
                        }
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){

                layer.confirm('确认信息是否这样修改', function(index){

                    $.ajax({
                        type:'POST'
                        ,url:'/device/update'
                        ,async:false
                        ,data:JSON.stringify(data)
                        ,dataType : 'json'
                        ,contentType : 'application/json'
                        ,success: function(){
                            console.log("success");
                            layer.msg("修改成功")
                        }
                        ,error: function(XMLHttpRequest,msg) {
                            console.log(msg);
                            layer.msg("修改失败");
                        }
                    });
                    layer.close(index);
                });
            }
        });

        //监听头工具栏事件
        table.on('toolbar(device_edit_table)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('后续加入，敬请期待');
                    break;
                case 'update':
                    layer.alert("请利用每行右侧工具栏进行逐行更改");
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.confirm('真的删除所选行么', function(index){
                            $.ajax({
                                type:'POST'
                                ,url:'/device/deleteList'
                                ,async:false
                                ,data:JSON.stringify(data)
                                ,dataType : 'json'
                                ,contentType : 'application/json'
                                ,success: function(){
                                    console.log("success");
                                    layer.msg("删除成功");
                                }
                                ,error: function(XMLHttpRequest,msg) {
                                    console.log(msg);
                                    layer.msg("删除成功");
                                }
                            });
                            layer.close(index);
                        });
                    }
                    break;
            }
        });
        var $ = layui.$, active = {
            reload: function() {
                var demoReload = $('#device_edit_deviceNumber_query');
                // alert("reload");
                // alert(demoReload.val());
                //执行重载
                table.reload('testReload_device_edit', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        deviceNumber : demoReload.val(),
                        deviceUseDeriction : $('#device_edit_deviceDerition_query').val(),
                        deviceRoom : $('#device_edit_deviceRoom_query').val()
                    }
                });
            }
        };

        $('#device_edit_query').on('click', function(){
            // alert("click");
            var type = $(this).data('type');
            // alert(type + "   ---->    " + active[type]);
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

<%--device_input--%>

<script>

    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#select_file'
            ,url: '/device/upload'
            ,auto: false
            ,accept:'file'
            ,bindAction: '#upload_file'
            ,done: function(res){
                console.log(res);
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                } else {
                    return layer.msg('上传成功');
                }
            }
            ,error: function(res){
                // alert(res.responseText);
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });
</script>

<%--device_view--%>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //展示已知数据
        table.render({
            elem: '#demo_view'
            ,height: 420
            ,url:'/data/device'
            ,title: '资产数据表'
            ,page: true //开启分页
            // ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            // ,totalRow: true //开启合计行
            ,cellMinWidth: 100
            ,cols: [[ //标题栏
                {field: 'deviceNumber', title: '仪器编号', align: 'center', sort:true, fixed:'left' },
                {field: 'deviceId', title: 'ID', align: 'center', sort:true},
                {field: 'deviceUnitId', title: '领用单位', align: 'center',width:150},
                {field: 'deviceUnitName', title: '领用单位名称', align: 'center', width:200},
                {field: 'deviceCategoryNumber', title: '分类号', align: 'center',sort:true},
                {field: 'deviceName', title: '仪器名称', align: 'center'},
                {field: 'deviceVersion', title: '仪器型号', align: 'center', width:200},
                {field: 'devicePrice', title: '单价', align: 'center'},
                {field: 'deviceMenufactor', title: '生产厂家', align: 'center'},
                {field: 'deviceDate', title: '购置日期', align: 'center', sort:true },
                {field: 'deviceGetter', title: '领用人', align: 'center'},
                {field: 'deviceSubject', title: '经费科目名', align: 'center'},
                {field: 'deviceUseDeriction', title: '使用方向', align: 'center', sort:true},
                {field: 'deviceRoom', title: '使用房间', align: 'center',sort:true},
                {field: 'deviceHander', title: '经手人', align: 'center'},
                {field: 'deviceStatus', title: '设备状态', align: 'center'},
                {field: 'isUsed', title: '设备使用情况', align: 'center',fixed :'right'}

            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    // "msg": res.message, //解析提示文本
                    // "count": res.total, //解析数据长度
                    "data": res //解析数据列表
                };
            }
            ,id: 'testReload_device_view'
        });
        var $ = layui.$, active = {
            reload: function() {
                var demoReload = $('#device_view_deviceNumber_query');
                // alert("reload");
                // alert(demoReload.val());
                //执行重载
                table.reload('testReload_device_view', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        deviceNumber : demoReload.val(),
                        deviceUseDeriction : $('#device_view_deviceDerition_query').val(),
                        deviceRoom : $('#device_view_deviceRoom_query').val()
                    }
                });
            }
        };

        $('#device_view_query').on('click', function(){
            // alert("click");
            var type = $(this).data('type');
            // alert(type + "   ---->    " + active[type]);
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>