<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jasonqc
  Date: 2018-10-18
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>三维界面显示</title>
    <link href="../statics/css/test.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>
    <script src="https://cdn.bootcss.com/echarts/3.8.5/echarts.min.js"></script>
    <script src="http://echarts.baidu.com/resource/echarts-gl-latest/dist/echarts-gl.min.js"></script>

</head>

<body>
<div>
    <%--<img src="../statics/image/biaozhi.jpg" alt="Smiley face" width="42" height="42">--%>

    <h1  align="center" >高精度多维定位显示</h1>
</div>
<div>当前坐标: <br>
    <div><b>x:</b><span id = "xPosition"> </span></div>
    <div><b>y:</b><span id = "yPosition"> </span></div>
    <div><b>z:</b><span id = "zPosition"> </span></div>
</div>


<div id="main" style="width: 800px;height:800px;"></div>
<script type="text/javascript">
    $("#main").remove();
    var newM = $("<div id='main' style='width: 100%;height:700px; '></div>");
    newM.appendTo($("body"));
    // addChart ();
    // $("#btn").on("click", function () {
    //     $("#main").remove();
    //     var newM = $("<div id='main' style='width: 100%;height:800px; '></div>");
    //     newM.appendTo($("body"));
    addChart([0,0,0]);
    function addChart (data) {
        $("#main").remove();
        var newM = $("<div id='main' style='width: 100%;height:700px; '></div>");
        newM.appendTo($("body"));

        var myChart = echarts.init(document.getElementById('main'));
        console.log(myChart);
        myChart.setOption({
            tooltip: {},
            xAxis3D: {
                name: "x",
                type: 'value',
            },
            yAxis3D: {
                name: "y",
                type: 'value',
            },
            zAxis3D: {
                name: "z",
                type: 'value',
            },
            grid3D: {
                axisLine: {
                    lineStyle: {
                        color: '#000'//轴线颜色
                    }
                },
                axisPointer: {
                    lineStyle: {
                        color: '#f00'//坐标轴指示线
                    },
                    show: false//不坐标轴指示线
                },
                viewControl: {
                    beta: 10
                },
                boxWidth: 200,
                boxHeight: 100,
                boxDepth: 100,
                top: -100
            },
            series: [{
                type: 'scatter3D',
                dimensions: ['x', 'y', 'z'//显示框信息
                ],

                data: data,
                symbolSize: 10,//点的大小
                itemStyle: {
                    borderWidth: 1,
                    borderColor: 'rgba(255,255,255,0.8)'//边框样式
                },
                emphasis: {
                    itemStyle: {
                        color: '#ccc'//高亮
                    }
                },
                itemStyle: {
                    color: "#f00"
                }
            }],
            backgroundColor: "#fff"
        });
    }
</script>


</body>
</html>

<script>
    setInterval("requestData()", 3000);//设置定时器。 单位ms
    var predata=[];
    function requestData() {
        $.ajax({
            url: "/Fucking3DShower/home/test.action",
            type: "Post",
            dataType:"json",
            success: function(data){
                if (data.state!="N") {
                    $("#xPosition").text(data.x);
                    $("#yPosition").text(data.y);
                    $("#zPosition").text(data.z);
                    predata.push([data.x,data.y,data.z]);
                    addChart(predata);
                }
            }
        })
    }
</script>