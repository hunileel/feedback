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
	<header>
		<a class="u-header-logo iconfont icon-icon-dd" href="javascript:history.back(-1)"></a>
		<p class="u-header-title">问题反馈</p>
	</header>
	<article>
		<section class="m-btn-wrapper">
			<button class="active btn-l">意见反馈</button>
			<button class="btn-r">客服回复</button>
		</section>
		<section>
			<!-- 留言信息列表展示 -->
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${requestScope.keynormal}" var="words">
                    <!-- 如果留言信息是在本文章下的才显示 -->
                        <li >
                                 <a href="toRewordView" style="text-decoration: none;" onclick="btnRewordClick(this)">
                               ${words.fb_content}</a>
                        </li>
                   
                </c:forEach>
            </ul>
		</section>
	</article>
	<footer></footer>
</body>
</html>