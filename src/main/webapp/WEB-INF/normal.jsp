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
		<p class="u-header-title">常见问题</p>
	</header>
	<article>
		<section>
			<!-- 留言信息列表展示 -->
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${requestScope.keynormal}" var="words">
                    <!-- 如果留言信息是在本文章下的才显示 -->
                        <li >
                                 <a href="toProdetail?scId=${words.scId}" style="text-decoration: none;" onclick="btnRewordClick(this)">
                               ${words.scName}</a>
                        </li>
                   
                </c:forEach>
            </ul>
		</section>
	</article>
	<footer><div class="m-btn-wrapper">
			<button class="active" style="border:1px solid #CCC;"  onclick="window.location.href = 'toAllpro'">全部问题</button>
			<button style="border:1px solid #CCC;" onclick="window.location.href = 'toText'">问题反馈</button>
		</div>
		</footer>
		</div>
</body>
</html>