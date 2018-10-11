<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>内容查看</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div id="content_view_jsp">
    　　<textarea id = "md" style="display:none;" placeholder="markdown语言"># Test


        </textarea>
</div>

<script src="../markdown_editor/examples/js/jquery.min.js"></script>
<script src="../markdown_editor/lib/marked.min.js"></script>
<script src="../markdown_editor/lib/prettify.min.js"></script>
<script src="../markdown_editor/lib/raphael.min.js"></script>
<script src="../markdown_editor/lib/underscore.min.js"></script>
<script src="../markdown_editor/lib/sequence-diagram.min.js"></script>
<script src="../markdown_editor/lib/flowchart.min.js"></script>
<script src="../markdown_editor/lib/jquery.flowchart.min.js"></script>
<script src="../markdown_editor/editormd.js"></script>

<script>
    $(function () {
        // 将temp.md的内容加载到content.jsp中
        $.ajax({
            url: "./temp.md",
            async:false,
            success: function(md){
                // alert(md);
                document.getElementById("md").innerHTML = md;
            }
        });

        editormd.markdownToHTML("content_view_jsp", {
            htmlDecode      : "style,script,iframe",
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true  // 默认不解析
        });
    });

</script>
</body>
</html>

