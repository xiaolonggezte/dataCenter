
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