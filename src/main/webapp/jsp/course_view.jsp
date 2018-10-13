<%--资产编辑代码- 管理员--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>排课结果查看</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<div class="demoTable">
    <hr/>
    <hr/>
    搜索课程编号：
    <div class="layui-inline">
        <input class="layui-input" name="deviceNumber" id="demoReload" autocomplete="off">
    </div>
    <button id="course_view_search" class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="demo_course_view" lay-filter="device_edit"></table>


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
                {field: 'courseNumber', title: '课程编号', align: 'center', sort:true, fixed:'left' },
                {field: 'courseUnit', title: '开课单位', align: 'center'},
                {field: 'courseName', title: '课程名称', align: 'center', },
                {field: 'courseProjectNumber', title: '项目编号', align: 'center',sort:true},
                {field: 'courseProjectName', title: '项目名称', align: 'center'},
                {field: 'courseWeek', title: '周次', align: 'center'},
                {field: 'courseDay', title: '星期', align: 'center'},
                {field: 'courseNode', title: '节次', align: 'center'},
                {field: 'coursePlace', title: '地点', align: 'center', sort:true },
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
            ,id: 'testReload_course_view'
        });
        var $ = layui.$, active = {
            reload: function() {
                var demoReload = $('#demoReload');
                // alert("reload");
                // alert(demoReload.val());
                //执行重载
                table.reload('testReload_course_view', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        courseNumber : demoReload.val()
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

</body>
</html>