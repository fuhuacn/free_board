<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="constants.Constants" %>
<style>
    .table tbody tr td{
        overflow: hidden;
        text-overflow:ellipsis;
    }
</style>
<script>
    $("[data-toggle='popover']").popover();
</script>
<div class="panel panel-default front-panel" style="margin-top: 10px">
    <div class="panel-body front-no-padding">
<table class="table table-striped multi-table" style="table-layout:fixed; margin-top:0px; margin-bottom:0px; font-size:14px">
    <thead>
    <tr>
        <th style="text-align:center">#</th>
        <th class="col-md-2" style="text-align:center">文件名称</th>
        <th class="col-md-2" style="text-align:center">创建时间</th>
        <th class="col-md-5" style="text-align:center">引用名称</th>
        <th class="col-md-2" style="text-align:center;">操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="filelistEntityList" var="file" status="st">
        <tr>
            <td style="border-bottom: 1px solid #ddd;text-align:center"><s:property value="#st.index+1"/></td>
            <td style="border-bottom: 1px solid #ddd;text-align:center"><s:property value="#file.fileName"/></td>
            <td style="border-bottom: 1px solid #ddd;text-align:center"><s:property value="#file.modifiedTime"/></td>
            <td style="border-bottom: 1px solid #ddd;text-align:center"><s:property value="#file.fullName"/></td>
            <td style="border-bottom: 1px solid #ddd;text-align:center">
                <a title="预览" data-toggle="popover" data-placement="left" data-trigger="hover"
                   data-toggle="popover"
                   data-html="true" href="javascript:void(0)"
                   data-content="<img class='img-responsive' src='<%=Constants.LOCATION%><s:property value="#file.fullName"/>'></img>">
                    预览</a>
                <a target="_blank"
                   href="<%=Constants.LOCATION%><s:property value="#file.fullName"/>">下载</a>
                <a href="javascript:void(0)" data-id="<s:property value="#file.id"/>"
                   onclick="deleteFile('<s:property value="#file.fullName"/>',this)">删除</a>
            </td>
        </tr>
    </s:iterator>
    </tbody>
</table>
        <div class='lineheight' id="pageColumn" data-endpage="<s:property value='endPage'/>"></div>
    </div>
</div>



