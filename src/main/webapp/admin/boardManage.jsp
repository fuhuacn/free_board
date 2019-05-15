<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>BOARD管理 - 悉BOARD</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
    <%--<script src="http://newfront.free4lab.com/js/plugin/front.js"></script>---%>
</head>
<body class="front-body">
<s:include value="/template/_adminHead.jsp?menu=boardManage" />
<div class="front-inner2">
    <div class="container">
       <div class="row">
           <div class="col-md-12">
               <div style="margin-bottom:10px">
                   <span id='num' class="pull-left" style="margin-left:5px; margin-top:10px;"></span>
                   <span>
                       <a href="admin/newBoard" class="btn btn-primary pull-right">新建</a>
                   </span>
               </div>
               <div class="clearfix"></div>
               <div id="boardList"></div>
<%--               <div class="panel panel-default front-panel" style="margin-top: 10px">
                   <div class="panel-body front-no-padding">
                       <table class="table table-striped front-table"
                              style="margin-bottom: 0px">
                           <thead>
                           <tr>
                               <th >
                                   BOARD名称

                               </th>
                               <th class="col-sm-1">
                                    操作
                               </th>
                           </tr>
                           </thead>

                           <s:iterator value="dashboardconfigEntityList" id="list">
                           <tr>
                               <td>
                                   <div><s:property value="#list.name"/></div>
                               </td>
                               <td>
                                   <a href="http://www.free4inno.com/?boardId=<s:property value="#list.id"/>" target="_blank">预览</a>
                                   <a href="/monitor/admin/boardDetails?boardId=<s:property value="#list.id"/>">详情</a>
                               </td>
                           </tr>
                           </s:iterator>
                       </table>
                   </div>
               </div>--%>
           </div>
       </div>
</div>
    <s:include value="/template/_adminFooter.jsp"></s:include>
</div>
<%--<script src="js/boardManage.js"></script>--%>
<script>
    getPage(1);
    function getPage(page){
        $.get('admin/boardList',
            {page:page-1},
            function(data){
                $('#boardList').html(data);
                $('#pageColumn').html($.getDivPageHtml(page,$('#pageColumn').data('endpage'),'(' + getPage + ')'));
            });
    }
    function deleteboard(boardId){

        $.get("admin/deleteBoardCheck",{boardId:boardId},function(data){
            if(data.result=='success'){/*success说明board内无卡片*/
                $.tipModal("confirm","info","确定删除该board吗？",function(result){
                    if(result == true){
                        $.get("admin/deleteBoard",{boardId:boardId},function(data){
                            if(data.result=='success'){
                                $.fillTipBox({type:'success', icon:'glyphicon-ok-sign', content:'删除成功！'});
                                getPage(1);
                            }else{
                                $.fillTipBox({type:'error', icon:'glyphicon-ok-sign', content:'失败请重试'});
                            }

                        });

                    }else{

                    }
                });
            }else{
                $.fillTipBox({type:'danger', icon:'glyphicon-alert', content:'请先将board内卡片删除'})
            }
        });
    }
</script>

</body>
</html>