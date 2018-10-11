
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
<div class="layui-upload" style="margin-left: 30px;margin-right: 30px;">
    <div style="margin-top: 171px;float: left;"><label class="layui-form-label">店铺图片</label></div>
    <div class="layui-upload-list" style="float: left;">
        <img class="layui-upload-img" id="demo1" style="width: 200px;height: 200px;margin: 0 10px 10px 0;">
        <p id="demoText"></p>
        <input type="hidden" name="pic" id="pic"  value="${store.pic }">

    </div>
    <div style="float: left;margin-top: 171px;"><button type="button" class="layui-btn" id="test1">上传图片</button></div>
</div>

<script src="../layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','layer','table','upload'], function(){
        var table = layui.table
            ,form = layui.form,upload = layui.upload;
        alert("one");
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/device/upload'
            // ,accept:'file'
            ,before: function(obj){
                alert("two");
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                alert("four");
                //如果上传失败
                if(res.code > 0){//自定义返回失败
                    return layer.msg('上传失败');
                }else{
                    $('#pic').val(res.img);
                }
                //上传成功
            }
            ,error: function(){
                alert("there");
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

    });

</script>
</body>
</html>