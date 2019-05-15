
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="list==null||list.size==0">
    <h2>目前还没有卡片</h2>
</s:if>
<s:else>
<div class="panel panel-default front-panel" style="margin-top: 10px">
    <div class="panel-body front-no-padding">
        <table class="table table-striped multi-table"
               style="margin-bottom: 0px" id="sortable">
            <thead>
            <tr>
                <th class="col-sm-1 text-center">
                    卡片ID

                </th>
                <th class="col-sm-2">
                    卡片类型
                </th>
                <th >
                    卡片名称
                </th>
                <th class="col-sm-1">
                    操作
                </th>
            </tr>
            </thead>

            <s:iterator value="list" id="list">
                <tr id='<s:property value="#list.id"/>'>
                    <td style="border-bottom: 1px solid #ddd;">
                        <div class="text-center"><s:property value="#list.id"/></div>
                    </td>
                    <td style="border-bottom: 1px solid #ddd;">
                        <s:property value="#list.typing"/>
                    </td>
                    <td style="border-bottom: 1px solid #ddd;">
                        <s:property value="#list.cardName"/>
                    </td>
                    <td style="border-bottom: 1px solid #ddd;">

                        <a href="admin/cardDetails?name=${param.boardName}&cardId=<s:property value="#list.id"/>">详情</a>
                        <a href="javascript:void(0)" onclick="deleteCard(<s:property value="#list.id"/>)">删除</a>
                    </td>
                </tr>
            </s:iterator>
        </table>
        <div class='lineheight' id="pageColumn" data-endpage="<s:property value='endPage'/>"></div>
    </div>
</div>
</s:else>
<script>
    $("#num").html('共<s:property value="count"/>张卡片');
</script>