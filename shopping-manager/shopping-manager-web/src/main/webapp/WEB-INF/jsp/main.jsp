<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>主体首页</title>
<%@ include file="layui.jsp"%>
</head>
<body>
<center><h1>欢迎使用天天批发市场管理系统</h1></center>
<center>
<div class="layui-carousel" id="test1">
  <div carousel-item>
    <div><img src="images/1.jpeg"></div>
    <div><img src="images/2.jpeg"></div>
    <div><img src="images/3.jpeg"></div>
    <div><img src="images/4.jpeg"></div>
  </div>
</div>
</center>
<!-- 条目中可以是任意内容，如：<img src=""> -->
 
<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
    ,width: '50%' //设置容器宽度
    ,height:'500'
    ,arrow: 'always' //始终显示箭头
    //,anim: 'updown' //切换动画方式
  });
});
</script>
</body>
</body>
</html>