<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息</title>
<%
      pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> -->
<script src="${APP_PATH}/jquery/jquery.min.js"></script>
<!-- 三个重要文件之一 -->
<link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css">
<link rel="stylesheet" href="${APP_PATH}/font-awesome/css/font-awesome.css">
<!-- 三个重要文件之一 -->
<link rel="stylesheet" href="${APP_PATH}/css/main.css">
<link rel="stylesheet" href="${APP_PATH}/css/animate.min.css">

<!-- 三个重要文件之一 -->
<script src="${APP_PATH}/layui/layui.js"></script>
<script src="${APP_PATH}/js/main.js"></script>
</head>
<body>
<div class="layui-body">
<form class="layui-form" action="zhuce" method="post" enctype="multipart/form-data">
  
   <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
			  <div class="layui-form-item">
			    <label class="layui-form-label">用户名</label>
			    <div class="layui-input-inline">
			      <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" value=${user.username }>
			    </div>
			  </div>
			  
			   <div class="layui-form-item">
			    <label class="layui-form-label">姓名</label>
			    <div class="layui-input-inline">
			      <input type="text" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" value=${user.name }>
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <label class="layui-form-label">年龄</label>
			    <div class="layui-input-inline">
			      <input type="text" name="age" required  lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">${user.age }</input>
			    </div>
			  </div>
			   <div class="layui-form-item">
			    <label class="layui-form-label">手机号码</label>
			    <div class="layui-input-inline">
			      <input type="text" name="birthday" required  lay-verify="required" placeholder="请输入出生年月" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-inline">
			      <input type="radio" name="sex" value="男" title="男">
			      <input type="radio" name="sex" value="女" title="女" checked>
			    </div>
			  </div>
  		</div>
  	</div>
   <div class="layui-form-item">
    <label class="layui-form-label">头像</label>
    <div class="layui-input-inline">
     	<input type="file" name="file"/>
    </div>
  </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" >修改</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>

</form>
  </div>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});


</script>
</div> 

</body>
</html>
