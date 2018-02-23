<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘淘商城后台管理系统</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/taotao.css" />
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
	.content {
		padding: 10px 10px 10px 10px;
	}
</style>
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
        url : url,  
        data : form,  
        type : 'post',  
        processData:false,  
        contentType:false,  
        success : function(data){  
            alert("成功")  
        },  
        error : function(data){  
              
        }  
    });  
}  
</script>
</body>
</html>