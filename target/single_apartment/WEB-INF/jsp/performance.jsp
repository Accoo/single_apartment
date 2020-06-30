<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/layui.js"></script>
    <script type="text/javascript" src="js/echats.js"></script>
    <link rel="stylesheet" href="css/performance.css">
    <link rel="stylesheet" href="css/layui.css"  media="all">
</head>
<body>
    <blockquote class="layui-elem-quote">
        <h2>经营状况</h2>
    </blockquote>
    <div class="row">
        <div class="sysNotice col">
            <div class="layui-elem-quote layui-quote-nm">
                <div id="annualIncome" style="width: 800px;height: 500px;"></div>
            </div>
        </div>
        <div class="sysNotice col">
            <div class="layui-elem-quote layui-quote-nm">
                <div id="annualInfo" style="width: 800px;height: 500px;"></div>
            </div>
        </div>
    </div>
<script>
    //收入、支出、利润数组的获取
    var annualData= '<%=request.getSession().getAttribute("income")%>';
    var expends= '<%=request.getSession().getAttribute("expends")%>';
    var profit= '<%=request.getSession().getAttribute("profit")%>';
    //全年总收入、维修费、装修费获取
    var incomeTotal= '<%=request.getSession().getAttribute("incomeTotal")%>';
    var serviceTotal= '<%=request.getSession().getAttribute("serviceTotal")%>';
    var decorationTotal= '<%=request.getSession().getAttribute("decorationTotal")%>';
    annualData=annualData.substring(1,annualData.length-1).split(", ");
    expends=expends.substring(1,expends.length-1).split(", ");
    profit=profit.substring(1,profit.length-1).split(", ");
    layui.config({
        version: 1,
        base: 'js/echats.js' //放Echart.js的目录
    }).use(['echarts','element'],function(){
        var element = layui.element,
            echarts = layui.echarts;
        var myChart1 = echarts.init(document.getElementById('annualIncome'));
        var myChart2 = echarts.init(document.getElementById('annualInfo'));

        var option1 = {
            color: ['#5793f3', '#d14a61', '#675bba'],
            title: {
                text: '2020年每月收支柱状图',
                // subtext: 'Statistics of the income and expenditure statistics for 2020'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            grid: {
                right: '20%'
            },
            legend: {
                data: ['收入', '支出', '利润']
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '金额',
                    min: 0,
                    position: 'left',
                    axisLine: {
                        lineStyle: {
                            color: '#5793f3'
                        }
                    },
                    axisLabel: {
                        formatter: '{value} 元'
                    }
                }
            ],
            series: [
                {
                    name: '收入',
                    type: 'bar',
                    data: annualData
                },
                {
                    name: '支出',
                    type: 'bar',
                    data: expends
                },
                {
                    name: '利润',
                    type: 'line',
                    data: profit
                }
            ]
        };
        var option2 = {
            color: ['#5793f3', '#d1203d', '#9b48ba'],
            title: {
                text: '2020年全年收支饼状图',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['收入', '维修费', '装修费']
            },
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '65%',
                    center: ['50%', '60%'],
                    data: [
                        {value: incomeTotal, name: '收入'},
                        {value: serviceTotal, name: '维修费'},
                        {value: decorationTotal, name: '装修费'}
                    ],
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart1.setOption(option1);
        myChart2.setOption(option2);
    });
</script>
</body>
</html>
