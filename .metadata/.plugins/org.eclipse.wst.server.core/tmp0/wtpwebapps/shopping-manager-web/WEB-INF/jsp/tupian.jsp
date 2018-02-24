<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘淘商城后台管理系统</title>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</head>
<body>
  <form id="test">    
    选择文件:<input data-role="none" type="file" name="file" width="120px">    
    <button data-role="none" onclick="testUpload();">测试</button>  
</form>  
<script type="text/javascript">
function testUpload(){  
    var form = new FormData(document.getElementById("test"));  
    $.ajax({  
        url : "test",  
        data : form,  
        type : 'post',  
        processData:false,  
        contentType:false,  
        success : function(data){  
            alert("成功")  
        },  
        error : function(data){  
        	 alert("失败")  
        }  
    });  
}  
</script>
</body>
</html>