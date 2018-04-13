<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8">
<title>货品页面</title>
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

<!-- 添加货品模态框 -->
<!-- Modal -->

<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">添加货品</h4>
      </div>
       <form action="goods/add" method="post" id="goodsAdd">
      <div class="modal-body">
     
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">货品编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="gid" placeholder="请输入货品编号" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">货品名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入货品名称" class="layui-input" id="goods_name"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">条形码</span>
		  		<div class="layui-input-inline">
					<input type="text" name="barcode" placeholder="请输入货品条形码" class="layui-input"></input>
				</div>
			</div>	
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12" >
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
              <div class="input-group">
		  		<span style="padding:6px 6px">类别</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cateId" placeholder="请输入类别" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">采购价</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cpirce" placeholder="请输入采购价" class="layui-input"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	<div class="input-group">
          		<span style="padding:6px 6px">批发价</span>
		  		<div class="layui-input-inline">
					<input type="text" name="ppirce" placeholder="请输入批发价" class="layui-input"></input>
				</div>
			</div>
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px">零售价</span>
          			<div class="layui-input-inline">
						<input type="text" name="rprice" placeholder="请输入零售价" class="layui-input"></input>
					</div>
          		</div>
          </div>
          </div>
        </div>
       
       <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px">库存</span>
          			<div class="layui-input-inline">
						<input type="text" name="number" placeholder="请输入库存" class="layui-input"></input>
					</div>
          		</div>
          </div>
          </div>
        </div> 
         
        <div class="row" style="margin-top:20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px">货品图片</span>
          			<div class="layui-input-inline">
						<button type="button" class="layui-btn" name="file" id="shangchuan1">
						  <i class="layui-icon">&#xe67c;</i>上传图片
						</button>     
					
						<input type="hidden" id="newsImgUrl" name="path" value="" class="layui-input">
					</div>
          		</div>
          </div>
          </div>
        </div>
        <div class="row" style="margin-top:20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px"></span>
          			<div class="layui-input-inline">
						<img id="showUploadImg"  width="100" height="100" style="display: none;" />
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

<!-- 修改货品模态框 -->
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="goods_up_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">修改货品</h4>
      </div>
       <form id="goodsAdd">
      <div class="modal-body">
     
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">货品编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="gid" placeholder="请输入货品编号" class="layui-input" id="g_id"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">货品名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入货品名称" class="layui-input" id="g_name"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">条形码</span>
		  		<div class="layui-input-inline">
					<input type="text" name="barcode" placeholder="请输入货品条形码" class="layui-input" id="g_barcode"></input>
				</div>
			</div>	
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12" >
            <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
              <div class="input-group">
		  		<span style="padding:6px 6px">类别</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cateId" placeholder="请输入类别" class="layui-input" id="g_cateId"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">采购价</span>
		  		<div class="layui-input-inline">
					<input type="text" name="cpirce" placeholder="请输入采购价" class="layui-input" id="g_cprice"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	<div class="input-group">
          		<span style="padding:6px 6px">批发价</span>
		  		<div class="layui-input-inline">
					<input type="text" name="ppirce" placeholder="请输入批发价" class="layui-input" id="g_pprice"></input>
				</div>
			</div>
          </div>
          </div>
        </div>
        <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px">零售价</span>
          			<div class="layui-input-inline">
						<input type="text" name="rprice" placeholder="请输入零售价" class="layui-input" id="g_rpirce"></input>
					</div>
          		</div>
          </div>
          </div>
        </div>
       
       <div class="row" style="margin-top: 20px;overflow:hidden;">
        <div class="col-md-12">
          <div class="col-md-12" style="padding:0;">
          		<div class="input-group">
          			<span style="padding:6px 6px">库存</span>
          			<div class="layui-input-inline">
						<input type="text" name="number" placeholder="请输入库存" class="layui-input" id="g_number"></input>
					</div>
          		</div>
          </div>
          </div>
        </div> 
         
        <div class="row" style="margin-top:20px;overflow:hidden;">
			<button type="button" class="layui-btn" name="file" id="shangchuan1">
			  <i class="layui-icon">&#xe67c;</i>上传图片
			</button>     
			<img id="showUploadImg1"  width="100" height="100" style="display: none;" />
			<input type="hidden" id="newsImgUrl1" name="path" value="" class="layui-input">
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

<!-- 货品入库模态框 -->
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="goods_ruku_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">货品采购</h4>
      </div>
       <form id="goodsAdd">
      <div class="modal-body">
     
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">货品编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="gid" class="layui-input" readonly="readonly" id="R_id"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">货品名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name"  class="layui-input" readonly="readonly" id="R_name" ></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">供应商</span>
		  		<div class="layui-input-inline">
					<select class="form-control" name="supplier" id="goods_ruku_select" autocomplete="off">
						<option value="" selected disabled>请选择供应商</option>

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
		  		<span style="padding:6px 6px">单价</span>
		  		<div class="layui-input-inline">
					<input type="text" name="pprice" class="layui-input" readonly="readonly" id="R_ppirce"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">数量</span>
		  		<div class="layui-input-inline">
					<input type="text" name="number" class="layui-input" value="1" ></input>
				</div>
			</div>
		  </div>
          </div>
        </div>      
        <div class="row" style="margin-top:20px;overflow:hidden;">
        <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
	      	  <div class="input-group">
			  		<!-- <span style="padding:6px 6px">图片</span> -->
			  		<div class="layui-input-inline">
						<img id="showRuKuImage"  width="100" height="100" style="display: none;" />
						<input type="hidden" id="rukuImgUrl1" name="path" value="" class="layui-input">
					</div>
				</div>
			</div>
			</div>
        </div>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="supplier_ruku_bt">采购</button>
      </div>
      </form>
    </div><!-- /.modal-content -->
    </div>
</div>


<!-- 货品出库模态框 -->
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="goods_chuku_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
       <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">货品销售</h4>
      </div>
       <form id="goodsAdd">
      <div class="modal-body">
     
        <div class="row" style="margin-top: 20px;overflow:hidden;">
         <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">货品编号</span>
		  		<div class="layui-input-inline">
					<input type="text" name="gid" class="layui-input" readonly="readonly" id="C_id"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
         	 <div class="input-group">
		  		<span style="padding:6px 6px">货品名称</span>
		  		<div class="layui-input-inline">
					<input type="text" name="name"  class="layui-input" readonly="readonly" id="C_name" ></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;padding-left:18px;">
          	 <div class="input-group">
          		<span style="padding:6px 6px">客户</span>
		  		<div class="layui-input-inline">
					<select class="form-control" name="consumer" id="goods_chuku_select" autocomplete="off">
						<option value="" selected disabled>请选择客户</option>

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
		  		<span style="padding:6px 6px">单价</span>
		  		<div class="layui-input-inline">
					<input type="text" name="rprice" class="layui-input" readonly="readonly" id="C_rpirce"></input>
				</div>
			</div>
		  </div>
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
          	<div class="input-group">
		  		<span style="padding:6px 6px">数量</span>
		  		<div class="layui-input-inline">
					<input type="text" name="number" class="layui-input" value="1" ></input>
				</div>
			</div>
		  </div>
          </div>
        </div>      
        <div class="row" style="margin-top:20px;overflow:hidden;">
        <div class="col-md-12" >
          <div class="col-md-4 col-sm-4 col-xs-4" style="padding:0;">
	      	  <div class="input-group">
			  		<!-- <span style="padding:6px 6px">图片</span> -->
			  		<div class="layui-input-inline">
						<img id="showRuKuImage"  width="100" height="100" style="display: none;" />
						<input type="hidden" id="chukuImgUrl1" name="path" value="" class="layui-input">
					</div>
				</div>
			</div>
			</div>
        </div>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="supplier_chuku_bt">销售</button>
      </div>
      </form>
    </div><!-- /.modal-content -->
    </div>
</div>
<!-- 表格主体 -->

<form class="layui-form" action="supplierSelectAll" method="get">
	<div class="layui-form-item">
		<label class="layui-form-label">搜索货品</label>
		<div class="layui-input-inline">
			<input type="text" name="search" placeholder="请输入货品名称或条码" class="layui-input"></input>
		</div>
		<div class="layui-input-normal">
			<button class="layui-btn layui-btn">搜索</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
		<div class="layui-input-normal layui-layout-right">
			<!-- <button class="layui-btn layui-btn" data-toggle="modal" data-target="#myModal">新增</button> -->
			<!-- <button type="button" class="layui-btn layui-btn" data-toggle="modal" data-target="#myModal" id="supplier_add_bt">新增</button> -->
			<button type="button" class="layui-btn layui-btn" id="supplier_add_bt">添加货品</button>
			<button type="button" class="layui-btn layui-btn" >出货</button>
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
                            <th width="5%" param="{name:'paraId',isPrimary:'true',hide:'true'}">序号</th>

							<th width="5%" param="{name:'paraCode'}">货品图片</th>
							
                            <th width="10%" param="{name:'paraCode'}">货品名称</th>

                            <th width="10%" param="{name:'paraName'}">条形码</th>

                            <th width="10%" param="{name:'paraKey'}">类别</th>

<!--                             <th width="10%" param="{name:'sortNo'}">库存成本</th>
 -->                            
                            <th width="5%" param="{name:'sortNo'}">采购价</th>
                            
                             <th width="5%" param="{name:'paraKey'}">批发价</th>

                            <th width="5%" param="{name:'sortNo'}">零售价</th>
                            
                            <th width="5%" param="{name:'sortNo'}">当前库存</th>
                            
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
            url: "${APP_PATH}/goods/selectAll",
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
            var empIdTd = $("<td></td>").append(item.gid);
            var supplier_id = $("<td></td>").append('<img width="50" height="50" data-img="1" src="../images/'+item.path+'"></img>');
            var empNameTd = $("<td></td>").append(item.name);
            var empGenderTd = $("<td></td>").append(item.barcode)
            var empEmailTd = $("<td></td>").append(item.cateId);
         /*    var detpNameTd = $("<td></td>").append(item.cateId);//库存成本 */
            var suMobile = $("<td></td>").append(item.cpirce);
            var suCreateTime = $("<td></td>").append(item.ppirce);
            var suAddress = $("<td></td>").append(item.rprice);
            var suMark = $("<td></td>").append(item.number);
            
            
            
            /* 入库 */
            var rukuBtn = $("<button></button>").addClass("btn btn-success btn-xs ruku_bt")
               .append($("<span></span>").addClass("glyphicon glyphicon-import")).append("采购");
            rukuBtn.attr("ruku-id",item.id);
            /* 出库 */
            var chukuBtn = $("<button></button>").addClass("btn btn-info btn-xs chuku_bt")
               .append($("<span></span>").addClass("glyphicon glyphicon-export")).append("销售");
            chukuBtn.attr("chuku-id",item.id);
            
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
             
          
             
            var btnTd = $("<td></td>").append(rukuBtn).append(" ").append(chukuBtn)
           				 .append(" ").append(editBtn)
           				 .append(" ").append(deleteBtn);
            /*append方法执行完成之后还是原来的元素*/
            $("<tr></tr>").append(empIdTd)
            	.append(supplier_id)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
          /*       .append(detpNameTd) */
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
  //保存货品数据
    $("#supplier_save_bt").click(function () {
        //1.模态框中的数据
        
        //1.1  对输入框进行校验
     /*    if(!validate_add_form()){
        	return false;
        } */
        //2.发送ajax请求
        $.ajax({
            url: "${APP_PATH}/goods/add",
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
  
  //修改货品信息
  $(document).on("click",".edit_bt",function(){
	 // alert("hello");
	 //查出货品信息
	 getSupplier($(this).attr("edit-id"));
	 //把货品表中的id传递给更新按钮
	 $("#supplier_up_bt").attr("edit-id",$(this).attr("edit-id"));
	//弹出模态框
      $("#goods_up_model").modal({
          backdrop: "static"
      });
  });
  //查出货品信息
  function getSupplier(id){
	  $.ajax({
		  url:"${APP_PATH}/goods/one/"+id,
		  type:"GET",
		  success:function(result){
			  /////////////=================================
			  $("#g_id").val(result.entend.entend.gid);
			  $("#g_name").val(result.entend.entend.name);
			  $("#g_barcode").val(result.entend.entend.barcode);
			  $("#g_cateId").val(result.entend.entend.cateId);
			  $("#g_cprice").val(result.entend.entend.cpirce);
			  $("#g_pprice").val(result.entend.entend.ppirce);
			  $("#g_rpirce").val(result.entend.entend.rprice);
			  $("#g_number").val(result.entend.entend.number);
	
			 	 var path = result.entend.entend.path;
		         $("#newsImgUrl1").val(path);
		         $("#showUploadImg1").css("display","block");
		         $("#showUploadImg1").attr("src","../images/"+path).attr("width",100).attr("height",100);
				  ///入库
				    $("#R_id").val(result.entend.entend.gid);//入库
				    $("#R_name").val(result.entend.entend.name);
				    $("#R_ppirce").val(result.entend.entend.cpirce);
				    
				    $("#rukuImgUrl1").val(path);
				    
				    
				    //出库
				     $("#C_id").val(result.entend.entend.gid);//入库
				    $("#C_name").val(result.entend.entend.name);
				    $("#C_rpirce").val(result.entend.entend.rprice);
				    
				    $("#chukuImgUrl1").val(path);
				    
				    /*  $("#showRuKuImage").css("display","block");
			        $("#showRuKuImage").attr("src","../images/"+path).attr("width",100).attr("height",100); */
				    ////////////===================================
		  }
	  });
  };
  //点击更新按钮，更新货品信息
  $("#supplier_up_bt").click(function(){
	  $.ajax({
		  url:"${APP_PATH}/supplier/update/"+$(this).attr("edit-id"),
		  type:"POST",
		  data:$("#supplier_Up_Modal form").serialize(),
		  success:function(result){
			  //1.关闭模态框
              $("#supplier_Up_Modal").modal('hide');
              //2.来到最后一页，显示数据
              to_page(1);
		  }
	  });
  });
  //删除货品信息
  $(document).on("click",".delete_bt",function(){
	  
		var supplierId = $(this).attr("delete-id");
	  	var supplierName = $(this).attr("delete-name");
 		if(confirm("确定删除【"+supplierName+"】吗？")){
 			$.ajax({
 	 			url:"${APP_PATH}/supplier/delete/"+supplierId,
 	 			type:"GET",
 	 			success :function(result){
 	 				alert(result);
 	 				to_page(1);
 	 			}
 	 		});	
 		}
	  	
  });
  //查询所有供应商
  function getSuppliers1(){
	  //清空
      $("#goods_ruku_select").empty();
      $.ajax({
          url: "${APP_PATH}/pageHelper",
          type: "GET",
          success: function (result) {
              //将部门信息添加到下拉列表

              $.each(result.list, function () {
                  var optionEle = $("<option></option>").append(this.name).attr("value", this.name);
                  optionEle.appendTo("#goods_ruku_select");
              });
          }
      });
  }
  
  //商品入库
   //修改货品信息，修改按钮
  $(document).on("click",".ruku_bt",function(){
	 // alert("hello");
	 //查出货品信息
	 getSupplier($(this).attr("ruku-id"));
	 //查出供应商
	 getSuppliers1();
	 //把货品表中的id传递给更新按钮
	 $("#supplier_ruku_bt").attr("ruku-id",$(this).attr("ruku-id"));
	//弹出模态框
      $("#goods_ruku_model").modal({
          backdrop: "static"
      });
  });
  //入库按钮
   $("#supplier_ruku_bt").click(function(){
	  $.ajax({
		  url:"${APP_PATH}/goods/ruku/"+$(this).attr("ruku-id"),
		  type:"POST",
		  data:$("#goods_ruku_model form").serialize(),
		  success:function(result){
			  //1.关闭模态框
              $("#goods_ruku_model").modal('hide');
              //2.来到最后一页，显示数据
              to_page(1);
              layer.msg('采购成功', {
	 				  icon: 1,
	 				  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	 				}, function(){
	 				  //do something
	 				}); 
		  }
	  });
  });
  
 //查出客户
	function getConsumer(){
		  //清空
	      $("#goods_chuku_select").empty();
	      $.ajax({
	          url: "${APP_PATH}/consumer/all",
	          type: "GET",
	          success: function (result) {
	              //将部门信息添加到下拉列表

	              $.each(result.entend.pageInfo.list, function () {
	                  var optionEle = $("<option></option>").append(this.name).attr("value", this.name);
	                  optionEle.appendTo("#goods_chuku_select");
	              });
	          }
	      });
 	}
  
 //商品出库
   //修改货品信息，修改按钮
  $(document).on("click",".chuku_bt",function(){
	 //查出货品信息
	 getSupplier($(this).attr("chuku-id"));
	 //查出客户
	 getConsumer();
	 //把货品表中的id传递给更新按钮
	 $("#supplier_chuku_bt").attr("chuku-id",$(this).attr("chuku-id"));
	//弹出模态框
      $("#goods_chuku_model").modal({
          backdrop: "static"
      });
  });
  //出库按钮
   $("#supplier_chuku_bt").click(function(){
	  $.ajax({
		  url:"${APP_PATH}/goods/chuku/"+$(this).attr("chuku-id"),
		  type:"POST",
		  data:$("#goods_chuku_model form").serialize(),
		  success:function(result){
			  //1.关闭模态框
              $("#goods_chuku_model").modal('hide');
              //2.来到最后一页，显示数据
              to_page(1);
              layer.msg('销售成功', {
	 				  icon: 1,
	 				  time: 2000 //2秒关闭（如果不配置，默认是3秒）
	 				}, function(){
	 				  //do something
	 				}); 
		  }
	  });
  });
  
</script>          
</body>

</html>