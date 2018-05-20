<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8">
<title>货品入库</title>
<%@ include file="layui.jsp"%>
 <%-- 拿到当前项目路径 以/开始不以/结束--%>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    
        <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
            
            
    <style type="text/css">
		.input-group span {width:84px; text-align:center; display:inline-block; background:#ffffff;color:#000000;}
	</style>
</head>
<body>

<!-- 表格主体 -->


<form class="layui-form" action="supplierSelectAll" method="get">
	<div class="layui-form-item">
		<div class="layui-input-inline">
			<button type="button" class="layui-btn layui-btn" id="supplier_add_bt">导出记录</button>
		</div>
		
	</div>
</form>

   <div class="layui-form ">
               <table class="layui-table" id="commparaTable" cyType="pageGrid"
                      cyProps="url:'/commpara/list',checkbox:'true',pageColor:'#2991d9'
                      ,beforeRender:'Render.beforeRender',onCheck:'Render.onCheck',afterRender:'Render.afterRender'">
                  <thead>
                      <tr>
                            <th width="10%" param="{name:'paraId',isPrimary:'true',hide:'true'}">交易编号</th>

							<th width="10%" param="{name:'paraCode'}">货品图片</th>
							
                            <th width="10%" param="{name:'paraCode'}">货品名称</th>

                            <th width="10%" param="{name:'paraName'}">客户</th>

                            <th width="10%" param="{name:'paraKey'}">单价(元)</th>

                            <th width="10%" param="{name:'sortNo'}">数量</th>
                            
                            <th width="10%" param="{name:'sortNo'}">收入金额(元)</th>
                            
                             <th width="10%" param="{name:'paraKey'}">创建时间</th>
                            
                            <th width="10%" param="{name:'sortNo'}">操作</th>
                     
                       </tr>
                    
                  </thead>
                  <tbody>
            
                  </tbody>
               </table>
              <!-- 分页 -->
                <%--显示分页信息--%>
			    <div class="row ">
			        <%--分页文字信息--%>
			        <div class="col-md-8" id="page_info">
			
			        </div>
			        <%--分页条--%>
			        <div class="col-md-4" id="page_nav">
			
			        </div>
			    </div>
            </div>
            
        
  <script>
//Demo
layui.use(['form','laypage','upload'], function(){
  var form = layui.form;
  var laypage = layui.laypage;
  var upload = layui.upload;
  
  //执行一个laypage实例
  laypage.render({
    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
    ,count: 50 //数据总数，从服务端得到
  });
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });

  
});
 
 var totalRecord;
 var currentPage;
/* ajax请求 */
 //页面加载完成后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        to_page(1);
    });
    //根据页码显示页面
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/sales/selectAll",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                //解析并显示员工数据
                //解析并显示分页数据
                build_emp_table(result);
                build_page_info(result);
                //解析显示分页条
                build_page_nav(result);
            }
        });

    }
    //填充员工信息到表格中
    function build_emp_table(result) {
        //清空table
        $("#commparaTable tbody").empty();
        var emps = result.entend.pageInfo.list;
        $.each(emps, function (index, item) {
            var empIdTd = $("<td></td>").append(item.id);
            var supplier_id = $("<td></td>").append('<img width="50" height="50" data-img="1" src="../images/'+item.path+'"></img>');
            var empNameTd = $("<td></td>").append(item.name);
            var empGenderTd = $("<td></td>").append(item.cname)
            var empEmailTd = $("<td></td>").append(item.money);
            var detpNameTd = $("<td></td>").append(item.number);//库存成本
            var suMobile = $("<td></td>").append(item.totalmoney);
            var suCreateTime = $("<td></td>").append(item.createtime);
            
            
            
         
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_bt")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
             deleteBtn.attr("delete-id",item.id);
             deleteBtn.attr("delete-name",item.name);
             
          
             
            var btnTd = $("<td></td>").append(deleteBtn);
            /*append方法执行完成之后还是原来的元素*/
            $("<tr></tr>").append(empIdTd)
            	.append(supplier_id)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(detpNameTd)
                .append(suMobile)
                .append(suCreateTime)
                .append(btnTd)
                .appendTo("#commparaTable tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append(" 当前页码" + result.entend.pageInfo.pageNum + ",总共" + result.entend.pageInfo.pages +
            "页,总共" + result.entend.pageInfo.total + "条记录")
            totalRecord = result.entend.pageInfo.total;
        	currentPage = result.entend.pageInfo.pages;
            
    }
    //解析显示分页条
    function build_page_nav(result) {
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if (result.entend.pageInfo.hasPreviousPage == false) {
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        } else {
            prePageLi.click(function () {
                to_page(result.entend.pageInfo.pageNum - 1);
            });
            firstPageLi.click(function () {
                to_page(1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.entend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.entend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.entend.pageInfo.pages);
            });
        }
        //添加首页和前一页
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.entend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.entend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            //添加页码号
            ul.append(numLi);
        });
        //添加下一页和末页
        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        $("#page_nav").append(nav);
    }
    
	  //删除销售记录
	    $(document).on("click",".delete_bt",function(){
	  	  
	  		var supplierId = $(this).attr("delete-id");
	  	  	var supplierName = $(this).attr("delete-name");
	   		if(confirm("确定删除编号为【"+supplierId+"】的数据吗？")){
	   			$.ajax({
	   	 			url:"${APP_PATH}/goodChuKu/delete/"+supplierId,
	   	 			type:"GET",
	   	 			success :function(result){
	   	 				to_page(1);
	   	 				layer.msg('删除成功', {
	   	 				  icon: 1,
	   	 				  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	   	 				}, function(){
	   	 				  //do something
	   	 				});  
	   	 			}
	   	 		});	
	   		}
	  	  	
	    });
    
    
    //点击导出按钮
    $("#supplier_add_bt").click(function () {
    	 $.ajax({
             url: "${APP_PATH}/sale/export",
             type: "POST",
             success: function (result) {
       
             }
         });
       
    });
</script>          
</body>

</html>