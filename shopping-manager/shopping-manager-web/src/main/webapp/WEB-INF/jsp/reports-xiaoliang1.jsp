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
    
    function to_page() {
        $.ajax({
            url: "${APP_PATH}/sale/xiaoliang",
            type: "GET",
            success: function (result) {
            	var name = new Array();
            	var number = new Array();
            	var xiaoliang = result.entend.xiaoliang;
                $.each(xiaoliang, function (index, item) {
                	name.push(item.name);
                	number.push(item.number)
                });
            	
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                option = {
               		 title : {
                  	        text: '货品销售信息',
                  	        subtext: '',
                  	        x:'center'
                  	    },
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : name,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'销售数量',
                            type:'bar',
                            barWidth: '60%',
                            data:number
                        }
                    ]
                };

                          myChart.setOption(option);
                
                
                
            }
        });

    }

  
</script>


</body>
</html>