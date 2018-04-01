<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="layui.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>

 .layui-icon {
            margin-top: 6px !important;
 }
</style>
</head>
<body>
<div class="layui-body">


	<table>
	
		<tr>
			<td><img width="300" height="300" data-img="1" src="../images/${result.path}" /></td>
			<td>
				<p>${result.description }</p>
				<p>${result.sellpoint }</p>
				<p>价格：${result.money }元</p>
				<p><button type="submit" class="layui-btn" >购买</button></p>
			</td>
		</tr>

	</table>
		
			
</div>
<script src="layui/layui.js"></script>

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
</body>

</html>