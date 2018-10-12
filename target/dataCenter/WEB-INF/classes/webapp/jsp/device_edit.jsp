<%--资产编辑代码- 管理员--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-hide" id="demo" lay-filter="device_edit"></table>

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
                {field: 'deviceNumber', title: '仪器编号', align: 'center', sort:true, fixed:'left' },
                {field: 'deviceUnitId', title: '领用单位', align: 'center'},
                {field: 'deviceUnitName', title: '领用单位名称', align: 'center', },
                {field: 'deviceCategory_number', title: '分类号', align: 'center',sort:true},
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
<script>
    layui.use('table', function(){
        var table = layui.table;

        //监听表格复选框选择
        table.on('checkbox(device_edit)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(device_edit)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data));
                alert(data);
            }
        });

        // var $ = layui.$, active = {
        //     getCheckData: function(){ //获取选中数据
        //         var checkStatus = table.checkStatus('idTest')
        //             ,data = checkStatus.data;
        //         layer.alert(JSON.stringify(data));
        //     }
        //     ,getCheckLength: function(){ //获取选中数目
        //         var checkStatus = table.checkStatus('idTest')
        //             ,data = checkStatus.data;
        //         layer.msg('选中了：'+ data.length + ' 个');
        //     }
        //     ,isAll: function(){ //验证是否全选
        //         var checkStatus = table.checkStatus('idTest');
        //         layer.msg(checkStatus.isAll ? '全选': '未全选')
        //     }
        // };

        // $('.demoTable .layui-btn').on('click', function(){
        //     var type = $(this).data('type');
        //     active[type] ? active[type].call(this) : '';
        // });
    });
</script>
</body>
</html>