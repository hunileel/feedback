<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="<%=basePath%>/Assets/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
            
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>完整功
  能（没错，目前工具栏只有这么多）</legend>
</fieldset>
 <form action="<%=basePath%>/protype/deatailedit" method="post">
<textarea class="layui-textarea" id="LAY_demo1" style="display: none">  
  把编辑器的初始内容放在这textarea即可
</textarea>
<input type="submit">
 <button type="button" id="publishBtn" class="layui-btn">发布</button> 
</form>

<div class="site-demo-button" style="margin-top: 20px;">
  <button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
  <button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
  <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
</div>
 
 
          
<script src="<%=basePath%>/Assets/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('layedit', function(){
  var layedit = layui.layedit
  ,$ = layui.jquery;
  
  
  layui.layedit.set({
	    uploadImage: {
	        url: '<%=basePath%>/protype/uploadImage' //接口url
	        ,type: 'post' //默认post
	    }
	});
  //构建一个默认的编辑器
  var index = layedit.build('LAY_demo');
  
  //编辑器外部操作
  var active = {
    content: function(){
      alert(layedit.getContent(index)); //获取编辑器内容
    }
    ,text: function(){
      alert(layedit.getText(index)); //获取编辑器纯文本内容
    }
    ,selection: function(){
      alert(layedit.getSelection(index));
    }
  };
  
  $('.site-demo-layedit').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
  //自定义工具栏
  layedit.build('LAY_demo1', {
    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right','unlink','image' ]
    ,height: 100
  })
});
</script>

</body>
</html>