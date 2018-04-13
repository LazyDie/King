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
            		        text: '收入和支出统计',
            		        subtext: ''
            		    },
            		    tooltip : {
            		        trigger: 'axis'
            		    },
            		    legend: {
            		        data:['收入','支出']
            		    },
            		    toolbox: {
            		        show : true,
            		        feature : {
            		            dataView : {show: true, readOnly: false},
            		            magicType : {show: true, type: ['line', 'bar']},
            		            restore : {show: true},
            		            saveAsImage : {show: true}
            		        }
            		    },
            		    calculable : true,
            		    xAxis : [
            		        {
            		            type : 'category',
            		            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            		        }
            		    ],
            		    yAxis : [
            		        {
            		            type : 'value'
            		        }
            		    ],
            		    series : [
            		        {
            		            name:'蒸发量',
            		            type:'bar',
            		            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
            		            markPoint : {
            		                data : [
            		                    {type : 'max', name: '最大值'},
            		                    {type : 'min', name: '最小值'}
            		                ]
            		            },
            		            markLine : {
            		                data : [
            		                    {type : 'average', name: '平均值'}
            		                ]
            		            }
            		        },
            		        {
            		            name:'降水量',
            		            type:'bar',
            		            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
            		            markPoint : {
            		                data : [
            		                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
            		                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
            		                ]
            		            },
            		            markLine : {
            		                data : [
            		                    {type : 'average', name : '平均值'}
            		                ]
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