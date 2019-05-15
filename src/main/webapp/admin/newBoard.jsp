<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>

    <title>新建BOARD</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
</head>
<body class="front-body">
<s:include value="/template/_adminHead.jsp?menu=boardManage" />
<div class="front-inner2">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div>
                    <ol class="breadcrumb">
                        <li>
                            <a href="admin/boardManage">BOARD管理</a>
                        </li>
                        <li class="active">
                            新建BOARD
                        </li>
                    </ol>
                </div>
                <div class="clearfix"></div>
                <div class="panel panel-default front-panel">
                    <div class="panel-heading">新建BOARD</div>
                    <div class="panel-body front-last-no-margin">
                        <div class="form-horizontal">

                            <%--<div class="form-group">--%>
                                <%--<label class="col-md-1 control-label front-label" style="text-align:center">宽度</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="width" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="col-md-1 control-label front-label" style="text-align:center">网页标题</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="title" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="col-md-1 control-label front-label" style="text-align:center">封面</label>--%>
                                <%--<div class="col-md-6">--%>
                                    <%--<input type="text" id="cover" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="form-group" id="ifbanner">--%>
                                    <%--<label class="col-md-1 control-label front-label" style="text-align:center">--%>
                                        <%--导航栏--%>
                                    <%--</label>--%>
                                    <%--<label class="col-md-3 control-label front-label" style="text-align:left">--%>
                                        <%--<input type="checkbox" id="banner" checked> 显示--%>
                                    <%--</label>--%>
                            <%--</div>--%>
                            <%--<div id='bannerdetail'>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">导航颜色</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="bannerColor" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.bannerColor"/>">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">标识</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="logo" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.logo"/>"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">背景颜色</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="bkColor" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.name"/>">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">背景图片</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="bkPic" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.name"/>">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">显示名称</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="displayName" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.name"/>">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right" checked>--%>
                                            <%--<input type="checkbox" id="showBanner">--%>
                                    <%--</label>--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:left">是否显示在导航栏中</label>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<div id='iffooter' class="form-group">--%>
                                <%--<label class="col-md-1 control-label front-label" style="text-align:center;">--%>
                                        <%--页脚--%>
                                <%--</label>--%>
                                <%--<label class="col-md-3 front-label control-label" style="text-align:left">--%>
                                        <%--<input type="checkbox" id="footer" checked>显示--%>
                                <%--</label>--%>
                            <%--</div>--%>
                            <%--<div id='footerdetail'>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">背景颜色</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--<input type="text" id="footerColor" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerColor"/>">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-2 control-label front-label" style="text-align:right">显示内容</label>--%>
                                    <%--<div class="col-md-6">--%>
                                        <%--&lt;%&ndash;<input type="text" id="footerText" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">&ndash;%&gt;--%>
                                        <%--<textarea class="form-control" id="footerText" rows="3"></textarea>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>


                                <div class="form-group">
                                    <label class="col-md-2 control-label front-label"
                                           style="text-align:right"><span class="badge" style="padding-top:5px;padding-bottom:5px;border-radius:7px">导航栏设置</span></label><br/>
                                </div>

                                <div class="form-group" id="ifbanner">
                                    <label class="col-md-2 control-label front-label" style="text-align:right">是否显示导航栏</label>
                                        <label class="col-md-6 control-label front-label" style="text-align:left">
                                            <input type="checkbox" id="banner" checked> 显示
                                        </label>
                                </div>

                                <div id='bannerdetail'>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">背景颜色</label>
                                        <div class="col-md-6">
                                            <input type="text" id="bannerColor"
                                                   class="form-control front-no-box-shadow"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">logo</label>
                                        <div class="col-md-6">
                                            <input type="text" id="logo" class="form-control front-no-box-shadow"/>
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
                                                   class="form-control front-no-box-shadow"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">导航栏边框颜色</label>
                                        <div class="col-md-6">
                                            <input type="text" id="bannerLineColor"
                                                   class="form-control front-no-box-shadow"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">导航栏选中标签颜色</label>
                                        <div class="col-md-6">
                                            <input type="text" id="bannerLabelColor"
                                                   class="form-control front-no-box-shadow"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 control-label front-label"
                                           style="text-align:right"><span class="badge " style="padding-top:5px;padding-bottom:5px;border-radius:7px">底栏设置</span></label><br/>
                                </div>

                                <div class="form-group" id="iffooter">
                                    <label class="col-md-2 control-label front-label" style="text-align:right">是否显示底栏</label>
                                        <label class="col-md-6 control-label front-label" style="text-align:left">
                                            <input type="checkbox" id="footer" checked> 显示
                                        </label>
                                </div>
                                <div id='footerdetail'>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">背景颜色</label>
                                        <div class="col-md-6">
                                            <input type="text" id="footerColor"
                                                   class="form-control front-no-box-shadow">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label front-label" style="text-align:right">显示内容</label>
                                        <div class="col-md-6">
                                            <%--<input type="text" id="footerText" class="form-control front-no-box-shadow" value="<s:property value="dashboardconfigEntities.footerText"/>">--%>
                                            <textarea class="form-control" id="footerText" rows="3"></textarea>
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
                                        <textarea class="form-control" id="coverText" rows="3"></textarea>
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
                                               class="form-control front-no-box-shadow">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label front-label" style="text-align:right">页面标题设置</label>
                                    <div class="col-md-6">
                                        <input type="text" id="pageTitle"
                                               class="form-control front-no-box-shadow"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label front-label" style="text-align:right">页面背景颜色设置</label>
                                    <div class="col-md-6">
                                        <input type="text" id="bkColor"
                                               class="form-control front-no-box-shadow"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label front-label" style="text-align:right">是否显示在导航栏中</label>
                                    <label class="col-md-2 control-label front-label"
                                           style="text-align:left" checked>
                                        <input type="checkbox" id="showBanner" checked>
                                    </label>
                                </div>
                            <div class="form-group" style="margin-bottom:0px">
                                <div class="col-md-12 text-right">
                                    <a href="admin/boardManage"  class="btn btn-default">取消</a>
                                    <a href="javascript:void(0)" onclick="createBoard()" class="btn btn-primary">确认</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <s:include value="/template/_adminFooter.jsp"></s:include>
</div>
</body>
<script>
    $("#ifbanner").find("label").on("click",function(){
//         $("#bannerdetail").slideToggle();
        if($("#banner").is(":checked")==true) {$("#bannerdetail").show();}
        else{$("#bannerdetail").hide();}


    });
    $("#iffooter").find("label").on("click",function(){
        if($("#footer").is(":checked")==true) {$("#footerdetail").show();}
        else{$("#footerdetail").hide();}
//        $("#footerdetail").slideToggle();

    });
    function createBoard(){
        $.tipModal("confirm","info","确定创建该BOARD吗？",function(result){
            if(result == true){
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
                $.post('admin/createBoard', {
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
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功创建！'});
                        setTimeout(function(){
                            window.location.href="admin/boardManage";
                        },2000);
                    }
                })

            }else{

            }
        });

    }

</script>
</html>