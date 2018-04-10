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


<script>
//页面加载完成后，直接去发送一个ajax请求
$(function () {
    shuaxin();
});
//根据页码显示页面
function shuaxin(pn) {
    $.ajax({
        url: "${APP_PATH}/basicInfo/zhongzhuan",
        type: "GET",
        async : false, //默认为true 异步  
        success:function(date){
        	window.location.href="basicInfo/shuaxin";  
        }
    });

}
</script>
</div> 
</body>
</html>
