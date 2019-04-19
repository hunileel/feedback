<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>
</head>
<body>
<div class="container" style="width:80%;">
    <br/>
    <br/>
    <!-- 文章标题概要 -->
    <h3><center>『 问题大类内容详情 』</center></h3>
    <br/>
    <!-- 添加Markdown的容器 -->
    <div id="content">
        <textarea>${pro.nName}</textarea>
    </div>
    <hr style="height: 3px;border: none;background-color: #ddd;background-image: repeating-linear-gradient(-45deg, #fff, #fff 4px, transparent 4px, transparent 8px);"/>
    <div style="margin:0 4% 0 4%;">
        <br/>
        <!-- 留言的表单 -->
        <form class="layui-form" action="<%=basePath%>/protype/update.do" method="post">
            <input name="nId" value="${pro.nId}" hidden="hidden"/>
            <div class="layui-input-block" style="margin-left: 0;">
                <textarea id="nName" name="nName" placeholder="请输入你的新内容" class="layui-textarea" style="height: 150px;"></textarea>
            </div>
            <br/>
            <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                <input type="submit" class="layui-btn" value="确定">
            </div>
        </form>
        <br/>
    </div>
</div>
</body>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<!-- Markdwon富文本 -->
<script src="<%=basePath%>/static/editormd/lib/marked.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/prettify.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/raphael.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/underscore.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/editormd.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<!-- Markdown富文本 -->
<script type="text/javascript">
    var markdown;
    $(function(){
        markdown = editormd.markdownToHTML('content',{
            htmlDecode: "style,script,iframe",
            syncScrolling: 'single',
            emoji: true,
            taskList: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            codeFold: true
        });
    });
</script>
<script type="text/javascript">
    function btnReplyClick(elem) {
        var $ = layui.jquery;
        if($(this)){
        }else if(!$(this)){
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
        }
        $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
        if ($(elem).text() == '回复') {
            $(elem).text('收起')
        } else {
            $(elem).text('回复')
        }
    }
    $("#replyBtn").click(function(){
        var re_for_article_id = $("#re_for_article_id").val();
        var re_name = $("#re_name").val();
        var re_date = $("#re_date").val();
        var re_for_name = $("#re_for_name").val();
        var re_content = $("#re_content").val();
        var re_for_words = $("#re_for_words").val();
        $.ajax({
            url: '<%=basePath%>/feedback/saveReply.do',
            type: 'POST',
            data: [{
                re_for_article_id: re_for_article_id,
                re_name: re_name,
                re_date: re_date,
                re_for_name: re_for_name,
                re_content: re_content,
                re_for_words: re_for_words
            }],
            success: function(data){
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                    btn1: function(index){
                        $("body").html(data);
                    }
                });
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });
</script>

</html>
