<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-4-30
  Time: 上午9:39
  To change this template use File | Settings | File Templates.
--%>
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
    <style type="text/css">
        .Content-Main{
            max-width: 500px;
            margin: auto;
            margin-top: 50px;
            padding: 20px 30px 20px 30px;
            font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
            text-shadow: 1px 1px 1px #FFF;
            border: 1px solid #DDD;
            border-radius: 5px;
            color: #888;
            background: #FFF;
			text-align: center;
        }
        .Content-Main h1{
            display: block;
            padding: 0px 0px 10px 40px;
            margin: -10px -30px 30px -30px;
            font: 25px "Helvetica Neue", Helvetica, Arial, sans-serif;
            border-bottom: 1px solid #DADADA;
            color: #888;
        }
        .Content-Main h1>span{
            display: block;
            font-size: 11px;
        }
        .Content-Main label{
            display: block;
            margin: 0px 0px 5px;
        }
        .Content-Main label>span{
            float: left;
            width: 20%;
            padding-right: 10px;
            margin-top: 10px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-weight: bold;
            text-align: right;
            color: #333;
        }
        .Content-Main input[type="text"],.Content-Main textarea{
            width: 70%;
            height: 20px;
            padding: 5px 0px 5px 5px;
            margin-bottom: 16px;
            margin-right: 6px;
            margin-top: 2px;
            line-height: 15px;
            border-radius: 4px;
            border: 1px solid #CCC;
            color: #888;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }
        .select1{
            width: 71%;
            height: 35px;
            margin-bottom: 16px;
            margin-right: 6px;
            margin-top: 2px;
            line-height: 15px;
            padding: 5px 0px 5px 5px;
            border-radius: 4px;
            border: 1px solid #CCC;
            color: #888;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }
        .select2{
            width: 13%;
            border-radius: 4px;
            border: 1px solid #CCC;
            color: #888;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        }
        .Content-Main textarea{
			
            width: 70%;
            height: 200px;
            padding: 50px 50px 50px 50px;
			
        }
        .button{
            padding: 10px 25px 10px 25px;
            margin-left: 111px;
            border-radius: 4px;
            border:1px solid #CCC;
            background: #FFF;
            color: #333;
        }
        .button:hover{
            color: #333;
            background-color: #EBEBEB;
            border-color: #ADADAD;
        }
		.input-wrapper input{
			background: none;
			outline: none;
			border: 0px;
			border-bottom: 1px solid #000;
		}
		
		.cube-upload-btn{
				float: left;
				margin: 0 10px 10px 0;
				position: relative;
				overflow: hidden;
				left: 70px;
				bottom: -300px;
			}
			.cube-upload-btn-def{
				width: 80px;
				height: 80px;
				box-sizing: border-box;
				background-color:#fff ;
				box-shadow: 0 0 6px 2px rgba(0,0,0,.08);
				border-radius: 2px;
				border:1px solid #AAAAAA;
				position: relative;
			}
			.cube-upload-btn-def>i:after,.cube-upload-btn-def>i:before{
				content: "";
				position: absolute;
				top: 50%;
				left: 50%;
				width: 20px;
				height: 2px;
				-webkit-transform: translate(-50%,-50%);
				transform: translate(-50%,-50%);
				background-color: #666;
			}
			.cube-upload-btn-def>i:after{
				transform: translate(-50%,-50%) rotate(90deg);
			}
			.cube-upload-input{
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				width: 100%;
				font-size: 1px;
				opacity: 0;
				border-style:solid;
		border-width:5px;s
				
			}
    </style>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>
</head>
<body>

<div class="Content-Main">
    <div class="Content-Main1">
        <h1>常见问题</h1>
    </div>
    <!-- 留言信息列表展示 -->
        <div>
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${requestScope.listWords}" var="words">
                    <!-- 如果留言信息是在本文章下的才显示 -->
                        <li style="border-top: 1px dotted #01AAED">
                            <br/>
                            <div style="text-align: left;color:#444">
                                <div>
                                    <span style="color:#01AAED">${words.fb_name}</span>
                                </div>
                                 <a href="toRewordView" style="text-decoration: none;" onclick="btnRewordClick(this)">
                                <div>${words.fb_content}</div></a>
                            </div>
                            <div>
                                <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                    <span>${words.fb_date}</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <hr style="margin-top: 7px;"/>
                                </div>
                                
                            </div>
                        </li>
                   
                </c:forEach>
            </ul>
        </div>
        
        <div style="display: flex;">
    <a href="toText">
	<div style="padding-left:150px;">
		 <input type="button" class="button" value="意见反馈"  style="margin: 0 auto; display: block;" >
    </div></a>
    <a href="toReplyView">
	<div style="margin-left: 0px;">
		 <input type="button" class="button" value="客服回复"  style="margin: 0 auto; display: block; ">
	</div></a>
	</div>
        <br/>
        
        <br/>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
</div>
</body>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<!-- Markdwon富文本 -->v
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
        var lr_for_article_id = $("#lr_for_article_id").val();
        var lr_name = $("#lr_name").val();
        var lr_date = $("#lr_date").val();
        var lr_for_name = $("#lr_for_name").val();
        var lr_content = $("#lr_content").val();
        var lr_for_words = $("#lr_for_words").val();
        $.ajax({
            url: '<%=basePath%>/article/saveReply.do',
            type: 'POST',
            data: [{
                lr_for_article_id: lr_for_article_id,
                lr_name: lr_name,
                lr_date: lr_date,
                lr_for_name: lr_for_name,
                lr_content: lr_content,
                lr_for_words: lr_for_words
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
<script type="text/javascript">
   function btnRewordClick(e) {
	   var lw_content = $("#lw_content").val();
	alert($(e).text())
	$.ajax(
	{
		type:'post',
		url:'<%=basePath%>/article/saveReply.do',
		data:'',
		dataType:'',
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
	}		
	);
}
</script>
</html>
