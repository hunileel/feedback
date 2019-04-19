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
	<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
	<link rel="stylesheet" href="<%=basePath%>/static/layui/css/mian.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/zoomify.min.css">
	<script type="text/javascript" src="<%=basePath%>/js/jquery-1.12.0.min.js"></script>
</head>
<body class="lay-blog">
<div class="container-wrap">
			<div class="container container-message container-details">
   				 <div class="contar-wrap">
    <c:if test="${sessionScope.identity_id ne 4}">
        <div class="layui-inline">
        	<div class="layui-button layui-icon"><button  class="layui-btn layui-icon-return" onclick="clickme();"></button></div>
            <a href="<%=basePath%>/protype/toSecpro.do?nId=${requestScope.sec.nId}"><button type="button" id="addBtn" class="layui-btn layui-btn">修改内容</button></a>
        </div>
    </c:if>
						<div class="item">
							<div class="item-box  layer-photos-demo1 layer-photos-demo">
								<h3>${requestScope.sec.scName}</h3>
								<h5>发布于：<span>刚刚</span></h5>
								<p>${requestScope.sec.scDetaila}</p>
								<c:if test="${requestScope.sec.pic1!=null }">
											<td><img src="/upload/${requestScope.sec.pic1}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${requestScope.sec.pic2!=null }">
											<td><img src="/upload/${requestScope.sec.pic2}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${requestScope.sec.pic3!=null }">
											<td><img src="/upload/${requestScope.sec.pic3}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
									</table>
									<div>${requestScope.sec.scDetailb}</div>
									<table>
									<tr>
										<c:if test="${requestScope.sec.pic4!=null }">
											<td><img src="/upload/${requestScope.sec.pic4}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${requestScope.sec.pic5!=null }">
											<td><img src="/upload/${requestScope.sec.pic5}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${requestScope.sec.pic6!=null }">
											<td><img src="/upload/${requestScope.sec.pic6}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
									</tr>
									</table>
									<div>${requestScope.sec.scDetailc}</div>
									<table>
									<tr>
										<c:if test="${requestScope.sec.pic7!=null }">
											<td><img src="/upload/${requestScope.sec.pic7}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${requestScope.sec.pic8!=null }">
											<td><img src="/upload/${requestScope.sec.pic8}"
												style="width: 130px; height: 130px" class="zoomify"></td>
										</c:if>
										<c:if test="${requestScope.sec.pic9!=null }">
											<td><img class="zoomify" src="/upload/${requestScope.sec.pic9}"
												style="width: 130px; height: 130px" ></td>
										</c:if>
									</tr>
							</div>
						</div>
						</div>
						</div>	
	</div>					
</body>
<script type="text/javascript">
    	
    	function clickme(){
    		window.history.go(-1);
    	}
    </script>
    <script type="text/javascript "
		src="${pageContext.request.contextPath }/js/zoomify.js"></script>
	<script type="text/javascript">
		$('.example img').zoomify();
		
	</script>
</html>