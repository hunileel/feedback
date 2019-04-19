<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <div class="layui-button layui-icon"><button  class="layui-btn layui-icon-return" onclick="clickme();"></button></div>
    <br/>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>${pro.nName}</strong></span>
    </h5>
     <form class="layui-form form-inline" action="<%=basePath%>/protype/toSecpro.do?nId=${pro.nId}" role="form" method="post">
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="margin-left: 50px;">
                            <button class="layui-btn" type="submit">添加问题</button>
                        </div>
                    </div>
     </form>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
            	<th style="text-align: center">编号</th>
                <th style="text-align: center">问题标题</th>
                <c:if test="${sessionScope.identity_id ne 4}">
                	<th style="text-align: center;">状态</th>
                    <th style="text-align: center;">操作</th>
                </c:if>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${requestScope.page.beanList}" var="article">
              <c:if test="${article.nId eq pro.nId}">
                <tr>
                	<td >${article.scId}</td>
                    <td >${article.scName}</td>
                    <c:if test="${sessionScope.identity_id ne 4}">
                    <td>
                            <c:if test="${article.hotPro eq 0}">
                                		非热点
                            </c:if>
                            <c:if test="${article.hotPro eq 1}">
                                <label style="color: #FF5722">热点问题</label>
                            </c:if>
                        </td>
                        <td>
                        <a href="<%=basePath%>/protype/toDetail.do?scid=${article.scId}"><button type="button" class="layui-btn layui-btn-sm">查看</button></a>
                        <a href="<%=basePath%>/protype/setHotpro.do?scid=${article.scId}&pageCode=${requestScope.page.pageCode}"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">热点</button></a>
                        <button type="button" onclick="return clean(${article.scId},${pro.nId});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                        </td>
                    </c:if>
                </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <form class="listForm" name="listForm" method="post" action="<%=basePath%>/protype/findByPage.do">
        <div class="row">
            <div class="form-inline" style="margin-left: 15px;">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize">
                        <option value="10"
                                <c:if test="${requestScope.page.pageSize == 10}">selected</c:if> >10
                        </option>
                        <option value="5"
                                <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                        </option>
                        <option value="15"
                                <c:if test="${requestScope.page.pageSize == 15}">selected</c:if> >15
                        </option>
                        <option value="20"
                                <c:if test="${requestScope.page.pageSize == 20}">selected</c:if> >20
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/protype/findByPage.do?pageCode=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.page.pageCode > 2}">
                            <a href="<%=basePath%>/protype/findByPage.do?pageCode=${requestScope.page.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.page.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.page.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.pageCode - 1}"/>
                            <c:set var="end" value="${requestScope.page.pageCode + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.page.totalPage}">
                                <c:set var="begin" value="${requestScope.page.totalPage -4}"/>
                                <c:set var="end" value="${requestScope.page.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.page.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.page.pageCode}">
                            <li>
                                <a href="<%=basePath%>/protype/findByPage.do?pageCode=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                            <a href="<%=basePath%>/protype/findByPage.do?pageCode=${requestScope.page.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=basePath%>/protype/findByPage.do?pageCode=${requestScope.page.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    //删除
    function clean(scId,nId){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？（问题将保存在回收站中）',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $.ajax({
                    url: '<%=basePath%>/protype/clean.do',
                    type: 'POST',
                    data: {scId: scId,
                    	   nId	:nId    
                    },
                    success: function(data){
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }
    
</script>
<script>
layui.use(['form', 'layedit', 'laydate','element','jquery'], function() {
var form = layui.form,
layer = layui.layer,
element=layui.element,
$=layui.jquery;
$(document).on('click','#1btn',function(){
layer.prompt();
});
});
</script>
<script>
    layui.use(['layer', 'form', 'jquery'], function() {
        layui.$(document).on('click', '#btn', function() {
            var name =  document.getElementById("name").innerText;
            var id = document.getElementById("id").innerText;
            layui.layer.prompt({
                title: '请输入新大类名称',
                value: name,
                id: id,
            }, function(value) {
            	 var name =  document.getElementById("name").innerText;
                 var id = document.getElementById("id").innerText;
                layui.$.ajax({
                    url: '<%=basePath%>/protype/update.do',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        nName: document.getElementById("name").innerText,
                        nId: document.getElementById("id").innerText
                    },
                    complete: function(xhr, textStatus) {
                        //called when complete
                    },
                    success: function(data, textStatus, xhr) {
                        layui.layer.closeAll();
                        layui.layer.msg(data.msg);
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        layui.layer.msg('网络错误!');
                    }
                });

            })
        });
    });
    </script>
    <script type="text/javascript">
    	
    	function clickme(){
    		window.history.go(-1);
    	}
    </script>
</html>
