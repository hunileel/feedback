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
		.m-btn-wrapper{
			width: 100%;
			display: flex;
			margin-bottom: 20px;
		}
		.m-btn-wrapper button{
			border: none;
			outline: none;
			text-decoration: none;
			background-color: #c5c8ce;
			border-radius: 5px;
			width: 50%;
			line-height: 30px;
			cursor: pointer;
			-webkit-tap-highlight-color: transparent;
			color: #fff
		}
		.m-btn-wrapper button:active,
		.m-btn-wrapper button.active:active{
			background-color:#7B72E9 ;
		}
		.m-btn-wrapper button.active{
			background-color: #fff;
			color: #000;
		}
	footer{
		display: flex;
		position:absolute;
		bottom:0;
		width:100%;
		height:100px;
		font-size: 28px;
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
	<header>
		<a class="u-header-logo iconfont icon-icon-dd" href="#"></a>
		<p class="u-header-title">问题反馈</p>
	</header>
	<article>
		<section class="m-btn-wrapper">
			<button class="active btn-l">意见反馈</button>
			<button class="btn-r">客服回复</button>
		</section>
		<section>
			<ul>
				<li>1.测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</li>
				<li class="active">2.测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</li>
			</ul>
		</section>
	</article>
	<footer><div class="m-btn-wrapper">
			<button class="active" style="border:1px solid #CCC;">所有问题</button>
			<button style="border:1px solid #CCC;">问题反馈</button>
		</div>
		</footer>
</body>
</html>