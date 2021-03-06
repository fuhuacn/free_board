<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>
    <title>新建卡片</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
</head>
<body class="front-body">
<s:include value="/template/_adminHead.jsp?menu=boardManage"/>
<div class="front-inner2">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div>
                    <ol class="breadcrumb">
                        <li><a href="admin/boardManage">BOARD管理</a></li>
                        <li><a href="admin/boardDetails?boardId=${param.boardId}">${param.boardName}</a></li>
                        <li class="active">新建卡片</li>
                    </ol>
                </div>
                <div class="panel panel-default front-panel">
                    <div class="panel-heading">
                        新建卡片
                        <div class="pull-right" ><a href="admin/cardDemo.html" target="_blank">样式参考</a></div>
                    </div>

                    <div class="panel-body front-last-no-margin">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">卡片ID</label>
                                <div class="col-md-4">
                                    <div class="form-control front-no-box-shadow">ID将自动生成</div>
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">卡片名称</label>
                                <div class="col-md-4">
                                    <input type="text" id="cardname" class="form-control front-no-box-shadow" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">类型</label>
                                <div class="col-md-4">
                                    <input type="text" id="typing" class="form-control front-no-box-shadow" value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">卡片标题</label>
                                <div class="col-md-4">
                                    <input type="text" id="title" class="form-control front-no-box-shadow" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">尺寸</label>
                                <div class="col-md-4">
                                    <input type="text" id="size" class="form-control front-no-box-shadow" value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">背景颜色</label>
                                <div class="col-md-4">
                                    <input type="text" id="bkcolor" class="form-control front-no-box-shadow" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">刷新</label>
                                <div class="col-md-4">
                                    <input type="text" id="refresh" class="form-control front-no-box-shadow" value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">边框颜色</label>
                                <div class="col-md-4">
                                    <input type="text" id="bordercolor" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label"
                                       style="text-align:center">标题边框颜色</label>
                                <div class="col-md-4">
                                    <input type="text" id="titlebordercolor" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label"
                                       style="text-align:center">填充边框颜色</label>
                                <div class="col-md-4">
                                    <input type="text" id="paddingbordercolor" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">左填充</label>
                                <div class="col-md-4">
                                    <input type="text" id="leftpadding" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">右填充</label>
                                <div class="col-md-4">
                                    <input type="text" id="rightpadding" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">上填充</label>
                                <div class="col-md-4">
                                    <input type="text" id="toppadding" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">下填充</label>
                                <div class="col-md-4">
                                    <input type="text" id="bottompadding" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">左边距</label>
                                <div class="col-md-4">
                                    <input type="text" id="leftmargin" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">右边距</label>
                                <div class="col-md-4">
                                    <input type="text" id="rightmargin" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">上边距</label>
                                <div class="col-md-4">
                                    <input type="text" id="topmargin" class="form-control front-no-box-shadow" value="">
                                </div>
                                <div class="col-md-1"></div>
                                <label class="col-md-1 control-label front-label" style="text-align:center">下边距</label>
                                <div class="col-md-4">
                                    <input type="text" id="bottommargin" class="form-control front-no-box-shadow"
                                           value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-1 control-label front-label" style="text-align:center">卡片内容</label>
                                <div class="col-md-4">
                                    <textarea class="form-control" id="content" rows="5"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom:0px">
                                <div class="col-md-12 text-right">
                                    <a href="admin/boardDetails?boardId=${param.boardId}" class="btn btn-default">取消</a>
                                    <a href="javascript:void(0)" onclick="createCard()" class="btn btn-primary">确认</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    var boardId =${param.boardId};

    function createCard() {
        $.tipModal("confirm", "info", "确定创建该卡片吗？", function (result) {
            if (result == true) {
                var typing = $("#typing").val();
                var title = $("#title").val();
                var size = $("#size").val();
                var bkcolor = $("#bkcolor").val();
                var refresh = $("#refresh").val();
                var bordercolor = $("#bordercolor").val();
                var titlebordercolor = $("#titlebordercolor").val();
                var paddingbordercolor = $("#paddingbordercolor").val();
                var leftpadding = $("#leftpadding").val();
                var rightpadding = $("#rightpadding").val();
                var toppading = $("#toppadding").val();
                var bottompadding = $("#bottompadding").val();
                var leftmargin = $("#leftmargin").val();
                var rightmargin = $("#rightmargin").val();
                var topmargin = $("#topmargin").val();
                var bottommargin = $("#bottommargin").val();
                var content = $("#content").val();
                var cardname = $("#cardname").val();
                if (!checkSize(size)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '尺寸应为（a,b）格式'});
                    return;
                } else if (!isInt(refresh)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”刷新“应为整数'});
                    return;
                } else if (!isInt(leftpadding)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”左填充“应为整数'});
                    return;
                } else if (!isInt(rightpadding)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”右填充“应为整数'});
                    return;
                } else if (!isInt(toppading)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”上填充“应为整数'});
                    return;
                } else if (!isInt(bottompadding)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”下填充“应为整数'});
                    return;
                } else if (!isInt(leftmargin)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”左边距“应为整数'});
                    return;
                } else if (!isInt(rightmargin)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”右边距“应为整数'});
                    return;
                } else if (!isInt(topmargin)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”上边距“应为整数'});
                    return;
                } else if (!isInt(bottommargin)) {
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '”下边距“应为整数'});
                    return;
                }
                $.post('admin/createCard', {
                    cardname:cardname,
                    boardId: boardId,
                    typing: typing,
                    title: title,
                    size: size,
                    bkcolor: bkcolor,
                    refresh: refresh,
                    bordercolor: bordercolor,
                    titlebordercolor: titlebordercolor,
                    paddingbordercolor: paddingbordercolor,
                    leftpadding: leftpadding,
                    rightpadding: rightpadding,
                    toppadding: toppading,
                    bottompadding: bottompadding,
                    leftmargin: leftmargin,
                    rightmargin: rightmargin,
                    topmargin: topmargin,
                    bottommargin: bottommargin,
                    content: content
                }, function (data) {
                    if (data.result == "success") {
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功创建卡片'});
                        setTimeout(function () {
                            window.location.href="admin/boardDetails?boardId=${param.boardId}&flag=1";
                        }, '3000');
                    } else {
                        $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '操作失败请重试'});
                    }
                })
            } else {

            }
        });
    }

    function checkSize(size) {
        var regex = /^([a-zA-Z0-9_]+),([a-zA-Z0-9_]+)$/;
        if (regex.test(size)){
            return true;
        }
        else return false;
    }

    function isInt(str) {
        if (str == null || str == "") return true;
        else if (!/^\d+$/.test(str)) return false;
        else return true;
    }
</script>
</html>
