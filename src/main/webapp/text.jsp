<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<html lang="en">
<head>
    <title>report</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
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
            margin-left: 0px;
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
		
    </style>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/customer.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/customer.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>/css/webuploader.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>/css/upload.css">
	<link rel="stylesheet" type="text/css"	href="<%=basePath%>/css/zoomify.min.css">
	<script type="text/javascript"	src="<%=basePath%>/js/jquery-1.12.0.min.js "></script>
	<script type="text/javascript"	src="<%=basePath%>/js/upload.js "></script>
	<script type="text/javascript"	src="<%=basePath%>/js/longPolling.js "></script>
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
	<section class="m-btn-wrapper">
			<button class="btn-l" disabled="disabled">意见反馈</button>
			<button class="active btn-r" onclick="window.location.href = 'toReplyView'">客服回复</button>
	</section>
	<div class="Content-Main">
    <form name="myform" action="/feedback/feedback/saveWord" method="post" class="form-report">
      <label>
      		<input name="fb_name" value="${sessionScope.name}" hidden="hidden"/>
            <input name="fb_date" value="<%=nowDate%>" hidden="hidden"/>
		<textarea class="form-control" rows="4"
			style="border: 1px; resize: none; width: 100%; background-color: #eee"
			name="weiboCustom.content" >
	   </textarea>
			<div id="uploader-demo">
					<!--用来存放item-->
				<div id="fileList" class="uploader-list"></div>
				 <div id="sendButtom" style="flex: auto;">
					<div id="one" style="float: left; margin-left: 40%; padding-bottom: 5px" >
						<div id="filePicker" class="webuploader-pick form-control">选择图片</div>
							<input type="file" name="file"
										class="webuploader-element-invisible" multiple="multiple"
										accept="image/*"> <label
										style="cursor: pointer; background: rgb(255, 255, 255);"></label>
							</div>
				 </div>
			</div>
	  </label>
		<label style="float: left;">
			<input type="checkbox" name="box" id="box" value="1" onclick="check()" >希望与ebemate工程师联系
			<label for="tel">联系电话：<input type="text" name="phonenum" id="phonenum" disabled="disabled" placeholder="15625504640"></label> 
            <input type="submit"  id="publishBtn" class="button" value="提交" >
        </label>
	 </form>
		</div>
		<footer>
		  <div class="m-btn-wrapper">
			<button class="active" style="border:1px solid #CCC;"  onclick="window.location.href = 'keynormal'">所有问题</button>
			<button style="border:1px solid #CCC;" onclick="window.location.href = 'toText'">问题反馈</button>
		  </div>
		</footer>
</body>
<script type="text/javascript"> 
function check() 
{ 
if(myform.box.checked){ 
document.getElementById("phonenum").disabled=false; 
} else{ 
document.getElementById("phonenum").disabled=true; 
 
} 
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