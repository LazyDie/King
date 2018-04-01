<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/base1.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/psearch20131008.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/psearch.onebox.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/pop_compare.css" media="all" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<style>

 .layui-icon {
            margin-top: 6px !important;
 }
</style>
</head>
<body>
<form action="selectAllCommodity" method="get">
	<button type="submit" class="layui-btn" >查看</button>
</form>

<div class="m psearch " id="plist">
<ul class="list-h clearfix" tpl="2">
<c:forEach items="${list}" var="item">
<li class="item-book" bookid="11078102">
	<div class="p-img">
		<a target="_self" href="/item/${item.id}" >
			<img width="160" height="160" data-img="1" src="../images/${item.path}" />
		</a>
	</div>
	<div class="p-name">
		<a target="_blank" href="login.jsp">
			${item.description}
		</a>
	</div>
	<div class="p-price">
		<i></i>
		单价：${item.money}元
	</div>
	<div class="service">由商城发货</div>
	<div class="extra">
		<span class="star"><span class="star-white"><span class="star-yellow h5">&nbsp;</span></span></span>
	</div>
</li>
</c:forEach>
</ul>
</div>



<%-- 	<table>
		<tr>
			<c:forEach items="${list}" var="commodity">
				<td>
						<img alt="#" src="../images/${commodity.path}" width="100" height="100">
						<tr>
					<td><center>${commodity.name}</center></td>
						</tr>
					<tr>
						<td>单价：${commodity.money}￥</td>
					</tr>
				</td>
			</c:forEach>
		</tr>
		
	</table>
 --%>
<script src="layui/layui.js"></script>


<script type="text/javascript">
$(function() {
	 $.ajax({  
	        url : "/selectAllCommodity",  
	        type : "get"
	       
	    });  

});
</script>
</body>

</html>