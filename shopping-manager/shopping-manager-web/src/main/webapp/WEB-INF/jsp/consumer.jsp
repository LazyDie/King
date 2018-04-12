<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8">
<title>客户页面</title>
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

<!-- 添加客户模态框 -->
<!-- Modal -->

<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">添加客户</h4>
      </div>
       <form action="goods/add" method="post" id="goodsAdd">
      <div class="modal-body">
     
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">客户编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cid" placeholder="请输入客户编号" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">客户名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="username" placeholder="请输入客户名称" class="layui-input" ></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">客户类型</span>
		  		<div class="layui-input-inline">
					<select class="form-control" name="type" id="dept_add_select" autocomplete="off">
						<option value="" selected disabled>请选择客户类型</option>
						 <option value="零售">零售</option>
						 <option value="批发">批发</option>
					</select>
				</div>
			</div>	
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12" >
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
              <div class="input-group">
		  		<span style="padding:6px 6px">联系人</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入联系人" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">手机</span>
		  		<div class="layui-input-inline">
					<input type="text" name="phone" placeholder="请输入手机号" class="layui-input"></input>
				</div>
			</div>
		  </div>
         
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="supplier_save_bt">保存</button>
      </div>
      </form>
    </div><!-- /.modal-content -->
    </div>
</div>

<!-- 修改客户模态框 -->
<!-- Modal -->

<div class="modal fade bs-example-modal-lg" id="goods_up_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">修改客户</h4>
      </div>
       <form id="goodsAdd">
      <div class="modal-body">
     
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">客户编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cid" placeholder="请输入客户编号" class="layui-input" id="c_id"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">客户名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="username" placeholder="请输入客户名称" class="layui-input" id="c_username" ></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">客户类型</span>
		  		<div class="layui-input-inline">
					<select class="form-control" name="type" id="c_type" autocomplete="off">
						<option value="" selected disabled>请选择客户类型</option>
						 <option value="零售">零售</option>
						 <option value="批发">批发</option>
					</select>
				</div>
			</div>	
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12" >
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
              <div class="input-group">
		  		<span style="padding:6px 6px">联系人</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入联系人" class="layui-input" id="c_name"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">手机</span>
		  		<div class="layui-input-inline">
					<input type="text" name="phone" placeholder="请输入手机号" class="layui-input" id="c_phone"></input>
				</div>
			</div>
		  </div>
         
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="supplier_up_bt">更新</button>
      </div>
      </form>
    </div><!-- /.modal-content -->
    </div>
</div>

<!-- 表格主体 -->

<form class="layui-form" action="supplierSelectAll" method="get">
	<div class="layui-form-item">
		<label class="layui-form-label">搜索客户</label>
		<div class="layui-input-inline">
			<input type="text" name="search" placeholder="请输入客户名称或条码" class="layui-input"></input>
		</div>
		<div class="layui-input-normal">
			<button class="layui-btn layui-btn">搜索</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
		<div class="layui-input-normal layui-layout-right">
			<!-- <button class="layui-btn layui-btn" data-toggle="modal" data-target="#myModal">新增</button> -->
			<!-- <button type="button" class="layui-btn layui-btn" data-toggle="modal" data-target="#myModal" id="supplier_add_bt">新增</button> -->
			<button type="button" class="layui-btn layui-btn" id="supplier_add_bt">添加客户</button>
			<!-- <button type="button" class="layui-btn layui-btn" >出货</button> -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		
	</div>
</form>

   <div class="layui-form ">
               <table class="layui-table" id="commparaTable" cyType="pageGrid"
                      cyProps="url:'/commpara/list',checkbox:'true',pageColor:'#2991d9'
                      ,beforeRender:'Render.beforeRender',onCheck:'Render.onCheck',afterRender:'Render.afterRender'">
                  <thead>
                      <tr>
                            <!--复选框-->
                            <!-- <th width="1%" param="{type:'checkbox'}">
                                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
                            </th> -->
                           <!--isPrimary：是否是主键-->
                            <th width="10%" param="{name:'paraId',isPrimary:'true',hide:'true'}">客户编号</th>

							<th width="15%" param="{name:'paraCode'}">客户名称</th>
							
                            <th width="15%" param="{name:'paraCode'}">客户类型</th>

                            <th width="15%" param="{name:'paraName'}">联系人</th>

                            <th width="15%" param="{name:'paraKey'}">手机</th>

                            <th width="15%" param="{name:'sortNo'}">创建时间</th>
                            
                            <th width="15%" param="{name:'sortNo'}">操作</th>
                     
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
           <!--  <div id="test1"></div> -->
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
//执行实例
//图片上传
  var uploadInst = upload.render({
    elem: '#shangchuan1', //绑定元素
 	url: '/goods/picture', //上传接口
 	type: "POST",
   	async:false,
   	cache:false,
   	processData:false,
    contentType: false,
    done: function(result){
    	 var path = result.entend.path
         $("#newsImgUrl").val(path);
         $("#showUploadImg").css("display","block");
         $("#showUploadImg").attr("src","../images/"+path).attr("width",100).attr("height",100);
    }
    ,error: function(){
      //请求异常回调
    }
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
            url: "${APP_PATH}/consumer/all",
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
            var empIdTd = $("<td></td>").append(item.cid);
            var supplier_id = $("<td></td>").append(item.username);
            var empNameTd = $("<td></td>").append(item.type);
            var empGenderTd = $("<td></td>").append(item.name)
            var empEmailTd = $("<td></td>").append(item.phone);
            var detpNameTd = $("<td></td>").append(item.createtime);
            /*<button class="btn btn-primary btn-xs">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑
             </button>*/
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_bt")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
             editBtn.attr("edit-id",item.id);
            /*button class="btn btn-danger btn-xs">
             <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
             删除
             </button>*/
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_bt")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
             deleteBtn.attr("delete-id",item.id);
             deleteBtn.attr("delete-name",item.name);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            /*append方法执行完成之后还是原来的元素*/
            $("<tr></tr>").append(empIdTd)
            	.append(supplier_id)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(detpNameTd)
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
    
    
    //点击新增按钮弹出模态框
    $("#supplier_add_bt").click(function () {
    	//清空输入框中的数据
    	 $(".layui-input").val("");
    	//隐藏图片
    	 $("#showUploadImg").css("display","none");
    	//清空内容
    	$("#newsImgUrl").val();
        //发送ajax请求，查出部门信息，显示在下拉列表
       
        //弹出模态框
        $("#myModal").modal({
            backdrop: "static"
        });
       
    });
    
    //校验
    function validate_add_form(){
    	//拿到要校验的数据，进行正则表达式校验
    	var empName = $("#goods_name").val();//获取输入框的值
    	var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/; //3到6位英文或数字，或两位中文
   		 /* var regName = /^[a-zA-Z0-9_-]{3,16}$/; */
    	alert(empName);
    	if(!regName.test(empName)){
    		alert("校验失败");
    		return false;
    	}
    	alert("校验成功");
    	return true;
    }
  //保存客户数据
    $("#supplier_save_bt").click(function () {
        //1.模态框中的数据
        
        //1.1  对输入框进行校验
     /*    if(!validate_add_form()){
        	return false;
        } */
        //2.发送ajax请求
        $.ajax({
            url: "${APP_PATH}/consumer/add",
            type: "POST",
            data: $("#myModal form").serialize(),
            success: function (result) {
                //员工保存成功
                //1.关闭模态框
                $("#myModal").modal('hide');
                //2.来到最后一页，显示数据
        		if(totalRecord%5==0){
        			to_page(currentPage+1);
        		}else{
        			to_page(currentPage);
        		}
                layer.msg('保存成功', {
	 				  icon: 1,
	 				  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	 				}, function(){
	 				  //do something
	 				}); 
            }
        });
    });
  
  //修改客户信息
  $(document).on("click",".edit_bt",function(){
	 // alert("hello");
	 //查出客户信息
	 getSupplier($(this).attr("edit-id"));
	 //把客户表中的id传递给更新按钮
	 $("#supplier_up_bt").attr("edit-id",$(this).attr("edit-id"));
	//弹出模态框
      $("#goods_up_model").modal({
          backdrop: "static"
      });
  });
  //查出客户信息
  function getSupplier(id){
	  $.ajax({
		  url:"${APP_PATH}/consumer/one/"+id,
		  type:"GET",
		  success:function(result){
			  $("#c_id").val(result.entend.entend.cid);
			  $("#c_username").val(result.entend.entend.username);
			  $("#c_type").val(result.entend.entend.type);
			  $("#c_name").val(result.entend.entend.name);
			  $("#c_phone").val(result.entend.entend.phone);
			 	 var path = result.entend.entend.path;
		         $("#newsImgUrl1").val(path);
		         $("#showUploadImg1").css("display","block");
		         $("#showUploadImg1").attr("src","../images/"+path).attr("width",100).attr("height",100);
		  }
	  });
  };
  //点击更新按钮，更新客户信息
  $("#supplier_up_bt").click(function(){
	  $.ajax({
		  url:"${APP_PATH}/consumer/update/"+$(this).attr("edit-id"),
		  type:"POST",
		  data:$("#goods_up_model form").serialize(),
		  success:function(result){
			  if(result.code==100) {
					//1.关闭模态框
	              $("#goods_up_model").modal('hide');
	              //2.来到最后一页，显示数据
	              to_page(1);
				  layer.msg('修改成功', {
	 				  icon: 1,
	 				  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	 				}, function(){
	 				  //do something
	 				}); 
				  }
			  
		  }
	  });
  });
  //删除客户信息
  $(document).on("click",".delete_bt",function(){
	  
		var supplierId = $(this).attr("delete-id");
	  	var supplierName = $(this).attr("delete-name");
 		if(confirm("确定删除【"+supplierName+"】吗？")){
 			$.ajax({
 	 			url:"${APP_PATH}/consumer/delete/"+supplierId,
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
</script>          
</body>

</html>