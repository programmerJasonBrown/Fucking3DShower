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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/test.css"/> "/>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js" type="text/javascript"></script>

</head>

<body>

<h1  align="center" >移动通信国家重点实验室</h1>

<div>
    <img src="WEB-INF/statics/image/biaozhi.jpg" alt="东南大学" width="420" height="300">
</div>
<div id = "xxx"></div>
<div id = "yyy"></div>
<div id = "zzz"></div>




</body>
</html>

<script>
    setInterval("requestData()", 5000);//设置定时器。 单位ms

    function requestData() {
        $.ajax({
            url: "/my3DShower/home/test",
            type: "Post",
            dataType:"json",
            success: function(data){
                alert(data.x+data.y+data.z);
            }
        })
    }


</script>
