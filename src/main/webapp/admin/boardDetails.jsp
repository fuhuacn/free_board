<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>
    <title>board管理</title>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="repack/js/jquery/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
    <%--<script src="http://newfront.free4lab.com/js/plugin/front.js"></script>--%>
</head>
<body class="front-body">
<s:include value="/template/_adminHead.jsp?menu=boardManage"/>
<input type="hidden" id="boardId" value="${param.boardId}"/>
<div class="front-inner2">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div>
                    <ol class="breadcrumb">
                        <li><a href="admin/boardManage">BOARD管理</a></li>
                        <li class="active"><s:property value="dashboardconfigEntities.name"/></li>
                    </ol>
                </div>
                <div>
                    <div id="commonSetting">
                        <div class="panel panel-default front-panel">
                            <div class="panel-heading">通用设置</div>
                            <div class="panel-body front-last-no-margin">
                                <div class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label"
                                               style="text-align:right"><span class="badge" style="padding-top:5px;padding-bottom:5px;border-radius:7px">导航栏设置</span></label><br/>
                                    </div>

                                    <div class="form-group" id="ifbanner">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">是否显示导航栏</label>
                                        <s:if test='dashboardconfigEntities.ifBanner=="exist"'>
                                            <label class="col-md-6 control-label front-label" style="text-align:left">
                                                <input type="checkbox" id="banner" checked> 显示
                                            </label>
                                        </s:if>
                                        <s:else>
                                            <label class="col-md-6 control-label front-label" style="text-align:left">
                                                <input type="checkbox" id="banner"> 显示
                                            </label>
                                        </s:else>
                                    </div>


                                    <div id='bannerdetail'>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">背景颜色</label>
                                            <div class="col-md-6">
                                                <input type="text" id="bannerColor"
                                                       class="form-control front-no-box-shadow"
                                                       value="<s:property value="dashboardconfigEntities.bannerColor"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">logo</label>
                                            <div class="col-md-6">
                                                <input type="text" id="logo" class="form-control front-no-box-shadow"
                                                       value="<s:property value="dashboardconfigEntities.logo"/>"/>
                                            </div>
                                        </div>
                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-md-2 control-label front-label" style="text-align:right">显示名称</label>--%>
                                        <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="displayName"--%>
                                        <%--class="form-control front-no-box-shadow"--%>
                                        <%--value="<s:property value="dashboardconfigEntities.name"/>">--%>
                                        <%--</div>--%>
                                        <%--</div>--%>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">导航栏字体颜色</label>
                                            <div class="col-md-6">
                                                <input type="text" id="bannerFontColor"
                                                       class="form-control front-no-box-shadow"
                                                       value="<s:property value="dashboardconfigEntities.bannerFontColor"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">导航栏边框颜色</label>
                                            <div class="col-md-6">
                                                <input type="text" id="bannerLineColor"
                                                       class="form-control front-no-box-shadow"
                                                       value="<s:property value="dashboardconfigEntities.bannerLineColor"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">导航栏选中标签颜色</label>
                                            <div class="col-md-6">
                                                <input type="text" id="bannerLabelColor"
                                                       class="form-control front-no-box-shadow"
                                                       value="<s:property value="dashboardconfigEntities.bannerLabelColor"/>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label"
                                               style="text-align:right"><span class="badge " style="padding-top:5px;padding-bottom:5px;border-radius:7px">底栏设置</span></label><br/>
                                    </div>

                                    <div class="form-group" id="iffooter">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">是否显示底栏</label>
                                        <s:if test='dashboardconfigEntities.ifFooter=="exist"'>
                                            <label class="col-md-6 control-label front-label" style="text-align:left">
                                                <input type="checkbox" id="footer" checked> 显示
                                            </label>
                                        </s:if>
                                        <s:else>
                                            <label class="col-md-6 control-label front-label" style="text-align:left">
                                                <input type="checkbox" id="footer"> 显示
                                            </label>
                                        </s:else>
                                    </div>
                                    <div id='footerdetail'>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">背景颜色</label>
                                            <div class="col-md-6">
                                                <input type="text" id="footerColor"
                                                       class="form-control front-no-box-shadow"
                                                       value="<s:property value="dashboardconfigEntities.footerColor"/>">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label front-label" style="text-align:right">显示内容</label>
                                            <div class="col-md-6">
                                                <%--<input type="text" id="footerText" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">--%>
                                                <textarea class="form-control" id="footerText" rows="3"><s:property
                                                        value="dashboardconfigEntities.footerText"/></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label"
                                               style="text-align:right"><span class="badge" style="padding-top:5px;padding-bottom:5px;border-radius:7px">封面设置</span></label><br/>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">封面</label>
                                        <div class="col-md-6">
                                            <%--<input type="text" id="footerText" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">--%>
                                            <textarea class="form-control" id="coverText" rows="3"><s:property
                                                    value="dashboardconfigEntities.cover"/></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label"
                                               style="text-align:right"><span class="badge" style="padding-top:5px;padding-bottom:5px;border-radius:7px">其他设置</span></label><br/>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">BOARD名称</label>
                                        <div class="col-md-6">
                                            <input type="text" id="displayName"
                                                   class="form-control front-no-box-shadow"
                                                   value="<s:property value="dashboardconfigEntities.name"/>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">页面标题设置</label>
                                        <div class="col-md-6">
                                            <input type="text" id="pageTitle"
                                                   class="form-control front-no-box-shadow"
                                                   value="<s:property value="dashboardconfigEntities.title"/>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">页面背景颜色设置</label>
                                        <div class="col-md-6">
                                            <input type="text" id="bkColor"
                                                   class="form-control front-no-box-shadow"
                                                   value="<s:property value="dashboardconfigEntities.bkColor"/>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">是否显示在导航栏中</label>
                                        <s:if test="dashboardconfigEntities.showBanner==1">
                                            <label class="col-md-2 control-label front-label"
                                                   style="text-align:left" checked>
                                                <input type="checkbox" id="showBanner" checked> 显示
                                            </label>
                                        </s:if>
                                        <s:else>
                                            <label class="col-md-2 control-label front-label"
                                                   style="text-align:left">
                                                <input type="checkbox" id="showBanner"> 显示
                                            </label>
                                        </s:else>
                                    </div>
                                    <div class="form-group" style="margin-bottom:0px">
                                        <div class="col-md-12 text-right">
                                            <a href="javascript:void(0)" onclick="cancel()"
                                               class="btn btn-default">取消</a>
                                            <a href="javascript:void(0)"
                                               onclick="setDashboard(<s:property value="boardId"/>)"
                                               class="btn btn-primary">确认</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom:10px">
                        <span class="pull-left" id="num" style="margin-left:5px; margin-top:10px;"></span>
                        <div class="pull-right">
                        <span>
                          <a href="http://www.free4inno.com/?boardId=<s:property value="boardId"/>" target="_blank"
                             class="btn btn-default">预览</a>&nbsp;
                        </span>
                            <span>
                          <a href="javascript:void(0)" onclick='saveOrder()' class="btn btn-default ">保存</a>&nbsp;
                        </span>
                            <span>
                          <a href="javascript:void(0)" onclick="changeOrder()" class="btn btn-default ">排序</a>&nbsp;
                        </span>
                            <span>
                          <a href="admin/newCard?boardId=${param.boardId}&boardName=<s:property value="dashboardconfigEntities.name"/>"
                             class="btn btn-primary ">新建</a>
                        </span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <a id="card" name="card"></a>
                    <div id="cardList"></div>
                </div>
                <div id="loading" class="hidden">
                    <div class="front-loading">
                        <div class="front-loading-block"></div>
                        <div class="front-loading-block"></div>
                        <div class="front-loading-block"></div>
                    </div>
                    <div class="panel-body text-center">正在加载请稍候</div>
                </div>
            </div>
        </div>

    </div>
    <s:include value="/template/_adminFooter.jsp"></s:include>
</div>

<script src="js/boardDetails.js"></script>
<script>
    if ($("#banner").is(":checked") == false) {
        $("#bannerdetail").hide();
    }
    if ($("#footer").is(":checked") == false) {
        $("#footerdetail").hide();
    }
    var boardId = $("#boardId").val();
    var name = '<s:property value="dashboardconfigEntities.name"/>';
    getPage(1);
    /*$.get('admin/cardList?',{
        boardId:boardId,
        boardName:name
    },function(data){
        $("#cardList").html(data);
    });*/

    $("#ifbanner").find("label").on("click", function () {
        /* $("#bannerdetail").slideToggle();*/
        if ($("#banner").is(":checked") == true) {
            $("#bannerdetail").show();
        }
        else {
            $("#bannerdetail").hide();
        }


    });
    $("#iffooter").find("label").on("click", function () {
        if ($("#footer").is(":checked") == true) {
            $("#footerdetail").show();
        }
        else {
            $("#footerdetail").hide();
        }

    });

    function cancel() {
        location.reload();
    }

    function setDashboard(boardId) {
        $.tipModal("confirm", "info", "确定修改该board吗？", function (result) {
            if (result == true) {
                var ifBanner = $("#banner").is(":checked");
                var bannerColor = $("#bannerColor").val();
                var logo = $("#logo").val();
                var displayName = $("#displayName").val();
                var showBanner = $("#showBanner").is(":checked");
                var ifFooter = $("#footer").is(":checked");
                var footerColor = $("#footerColor").val();
                var footerText = $("#footerText").val();
                var cover=$("#coverText").val();
                var bannerLabelColor=$("#bannerLabelColor").val();
                var bannerLineColor=$("#bannerLineColor").val();
                var bannerFontColor=$("#bannerFontColor").val();
                var pageTitle=$("#pageTitle").val();
                var bkColor=$("#bkColor").val();
                $.post('admin/setBoards', {
                    boardId: boardId,
                    ifBanner: ifBanner,
                    bannerColor: bannerColor,
                    logo: logo,
                    displayName: displayName,
                    showBanner: showBanner,
                    ifFooter: ifFooter,
                    footerColor: footerColor,
                    footerText: footerText,
                    cover:cover,
                    bkColor:bkColor,
                    bannerFontColor:bannerFontColor,
                    bannerLineColor:bannerLineColor,
                    bannerLabelColor:bannerLabelColor,
                    title:pageTitle
                }, function (data) {
                    if (data.result == "success") {
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功修改'});
                        getpage(0);
                    }
                })

            } else {

            }
        });
    }

    function getPage(page) {
        var loading = $('#loading').clone();
        loading.removeClass('hidden');
        $('#cardList').html(loading);
        $.get('admin/cardList', {
            boardId: boardId,
            boardName: name,
            page:page-1
        }, function (data) {
            $('#cardList').html(data);
            $('#pageColumn').html($.getDivPageHtml(page,$('#pageColumn').data('endpage'),'(' + getPage + ')'));
            var url=window.location.search;
            if(url.search('flag=1') != -1){
                window.location.hash = '#card';
                return false;
            }
        });
    }

    function deleteCard(cardId) {
        $.tipModal('confirm', 'info', '确认删除该卡片吗？', function (result) {
            if (result == true) {
                $.post('admin/deleteCard', {
                    cardId: cardId
                }, function (data) {
                    if (data.result == 'success') {
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功删除'});
                        setTimeout("getPage(1)", 2000);
                    } else {
                        $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '操作失败请重试'})
                    }
                })
            } else {

            }
        })

    }

    function changeOrder() {
        $.fillTipBox({type: 'info', icon: 'glyphicon-info-sign', content: '拖动表格以排序'})
        $.get('admin/cardList', {
            boardId: boardId,
            boardName: name
        }, function (data) {
            $("#cardList").html(data);
            $("#sortable tbody").sortable(); //移动表格
            $("#sortable tbody").disableSelection(); //移动后固定
        });

    }

    function saveOrder() {
        var orderlist = "";
        $("#sortable tr").each(function (i) {
            if (i != 0)//除去表头
                orderlist = orderlist + $(this).attr("id") + ",";
            //orderlist[i-1]=$(this).attr("id");
        });

        list = JSON.stringify(orderlist);
        $.tipModal('confirm', 'info', '确认保存该顺序吗？', function (result) {
            if (result == true) {
                $.post('admin/changeOrder', {
                    boardId: boardId,
                    orderlist: list
                }, function (data) {
                    if (data.result == "success") {
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功保存排序'})
                        setTimeout("getPage(1)", 5000);
                    }
                    else {
                        $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '操作失败请重试'})
                    }
                });
            } else {
            }
        });
    }
</script>
</body>
</html>