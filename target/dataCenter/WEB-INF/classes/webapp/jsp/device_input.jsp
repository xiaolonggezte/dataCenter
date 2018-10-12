<%--
  User: acm-icpc
  Date: 18-10-8
  Time: 下午11:34
  资产导入
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>device_input</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="layui-upload" align="center">
    <button type="button" class="layui-btn layui-btn-normal" id="select_file">选择文件</button>
    <button type="button" class="layui-btn" id="upload_file">开始上传</button>
</div>

<script src="../layui/layui.js" charset="utf-8"></script>
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
</body>
</html>