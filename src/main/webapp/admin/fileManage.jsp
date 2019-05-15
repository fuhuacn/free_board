<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>board管理</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <script src="repack/echarts/echarts3.8.js"></script>
    <script src="highcharts/highcharts.js"></script>
    <script src="highcharts/highcharts-more.js"></script>
    <script src="highcharts/modules/solid-gauge.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
    <script src="http://newfront.free4inno.com/plugin/fileupload/fileupload.min.js"></script>
</head>
<body class="front-body">
<s:include value="/template/_adminHead.jsp?menu=fileManage" />
<div class="front-inner">
    <div class="container">

    </div>
    <s:include value="/template/_adminFooter.jsp"></s:include>
</div>


</body>
</html>