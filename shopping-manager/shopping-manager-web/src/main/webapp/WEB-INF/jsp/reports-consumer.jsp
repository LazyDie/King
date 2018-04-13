	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@ include file="layui.jsp"%>
</head>
<body>

<!-- 1.引入 ECharts 文件 -->
    <script src="dist/echarts.js"></script>
    <!-- 2.为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 900px;height:600px;"></div>
    
    <!-- 3.创建echarts -->
    <script type="text/javascript">
    var pifa;
    var linshou;
    $(function () {
        to_page();
    });
    
    //根据页码显示页面
    function to_page() {
        $.ajax({
            url: "${APP_PATH}/consumer/type",
            type: "GET",
            success: function (result) {
              pifa = result[0];
              linshou = result[1];
              // 基于准备好的dom，初始化echarts实例
              var myChart = echarts.init(document.getElementById('main'));
              myChart.showLoading({text: '正在努力的读取数据中...'  });
              option = {
              	    title : {
              	        text: '客户类型统计',
              	        subtext: '',
              	        x:'center'
              	    },
              	    tooltip : {
              	        trigger: 'item',
              	        formatter: "{a} <br/>{b} : {c} ({d}%)"
              	    },
              	    legend: {
              	        orient: 'vertical',
              	        left: 'left',
              	        data: ['批发','零售']
              	    },
              	    series : [
              	        {
              	            name: '客户类型',
              	            type: 'pie',
              	            radius : '55%',
              	            center: ['50%', '60%'],
              	            data:[
              	                {value:pifa, name:'批发',itemStyle:{
              	                	color:'#90c7ae'
              	                }},
              	                {value:linshou, name:'零售',itemStyle:{
              	                	color:'#61a0a8'
              	                }},
              	            ],
              	            itemStyle: {
              	                emphasis: {
              	                    shadowBlur: 10,
              	                    shadowOffsetX: 0,
              	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
              	                }
              	            }
              	        }
              	    ]
              	};
              		myChart.hideLoading();
                        myChart.setOption(option);
            }
        });

    }

</script>


</body>
</html>