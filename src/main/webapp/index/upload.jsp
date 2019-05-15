<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: fuhua
  Date: 2018/4/27
  Time: 下午3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传图片</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<s:include value="/template/_head.jsp"/>
<script src="http://newfront.free4inno.com/plugin/fileupload/fileupload.min.js"></script>
<%--<div class='col-md-12 form-group'>
<div class='panel panel-default front-panel'>
    <div class='panel-heading'>
        <strong>上传图片</strong>
    </div>
    <div class='panel-body'>
        <div class='form-horizontal'>

            <div class='form-group'>
                <label class='col-md-1 control-label front-label' style='text-align:center'>文件</label>
                <input type="file" name="uploadFile">
            </div>
            <div class='from-group'>
                <div class='text-right col-md-12'>
                    <input type="submit" class='btn btn-primary' value="提交">
                </div>
            </div>
        </div>
    </div>
</div>
</div>--%>
<form action="uploadFile" method="post" enctype="multipart/form-data">
    文件：
    <input type="file" name="uploadFile">
    <input type="submit" value="提交">
</form>
</body>
</html>
