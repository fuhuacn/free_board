<%--
  Created by IntelliJ IDEA.
  User: icarus
  Date: 2018/5/29
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>
    <%-- <script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
     <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="repack/css/front.css"/>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<script src="repack/js/plugin/front.js"></script>--%>
</head>
<nav class="navbar navbar-default navbar-fixed-top front-nav" style="background-color: ${bannerColor};">
    <!-- /.navbar-collapse -->
    <div class="container">
        <div>
            <!-- 品牌图片大小为150 * 30：宽度不定，高度固定30px -->
            <a href="">
                <div class="nav-brand">
                    <img src="images/logo.png" onerror="javascript:this.src='images/logo.png';" style="max-height: 30px"/>
                </div>
            </a>
            <div class="nav-right">
                <div class="area visible-xs nav-toggle-down" data-toggle="collapse" data-target="#nav-collapse-demo"><span class="glyphicon glyphicon-menu-hamburger" id="front-nav-toggle-down-demo"></span></div>
            </div>
        </div>
    </div>
</nav>