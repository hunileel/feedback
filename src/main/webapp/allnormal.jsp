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
     <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
     <link rel="stylesheet" href="http://i.gtimg.cn/vipstyle/frozenui/2.0.0/css/frozen.css"/>
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
			.m-btn-wrapper{
			width: 100%;
			display: flex;
			border:1px solid #000；
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
		.m-btn-wrapper a{
			border: none;
			outline: none;
			text-decoration: none;
			background-color: #fff;
			border-radius: 5px;
			width: 100%;
			line-height: 30px;
			cursor: pointer;
			-webkit-tap-highlight-color: transparent;
			color: #000
		}
		.m-btn-wrapper button:active,
		.m-btn-wrapper button.active:active{
			background-color:#7B72E9 ;
		}
		.m-btn-wrapper button.active{
			background-color: #fff;
			color: #000;
		}
    </style>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/editormd/editormd.min.css"/>
</head>
<body>

<div class="Content-Main">
    <div class="Content-Main1">
        <h1>所有问题</h1>
    </div>
    <!-- 留言信息列表展示 -->
        <div>
            <ul>
                <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                <c:forEach items="${requestScope.keynormal}" var="words">
                    <!-- 如果留言信息是在本文章下的才显示 -->
                        <li >
                            <br/>
                            <div class="m-btn-wrapper" style="border-bottom:1px solid #000;">
                                 <a href="toRewordView" style="text-decoration: none;" onclick="btnRewordClick(this)">
                               ${words.fb_content}</a>
                            </div>
                        </li>
                   
                </c:forEach>
            </ul>
        </div>
        <br/>
        <br/>
        <div class="m-btn-wrapper">
			<button class="active">所有问题</button>
			<button>问题反馈</button>
		</div>
    </div>
</body>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.js"></script>
</html>
