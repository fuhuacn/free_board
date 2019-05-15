
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="panel panel-default front-panel" style="margin-top: 10px">
    <div class="panel-body front-no-padding">
        <table class="table table-striped multi-table"
               style="margin-bottom: 0px;font-size:14px">
            <thead>
            <tr>
                <th>
                    BOARD名称

                </th>
                <th class="col-sm-2 text-center">
                    <div style="padding-right:16px">操作</div>
                </th>
            </tr>
            </thead>
            <s:iterator value="dashboardconfigEntityList" id="list">
                <tr >
                    <td style="border-bottom: 1px solid #ddd;">
                        <s:property value="#list.name"/>
                    </td>
                    <td class="text-right" style="border-bottom: 1px solid #ddd;padding-right:25px">
                        <a href='http://www.free4inno.com/?boardId=<s:property value="#list.id"/>' target="_blank">预览</a>
                        <a href='admin/boardDetails?boardId=<s:property value="#list.id"/>'>详情</a>
                        <a href="javascript:void(0)" onclick="deleteboard(<s:property value="#list.id"/>)">删除</a>
                    </td>
                </tr>
            </s:iterator>
        </table>
        <div class='lineheight' id="pageColumn" data-endpage="<s:property value='endPage'/>"></div>
    </div>
</div>
<script>
    $("#num").html("共<s:property value="count"/>个BOARD");
</script>
