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