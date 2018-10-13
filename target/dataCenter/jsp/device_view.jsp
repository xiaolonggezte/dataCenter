<%--资产编辑代码- 管理员--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>资产查看</title>
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
    搜索仪器编号：
    <div class="layui-inline">
        <input class="layui-input" name="deviceNumber" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="demo_view" lay-filter="device_edit"></table>


<script src="../layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
                {field: 'deviceUnitId', title: '领用单位', align: 'center'},
                {field: 'deviceUnitName', title: '领用单位名称', align: 'center', },
                {field: 'deviceCategoryNumber', title: '分类号', align: 'center',sort:true},
                {field: 'deviceName', title: '仪器名称', align: 'center'},
                {field: 'deviceVersion', title: '仪器型号', align: 'center'},
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
            ,id: 'testReload'
        });
        var $ = layui.$, active = {
            reload: function() {
                var demoReload = $('#demoReload');
                // alert("reload");
                // alert(demoReload.val());
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        deviceNumber : demoReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            // alert("click");
            var type = $(this).data('type');
            // alert(type + "   ---->    " + active[type]);
            active[type] ? active[type].call(this) : '';
        });
    });
</script>

</body>
</html>