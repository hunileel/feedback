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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/webuploader.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/upload.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zoomify.min.css">
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.12.0.min.js "></script>
	<script type="text/javascript" src="<%=basePath%>/js/upload.js "></script>
	<script type="text/javascript" src="<%=basePath%>/js/longPolling.js "></script>
</head>
<body>
<div class="container" style="width:80%;">
    <br/>
    <div class="layui-button layui-icon"><button  class="layui-btn layui-icon-return" onclick="clickme();"></button></div>
    <br/>
    <!-- 文章标题概要 -->
    <h3><center>『 反馈内容详情 』</center></h3>
    <br/>
    <!-- 添加Markdown的容器 -->
    <div id="content">
        <div > <textarea>${article.fb_content}</textarea></div>
        <br/>
        <!-- 图片 -->
							<div class="example"
								style="margin-left: 85px; margin-bottom: 20px;">
								<table>
									<tr>
										<c:if test="${article.pic1!=null }">
											<td><img src="/upload/${article.pic1}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic2!=null }">
											<td><img src="/upload/${article.pic2}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic3!=null }">
											<td><img src="/upload/${article.pic3}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${article.pic4!=null }">
											<td><img src="/upload/${article.pic4}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic5!=null }">
											<td><img src="/upload/${article.pic5}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic6!=null }">
											<td><img src="/upload/${article.pic6}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${article.pic7!=null }">
											<td><img src="/upload/${article.pic7}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic8!=null }">
											<td><img src="/upload/${article.pic8}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic9!=null }">
											<td><img src="/upload/${article.pic9}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
								</table>
							</div>
    </div>
    <hr style="height: 3px;border: none;background-color: #ddd;background-image: repeating-linear-gradient(-45deg, #fff, #fff 4px, transparent 4px, transparent 8px);"/>
    <div style="border-left: 3px solid #f44336;">
        <br/>
         <div style="margin-bottom:8px;">
             &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">用户名：&nbsp;&nbsp;</strong>
             <span style="font-size:16px;">${article.fb_name}</span>
         </div>
        <div style="margin-bottom:8px;">
            &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">反馈时间：&nbsp;&nbsp;</strong>
            <span style="font-size:16px;">${article.fb_date}</span>
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size:18px;">版权声明：&nbsp;&nbsp;</strong>
            <span style="font-size:16px;">本项目所有解释权归<strong>南晧智能有限公司</strong>所有</span>
        </div>
        <br/>
    </div>
    <br/>
    <br/>
    <br/>
    <div style="margin:0 4% 0 4%;">
        <br/>
        <!-- 留言的表单 -->
        <form class="layui-form" action="<%=basePath%>/feedback/saveReply.do" method="post">
        	<input name="re_name" value="${sessionScope.name}" hidden="hidden"/>
            <input name="re_date" value="<%=nowDate%>" hidden="hidden"/>
            <input name="re_for_words" value="${article.fb_id}" hidden="hidden"/>
					<textarea id="re_content" class="form-control" rows="4"
						style="border: 1px; resize: none; width: 100%; background-color: #eee"
						name="re_content"></textarea>
					<div id="uploader-demo">
						<div class="webuploader-container">
							<!--用来存放item-->
							<div id="fileList" class="uploader-list"></div>
							<div id="sendButtom" style="flex: auto;">
								<div id="one" style="float: left; margin-left: 40%;">
									<div id="filePicker" class="webuploader-pick form-control">选择图片</div>
									<input type="file" name="file"
										class="webuploader-element-invisible" multiple="multiple"
										accept="image/*"> <label
										style="cursor: pointer; background: rgb(255, 255, 255);"></label>
								</div>
								<div id="two" style="float: left;">
									<button  type="submit"
										class="form-control btn btn-success">回复</button>
								</div>
							</div>
						</div>
					</div>
				</form>
        
        <br/>
        <!-- 留言信息列表展示 -->
        <div>
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${requestScope.lw_list}" var="words">
                    <!-- 如果留言信息是在本文章下的才显示 -->
                    <c:if test="${words.fb_id eq article.fb_id}">
                        <li style="border-top: 1px dotted #01AAED">
                            <br/>
                            <div style="text-align: left;color:#444">
                                <div>
                                    <span style="color:#01AAED">${words.fb_name}</span>
                                </div>
                                <div>${words.fb_content}</div>
                                <!-- 图片 -->
							<div class="example"
								style="margin-left: 85px; margin-bottom: 20px;">
								<table>
									<tr>
										<c:if test="${article.pic1!=null }">
											<td><img src="/upload/${article.pic1}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic2!=null }">
											<td><img src="/upload/${article.pic2}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic3!=null }">
											<td><img src="/upload/${article.pic3}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${article.pic4!=null }">
											<td><img src="/upload/${article.pic4}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic5!=null }">
											<td><img src="/upload/${article.pic5}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic6!=null }">
											<td><img src="/upload/${article.pic6}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${article.pic7!=null }">
											<td><img src="/upload/${article.pic7}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic8!=null }">
											<td><img src="/upload/${article.pic8}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${article.pic9!=null }">
											<td><img src="/upload/${article.pic9}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
								</table>
							</div>
                            </div>
                            <div>
                                <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                    <span>${words.fb_date}</span>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>
                                        <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                    </p>
                                    <hr style="margin-top: 7px;"/>
                                </div>
                                <!-- 回复表单默认隐藏 -->
                                <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                    <form action="<%=basePath%>/feedback/saveReply.do" method="post" class="layui-form">
                                        <input name="re_for_article_id" id="re_for_article_id" value="${article.fb_id}" hidden="hidden"/>
                                        <input name="re_name" id="re_name" value="${sessionScope.name}" hidden="hidden"/>
                                        <input name="re_date" id="re_date" value="<%=nowDate%>" hidden="hidden"/>
                                        <input name="re_for_name" id="re_for_name" value="${words.fb_name}" hidden="hidden"/>
                                        <input name="re_for_words" id="re_for_words" value="${words.fb_id}" hidden="hidden"/>
                                        <input name="re_for_reply" id="re_for_reply" value="${reply.re_id}" hidden="hidden"/>
                                        <div class="layui-form-item">
                                            <textarea name="re_content" id="re_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- 以下是回复信息 -->
                            <c:forEach items="${requestScope.lr_list}" var="reply">
                                <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                <c:if test="${reply.re_for_words eq words.fb_id}">
                                    <div style="text-align: left;margin-left:61px;color: #444">
                                        <div>
                                            <span style="color:#5FB878">${reply.re_name}&nbsp;&nbsp;</span>
                                        </div>
                                        <div>@${reply.re_for_name}:&nbsp;&nbsp; ${reply.re_content}</div>
                                    </div>
                                    <div>
                                        <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                            <!-- 图片 -->
							<div class="example"
								style="margin-left: 85px; margin-bottom: 20px;">
								<table>
									<tr>
										<c:if test="${reply.pic1!=null }">
											<td><img src="/upload/${reply.pic1}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${reply.pic2!=null }">
											<td><img src="/upload/${reply.pic2}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${reply.pic3!=null }">
											<td><img src="/upload/${reply.pic3}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${reply.pic4!=null }">
											<td><img src="/upload/${reply.pic4}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${reply.pic5!=null }">
											<td><img src="/upload/${reply.pic5}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${reply.pic6!=null }">
											<td><img src="/upload/${reply.pic6}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${reply.pic7!=null }">
											<td><img src="/upload/${reply.pic7}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${reply.pic8!=null }">
											<td><img src="/upload/${reply.pic8}"
												style="width: 130px; height: 130px"></td>
										</c:if>
										<c:if test="${reply.pic9!=null }">
											<td><img src="/upload/${reply.pic9}"
												style="width: 130px; height: 130px"></td>
										</c:if>
									</tr>
								</table>
							</div>
							<div><span>${reply.re_date}</span></div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>
                                                <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                            </p>
                                            <hr style="margin-top: 7px;"/>
                                        </div>
                                        <!-- 回复表单默认隐藏 -->
                                        <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                            <form action="<%=basePath%>/feedback/saveReply.do" method="post" class="layui-form">
                                                <input name="re_for_article_id" id="re_for_article_id" value="${article.fb_id}" hidden="hidden"/>
                                                <input name="re_name" id="re_name" value="${sessionScope.name}" hidden="hidden"/>
                                                <input name="re_date" id="re_date" value="<%=nowDate%>" hidden="hidden"/>
                                                <input name="re_for_name" id="re_for_name" value="${words.fb_name}" hidden="hidden"/>
                                                <input name="re_for_words" id="re_for_words" value="${words.fb_id}" hidden="hidden"/>
                                                <input name="re_for_reply" id="re_for_reply" value="${reply.re_id}" hidden="hidden"/>
                                                <div class="layui-form-item">
                                                    <textarea name="re_content" id="re_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;">
                                                      @${words.fb_name}:&nbsp;&nbsp;
                                                  </textarea>
                                                </div>
                                                <div class="layui-form-item">
                                                    <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
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
<script type="text/javascript">
    	
    	function clickme(){
    		window.history.go(-1);
    	}
    </script>
<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/jquery-3.3.1.js "></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/bootstrap.js "></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.js "></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.zh-CN.js "></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/date.js "></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/jquery.flexText.js "></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/webuploader.js"></script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/js/comment.js"></script>
</html>
