
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
