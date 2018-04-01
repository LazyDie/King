<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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

<!-- 模态框 -->
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">添加运营商</h4>
      </div>
      <div class="modal-body">
      <form>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">供应商编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cId" placeholder="请输入供应商编号" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">供应商名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入供应商名称" class="layui-input" id="supplier_name"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">传真</span>
		  		<div class="layui-input-inline">
					<input type="text" name="fax" placeholder="请输入供应商传真" class="layui-input"></input>
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
					<input type="text" name="contacter" placeholder="请输入联系人" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">电话号码</span>
		  		<div class="layui-input-inline">
					<input type="text" name="phone" placeholder="请输入电话号码" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	<div class="input-group">
          		<span style="padding:6px 6px">手机号码</span>
		  		<div class="layui-input-inline">
					<input type="text" name="mobile" placeholder="请输入手机号码" class="layui-input"></input>
				</div>
			</div>
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px">供应商地址</span>
          			<div class="layui-input-inline">
						<input type="text" name="address" placeholder="请输入供应商地址" class="layui-input"></input>
					</div>
          		</div>
          </div>
          </div>
        </div>
        
         <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<table>
          			<tr>
          			 	<td>
          					<span style="padding:6px 6px">供应商备注</span>
          				</td>
          				<td>
							<input type="text" name="mark" placeholder="请输入供应商备注" class="layui-input"></input>
						</td>
					</tr>
				</table>
          </div>
          </div>
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="supplier_save_bt">保存</button>
      </div>
    </div><!-- /.modal-content -->
    </div>
</div>

<!-- 表格主体 -->

<form class="layui-form" action="supplierSelectAll" method="get">
	<div class="layui-form-item">
		<label class="layui-form-label">批发商搜索：</label>
		<div class="layui-input-inline">
			<input type="text" name="search" placeholder="请输入运营商id或名称" class="layui-input"></input>
		</div>
		<div class="layui-input-normal">
			<button class="layui-btn layui-btn">搜索</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
		<div class="layui-input-normal layui-layout-right">
			<!-- <button class="layui-btn layui-btn" data-toggle="modal" data-target="#myModal">新增</button> -->
			<button type="button" class="layui-btn layui-btn" data-toggle="modal" data-target="#myModal">新增</button>
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
                            <th width="1%" param="{type:'checkbox'}">
                                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
                            </th>
                           <!--isPrimary：是否是主键-->
                            <th width="10%" param="{name:'paraId',isPrimary:'true',hide:'true'}">序号</th>

                            <th width="10%" param="{name:'paraCode'}">供应商名称</th>

                            <th width="10%" param="{name:'paraName'}">传真</th>

                            <th width="10%" param="{name:'paraKey'}">联系人</th>

                            <th width="10%" param="{name:'sortNo'}">电话</th>
                            
                            <th width="10%" param="{name:'paraKey'}">手机</th>

                            <th width="10%" param="{name:'sortNo'}">创建时间</th>
                            
                             <th width="10%" param="{name:'paraKey'}">地址</th>

                            <th width="10%" param="{name:'sortNo'}">备注</th>
                            
                            <th width="10%" param="{name:'sortNo'}">操作</th>
                            
                         <!--     render：渲染列
                            <th width="10%" param="{name:'state',codeName:'state',render:'Render.customState'}">手机</th>
                             sortBtn：排序操作列
                            <th width="4%" param="{name:'sortNo',sortBtn:'true'}">创建时间</th>
                             buttons：操作列
                            <th width="10%" param="{operate:'true',buttons:'Render.state,Render.edit,Render.delete'}">操作</th> -->
                       </tr>
                    
                  </thead>
                  <tbody>
                  	<%-- 	<c:forEach items="${resultList}" var="item">
                       	<tr>
                       	    <th width="1%" param="{type:'checkbox'}">
                                <input type="checkbox" lay-skin="primary" lay-filter="allChoose">
                            </th>
                       		<th>${item.id}</th>
                       		<th>${item.name}</th>
                       		<th>序号</th>
                       		<th>${item.contacter}</th>
                       		<th>${item.phone}</th>
                       		<th>${item.mobile}</th>
                       		<th>${item.address}</th>
                       		<th>${item.fax}</th>
                       		<th>${item.type}</th>
                       		<th>${item.mark}</th>
                       	</tr>
                       </c:forEach> --%>
                  </tbody>
               </table>
              <!-- 分页 -->
                <%--显示分页信息--%>
			    <div class="row ">
			        <%--分页文字信息--%>
			        <div class="col-md-6" id="page_info">
			
			        </div>
			        <%--分页条--%>
			        <div class="col-md-6" id="page_nav">
			
			        </div>
			    </div>
           <!--  <div id="test1"></div> -->
            </div>
            
        
  <script>
//Demo
layui.use(['form','laypage'], function(){
  var form = layui.form;
  var laypage = layui.laypage;
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
/* 
//数据渲染对象
var Render = {
    customState: function (rowdata,renderData index, value) {
       if(value == "启用"){
           return '<span style="color:green">'+value+'</span>';
       }
       if(value == "禁用"){
           return '<span style="color:red">'+value+'</span>';
       }
       return value;
    },
    edit:function(rowdata,renderData){
        var btn=' <button  onclick="editOne(\''+"/commpara/edit"+'\',\''+rowdata.paraId+'\')" class="layui-btn layui-btn-mini">修改</button>';
        return btn;
    }
 }; */
 
 
 var totalRecord;
/* ajax请求 */
 //页面加载完成后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        to_page(1);
    });
    //根据页码显示页面
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/pageHelper",
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
        var emps = result.list;
        $.each(emps, function (index, item) {
            var empIdTd = $("<td></td>").append(item.id);
            var empNameTd = $("<td></td>").append(item.name);
            var empGenderTd = $("<td></td>").append(item.fax)/* (item.gender == "M" ? "男" : "女"); */
            var empEmailTd = $("<td></td>").append(item.contacter);
            var detpNameTd = $("<td></td>").append(item.phone);
            var suMobile = $("<td></td>").append(item.mobile);
            var suCreateTime = $("<td></td>").append(item.createTime);
            var suAddress = $("<td></td>").append(item.address);
            var suMark = $("<td></td>").append(item.mark);
            /*<button class="btn btn-primary btn-xs">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑
             </button>*/
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            /*button class="btn btn-danger btn-xs">
             <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
             删除
             </button>*/
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-xs")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            /*append方法执行完成之后还是原来的元素*/
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(detpNameTd)
                .append(suMobile)
                .append(suCreateTime)
                .append(suAddress)
                .append(suMark)
                .append(btnTd)
                .appendTo("#commparaTable tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append(" 当前页码" + result.pageNum + ",总共" + result.pages +
            "页,总共" + result.total + "条记录")
            totalRecord = result.total;
            
    }
    //解析显示分页条
    function build_page_nav(result) {
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if (result.hasPreviousPage == false) {
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        } else {
            prePageLi.click(function () {
                to_page(result.pageNum - 1);
            });
            firstPageLi.click(function () {
                to_page(1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.pages);
            });
        }
        //添加首页和前一页
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.pageNum == item) {
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

        //发送ajax请求，查出部门信息，显示在下拉列表
       
        //弹出模态框
        $("#myModal").modal({
            backdrop: "static"
        });
    });
    
    //校验
    function validate_add_form(){
    	//拿到要校验的数据，进行正则表达式校验
    	var empName = $("#supplier_name").val();//获取输入框的值
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

    
  //保存员工数据
    $("#supplier_save_bt").click(function () {
        //1.模态框中的数据
        
        //1.1  对输入框进行校验
        if(!validate_add_form()){
        	return false;
        }
        
        //2.发送ajax请求

        // alert($("#myModal form").serialize());
        $.ajax({
            url: "${APP_PATH}/supplier/add",
            type: "POST",
            data: $("#myModal form").serialize(),
            success: function (result) {
              /*   alert(result.msg); */
                //员工保存成功
                //1.关闭模态框
                $("#myModal").modal('hide');
                //2.来到最后一页，显示数据
                to_page(1);
            }
        });
    });
</script>          
</body>

</html>