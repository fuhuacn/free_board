<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setStatus(404); %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/" />
    <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />--%>
    <title>页面不存在</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
    <style>
        #box {
            width: 300px;
            height: 300px;
            background: transparent;
            position: relative;
        }
        #child {
            width: 300px;
            height: 200px;
            background: transparent;
            position: absolute;
            top: 50%;
            margin: 0 0 0 0;
            line-height: 100px;
        }
    </style>
</head>
<body class="front-body">
<div class="front-inner">
    <div class="container" style="display:table;height:100%">
        <div class="row" id="box" style="display: table-cell;vertical-align: middle;">
            <div class="col-md-12 text-center" id="child" >
                <span style="font-size:72px">404</span>
                <h1 style="margin-top:0px">页面不存在</h1>
            </div>

        </div>

    </div>
    <s:include value="/template/_adminFooter.jsp"></s:include>
</div>
</body>
</html>
