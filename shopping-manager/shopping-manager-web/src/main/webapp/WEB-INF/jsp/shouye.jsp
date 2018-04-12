<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>天天批发市场</title>
<%@ include file="layui.jsp"%>
 <link rel="shortcut icon" href="../images/tubiao.ico" type="image/x-icon" />
<style>
.menubar{
    position:absolute!important;
    left:210px;
	width: 30px;
	height: 30px;
	margin: 15px 15px 0 0;
	font-size: 17px;
	text-align: center;
	padding:0px;
	color: #fff;
	background-color: #1AA094
}
#chaxun{
	width:100;
   float: left;
}
</style>
</head>


<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">天天批发市场</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <a href="javascript:;" id="menuBar" class="iconfont hideMenu icon-menu1"></a>
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="javascript:;" data-url="main">首页</a></li>

	<!-- <li class="layui-nav-item">
		<input type="text" style="width: 300px;" id="chaxun" width="100" name="title" required lay-verify="required" placeholder="查询栏" autocomplete="off" class="layui-input">   
	</li>
	<li class="layui-nav-item">
		<button class="layui-btn" style="width: 60px;">查询</button>
	</li> -->
	</ul>
    

    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item"><a href="javascript:void(0)" class="xtgg"><i class="fa fa-volume-up"></i>&nbsp;系统公告</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="../images/${sessionScope.path}" class="layui-nav-img">
           ${sessionScope.name}
        </a>
        <dl class="layui-nav-child" id="hello">
          <dd><a href="javascript:;" data-url="basicInfo">基本资料</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="login">退出</a></li>
    </ul>
  </div>
  <div class="layui-side layui-bg-black">

    <div class="layui-side-scroll">
      <div class="user-photo">
        <a class="img" title="我的头像"><img style="width: 80px;height: 80px" class="layui-circle" src="../images/${sessionScope.path}"></a>
        <p>你好！<span class="userName">${sessionScope.name}</span></p>
      </div>
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test" id="ulmenu">
       
        <li class="layui-nav-item">
          <a class="" href="javascript:;" data-url=""><i class="fa fa-coffee"></i>&nbsp;开单</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" data-url="login"><i></i>&nbsp;销售出货</a></dd>
            <dd><a href="javascript:;" data-url="register"><i></i>&nbsp;销售退货</a></dd>
            <dd><a href="javascript:;" data-url="addCommodity"><i></i>&nbsp;销售收款</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;采购进货</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;采购退货</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;采购付款</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;其他收入</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;其他支出</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="fa fa-building-o"></i>&nbsp;销售明细</a>
           <dl class="layui-nav-child">
		    <dd><a href="javascript:;" data-url="addCommodity"><i></i>&nbsp;销售单据</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;销售货品</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;退货单据</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;退货货品</a></dd>
            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;收货单据</a></dd>
		    </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="layui-icon">&#xe63c;</i>&nbsp;采购明细</a>
           <dl class="layui-nav-child">
		       <dd><a href="javascript:;" data-url="goodsRuKu"><i></i>&nbsp;进货记录</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;进货货品</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;退货单据</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;退货货品</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;收货单据</a></dd>
		    </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="layui-icon">&#xe63c;</i>&nbsp;收支明细</a>
           <dl class="layui-nav-child">
		      <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;收入单据</a></dd>
	          <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;支出单据</a></dd>
		    </dl>
        </li>
		
		 <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="fa fa-info fa-fw"></i>&nbsp;货品管理</a>
           <dl class="layui-nav-child">
		       <dd><a href="javascript:;" data-url="goods"><i></i>&nbsp;货品列表</a></dd>
	            <dd><a href="javascript:;" data-url=""><i></i>&nbsp;货品类别</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;货品单位</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;报损原因</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;报损查询</a></dd>
		    </dl>
        </li>
        
         <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="fa fa-user-o"></i>&nbsp;客户管理</a>
           <dl class="layui-nav-child">
		       <dd><a href="javascript:;" data-url="consumer"><i></i>&nbsp;客户管理</a></dd>
	            <dd><a href="javascript:;" data-url="tupian"><i></i>&nbsp;报价管理</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;会员设置</a></dd>
		    </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="fa fa-handshake-o"></i>&nbsp;供应商管理</a>
           <dl class="layui-nav-child">
		       <dd><a href="javascript:;" data-url="supplierAdd"><i></i>&nbsp;供应商管理</a></dd>
		    </dl>
        </li>
        
          <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="fa fa-bar-chart-o"></i>&nbsp;报表</a>
           <dl class="layui-nav-child">
		       <dd><a href="javascript:;" data-url="reports"><i></i>&nbsp;销售统计</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;采购统计</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;利润统计</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;支出分析</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;收入分析</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;销售业绩统计</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;单品销量排行</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;货品报损统计</a></dd>
		    </dl>
        </li>
        
          <li class="layui-nav-item">
          <a href="javascript:;" data-url=""><i class="fa fa-info fa-fw"></i>&nbsp;门店管理</a>
           <dl class="layui-nav-child">
		       <dd><a href="javascript:;" data-url="addCommodity"><i></i>&nbsp;账户管理</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;门店信息</a></dd>
	            <dd><a href="javascript:;" data-url="u_website"><i></i>&nbsp;系统公告</a></dd>
		    </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 0px 3px;height:100%">
        <div class="layui-tab layui-tab-brief"  lay-filter="contentTab">
		  <ul class="layui-tab-title" id="contentTb">
		  </ul>
		  <div class="layui-tab-content"></div>
		</div>      
    
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © www.king.com
  </div>
</div>

<script>
//JavaScript代码区域
layui.use(['element','layer'], function(){
  var element = layui.element;
  var layer=layui.layer;
  var $=layui.jquery;
  //绑定事件
  $(".xtgg").on("click",function(){
      //示范一个公告层
      layer.open({
          type: 1
          ,title: false //不显示标题栏
          ,closeBtn: false
          ,area: '300px;'
          ,shade: 0.8
          ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
          ,btn: ['火速围观', '残忍拒绝']
          ,btnAlign: 'c'
          ,moveType: 0 //拖拽模式，0或者1
          ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
          ,success: function(layero){
              var btn = layero.find('.layui-layer-btn');
              btn.find('.layui-layer-btn0').attr({
                  href: 'http://www.layui.com/'
                  ,target: '_blank'
              });
          }
      });
  });
  var title="";
    element.tabAdd('contentTab', {
        title: "<i class='fa fa-home'></i>&nbsp;首页"
        ,content:"<iframe class='iframe' src='main'></iframe>" //支持传入html
        ,id: "777"
    });
    element.tabChange("contentTab",777);  
  $("#ulmenu li a").each(function(m,n){
	  $(n).click(function(){
           // alert($(this).data("url"));
	      if($(this).data("url")!=""){
	          var html=$(this).data("url");
              var load=layer.msg('加载中', {
                  icon: 16
                  ,shade: 0.4
              });
              title=$(this).html();

              var flag=false;
              $("#contentTb li").each(function(k,v){
                  if($(v).attr("lay-id")==eval(m+1)){
                      flag=true;
                  }
              });
              if(flag){
                  element.tabChange("contentTab",m+1);
                  layer.close(load);
              }else{
                  //判断layID 是否存在
                  setTimeout(function(){
                      element.tabAdd('contentTab', {
                          title: title
                          ,content:"<iframe class='iframe' src="+html+"></iframe>" //支持传入html
                          ,id: m+1
                      });
                      element.tabChange("contentTab",m+1);
                      layer.close(load);
                  },500)
              }
          }


	  });
	 
  });

  $("#hello dd a").each(function(m,n){
	  $(n).click(function(){
           // alert($(this).data("url"));
	      if($(this).data("url")!=""){
	          var html=$(this).data("url");
              var load=layer.msg('加载中', {
                  icon: 16
                  ,shade: 0.4
              });
              title=$(this).html();

              var flag=false;
              $("#contentTb li").each(function(k,v){
                  if($(v).attr("lay-id")==eval(m+1)){
                      flag=true;
                  }
              });
              if(flag){
                  element.tabChange("contentTab",m+1);
                  layer.close(load);
              }else{
                  //判断layID 是否存在
                  setTimeout(function(){
                      element.tabAdd('contentTab', {
                          title: title
                          ,content:"<iframe class='iframe' src="+html+"></iframe>" //支持传入html
                          ,id: m+1
                      });
                      element.tabChange("contentTab",m+1);
                      layer.close(load);
                  },500)
              }
          }


	  });
	 
  });
          
});
</script>
</body>


</html>