<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
<%@ include file="layui.jsp"%>
</head>
<body>
<div class="layui-body">
<form class="layui-form" action="addcomdity" method="post" enctype="multipart/form-data">

<div class="layui-form-item">
    <label class="layui-form-label">类别</label>
    <div class="layui-input-block">
      <select name="city" lay-verify="required">
        <option value=""></option>
        <option value="0">百货</option>
        <option value="1">零食</option>
        <option value="2">文具</option>
        <option value="3">生活用品</option>
        <option value="4">玩具</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">商品名</label>
    <div class="layui-input-block">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入商品名称" autocomplete="off" class="layui-input">
    </div>
  </div>
 
  <div class="layui-form-item">
    <label class="layui-form-label">单价</label>
    <div class="layui-input-block">
      <input type="text" name="money" required  lay-verify="required" placeholder="请输入单价" autocomplete="off" class="layui-input">
    </div>
    <label class="layui-form-label">元</label>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">库存</label>
    <div class="layui-input-block">
      <input type="text" name="number" required  lay-verify="required" placeholder="请输入库存" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">卖点</label>
    <div class="layui-input-block">
      <input type="text" name="sellpoint" required  lay-verify="required" placeholder="请输卖点" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">商品描述</label>
    <div class="layui-input-block">
      <input type="text" name="description" required  lay-verify="required" placeholder="请输收商品描述" autocomplete="off" class="layui-input">
    </div>
  </div>


 <div class="layui-form-item">
    <label class="layui-form-label">图片</label>
    <div class="layui-input-block">
		<input type="file" name="file"/>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" >添加商品</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 
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
