<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>Auto height - Editor.md examples</title>
    <link rel="stylesheet" href="../markdown_editor/examples/css/style.css" />
    <link rel="stylesheet" href="../markdown_editor/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
</head>
<body>
<div id="layout">
    <header>
        <h1>markdown编辑首页内容</h1>
        编辑之前，可以参考<a href="https://www.appinn.com/markdown/">markdown语法文档</a>
    </header>
    <div class="btns" align="left">
        <button id="insert-btn">导入</button>
        <button id="save-btn">保存</button>
    </div>
    <div id="content_edit_jsp">
                <textarea style="display:none;"># 大数据学院实验中心


####  计算机实习基地
-  说明1说明说明1说明说明1说明说明1说明说明1说明说明1说明
    * ------------------------------------------------
    * -------------------------------------------------------
-  说明2
-  说明3

#### 微机原理及硬件实验室
- 说明1
- 说明2
- 说明3

#### 软件实验室
- 说明1
- 说明2
- 说明3

#### 网络工程实验室
- 说明1
- 说明2
- 说明3

#### 物联网工程实验室
- 说明1
- 说明2
- 说明3

#### 智能交通互联网实验室
- 说明1
- 说明2
- 说明3

#### 数字媒体实验室
- 说明1
- 说明2
- 说明3

#### 虚拟现实实验室
- 说明1
- 说明2
- 说明3

#### 综合工程训练专业实验室
- 说明1
- 说明2
- 说明3

</textarea>
    </div>
</div>
<script src="../markdown_editor/examples/js/jquery.min.js"></script>
<script src="../markdown_editor/editormd.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {
        testEditor = editormd("content_edit_jsp", {
            width           : "90%",
            autoHeight      : true,
            path            : "../markdown_editor/lib/",
            htmlDecode      : "style,script,iframe",
            tex             : true,
            emoji           : true,
            taskList        : true,
            flowChart       : true,
            sequenceDiagram : true
        });

        $("#insert-btn").click(function(){
            $.get("./temp.md", function(md){
                testEditor.appendMarkdown(md);
            });
        });

        $("#save-btn").click(function(){
            var content = encodeURIComponent(testEditor.getMarkdown());
            // alert(content);
            $.ajax({
                type:"POST",
                url: "/content/update",
                data: {"content":content},
                async:false,
                success: function(){
                    console.log("success");
                },
                error: function(XMLHttpRequest,msg) {
                    console.log(msg);
                }
            });
            alert("保存成功");
        });
    });

</script>

</body>
</html>