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