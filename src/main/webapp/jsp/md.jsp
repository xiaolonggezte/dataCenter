<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>实验室编辑页面</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../markdown_editor/css/editormd.css">

    <%--<link rel="icon" href="img/6.jpg">--%>
</head>

<body>

<script src="../showdown-master/bin/showdown.js"></script>
<script>

    function compile(){
        var text = document.getElementById("content").value;
        var converter = new showdown.Converter();
        var html = converter.makeHtml(text);
        document.getElementById("result").innerHTML = html;
    }
</script>
</body>

</html>