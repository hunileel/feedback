<!DOCTYPE html>
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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
	<title>customer service</title>
	<style type="text/css">
	*{
		    margin: 0;
		    padding: 0;
		}
		html,body{
		    height: 100%;
		}
		#container{
		    /*保证footer是相对于container位置绝对定位*/
		    position:relative;  
		    width:100%;
		    min-height:100%; 
		    /*设置padding-bottom值大于等于footer的height值，以保证main的内容能够全部显示出来而不被footer遮盖；*/  
		    padding-bottom: 100px;  
		    box-sizing: border-box;
		}
		footer{
		 width: 100%;
		height:100px;   /* footer的高度一定要是固定值*/ 
		position:absolute;
		bottom:0px;
		left:0px;
		display: flex;
  		 font-size: .20rem;
  		 height: .9rem;
  		 line-height: .7rem;
  		 border-top: .02rem solid #dcdee2;
		}
	.m-btn-wrapper{
			width: 100%;
			display: flex;
			padding: 10px 25px 10px 25px;
            margin-left: 2px;
            border-radius: 4px;
            background: #FFF;
            color: #333;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/customer.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/iconfont.css">
	<script type="text/javascript">
		function setHtmlFontSize() {
			var deviceWidth = document.documentElement.clientWidth;
			if(deviceWidth > 640) deviceWidth = 640;
			document.documentElement.style.fontSize = deviceWidth / 6.4 + 'px';
		}
		setHtmlFontSize()
		window.addEventListener('resize', setHtmlFontSize)
	</script>
</head>
<body>
	<div id="container">
	<header>
		<a class="u-header-logo iconfont icon-icon-dd" href="javascript:history.back(-1)"></a>
		<p class="u-header-title">问题反馈</p>
	</header>
	<article>
		<section>
			<!-- 留言信息列表展示 -->
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${requestScope.listWord}" var="words">
                    <!-- 如果留言信息是在本文章下的才显示 -->
                        <li >
                                 <span >&nbsp;${words.fb_name}:</span>
                                 <div>&nbsp;&nbsp;${words.fb_content}</div>
                                 <!-- 图片 -->
							<div class="example"
								style="margin-left: 85px; margin-bottom: 20px;">
								<table>
									<tr>
										<c:if test="${words.pic1!=null }">
											<td><img src="/upload/${words.pic1}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${words.pic2!=null }">
											<td><img src="/upload/${words.pic2}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${words.pic3!=null }">
											<td><img src="/upload/${words.pic3}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${words.pic4!=null }">
											<td><img src="/upload/${words.pic4}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${words.pic5!=null }">
											<td><img src="/upload/${words.pic5}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${words.pic6!=null }">
											<td><img src="/upload/${words.pic6}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${words.pic7!=null }">
											<td><img src="/upload/${words.pic7}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${words.pic8!=null }">
											<td><img src="/upload/${words.pic8}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${words.pic9!=null }">
											<td><img src="/upload/${words.pic9}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
								</table>
							</div>
                        </li>
                   <ul>
                   <c:forEach items="${requestScope.listRepl}" var="reply" >
                                <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                <c:if test="${reply.re_for_words eq words.fb_id}" >
                                     <li >   
                                        <div>
                                            <span style="color:#5FB878">${reply.re_name}:&nbsp;&nbsp;</span>
                                        </div>
                                        <div>${reply.re_for_name}&nbsp;&nbsp; ${reply.re_content}</div>
                                        <!-- 图片 -->
							<div class="example"
								style="margin-left: 85px; margin-bottom: 20px;">
								<table>
									<tr>
										<c:if test="${reply.pic1!=null }">
											<td><img src="/upload/${reply.pic1}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${reply.pic2!=null }">
											<td><img src="/upload/${reply.pic2}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${reply.pic3!=null }">
											<td><img src="/upload/${reply.pic3}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${reply.pic4!=null }">
											<td><img src="/upload/${reply.pic4}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${reply.pic5!=null }">
											<td><img src="/upload/${reply.pic5}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${reply.pic6!=null }">
											<td><img src="/upload/${reply.pic6}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
									<tr>
										<c:if test="${reply.pic7!=null }">
											<td><img src="/upload/${reply.pic7}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${reply.pic8!=null }">
											<td><img src="/upload/${reply.pic8}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${reply.pic9!=null }">
											<td><img src="/upload/${reply.pic9}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
								</table>
							</div>
                                        </li>
                                </c:if>
                            </c:forEach>
                            </ul>
                </c:forEach>
            </ul>
		</section>
	</article>
	<footer><div class="m-btn-wrapper">
			<button class="active" style="border:1px solid #CCC;" onclick="window.location.href = 'keynormal'">所有问题</button>
			<button style="border:1px solid #CCC;" onclick="window.location.href = 'toSreply'">继续反馈</button>
		</div>
		</footer>
		</div>
</body>
<script type="text/javascript "
		src="<%=basePath%>/js/zoomify.js"></script>
	<script type="text/javascript">
		$('.example img').zoomify();
		
		// 长轮询
		$.ajax(getNotice);
	</script>
</html>