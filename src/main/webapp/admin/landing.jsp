<%--
  Created by IntelliJ IDEA.
  User: icarus
  Date: 2018/5/29
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "utf-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>
    <title>悉BOARD：高度开放高度自由的一站式展示页面解决方案</title>
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
<s:include value="/template/_landingHead.jsp" />
<div class="front-inner2">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="panel panel-default front-panel" style="background: #e7e7e7; border: 0;">
                    <div class="panel-body" style="height: 100%;padding: 0px;">
                        <img src="images/landing.jpg" class="change-img"  style="width: 100%;max-width: 100%; height: 250px; object-fit: cover;display: block;">
                        <%--height: 271px;width: 847.5px;--%>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default front-panel" style=" border: 0;display: inline;">
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="login" onsubmit="return preSubmit()" style="margin-right: auto; margin-left: auto; width: 90%;">
                            <div class="form-group" style="margin-left: -5%;color:#337ab7;" >
                                BOARD管理门户
                            </div>
                            <div class="form-group" id="email-div">
                                <input type="text" class="form-control login-input" id="email-input" name="email" placeholder="邮箱" >
                            </div>
                            <div class="form-group" id="psw-div">
                                <input type="password" class="form-control login-input" id="psw-input" name="psw" placeholder="密码">
                            </div>
                            <div class="form-group">
                                <%--<div class="col-md-offset-0 col-md-10 col-sm-offset-1">--%>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="rmb-email"> 记住邮箱
                                    </label>
                                </div>
                                <%--</div>--%>
                            </div>
                            <div class="form-group" style="margin-bottom: 9px;">
                                <button type="submit" class="btn btn-info btn-block login-input">登录</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <s:include value="/template/_adminFooter.jsp"></s:include>
</div>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
    $(function () {
        var wrong= "<s:property value="wrongOfEmailOrPsw"/>";
        if(wrong == "true"){
            $.fillTipBox({type:'danger', icon:'glyphicon-alert', content:'邮箱或密码错误！'});
        }
        if($.cookie('email') != undefined) {
            	$('#email-input').val($.cookie('email'));
            	$('#rmb-email').attr('checked', 'true');
            	}
        	$('#email-input').blur(emailInputBlur);
        	$('#psw-input').blur(pswInputBlur);
    });

    function emailInputBlur() {
        if($('#email-div').hasClass("has-error")) {
            $('#email-div').removeClass("has-error");
            $('#email-help-block').hide();
        }
        if($('#email-input').val()==="") {
            $('#email-div').addClass("has-error");
            $('#email-help-block').show();
        }
    }

    function pswInputBlur() {
        if($('#psw-div').hasClass("has-error")) {
            $('#psw-div').removeClass("has-error");
            $('#psw-help-block').hide();
        }
        if($('#psw-input').val() === "") {
            $('#psw-div').addClass("has-error");
            $('#psw-help-block').show();
        }
    }

    function preSubmit() {
        $('#email-input').blur();
        $('#psw-input').blur();
        if($('#rmb-email').is(':checked')) {
            $.cookie('tel', $('#email-input').val());
        } else {
            $.removeCookie('email');
        }
        if($('#email-div').hasClass("has-error") || $('#psw-div').hasClass("has-error")) {
            return false;
        } else {
            $('#psw-input').val($.md5($('#psw-input').val()));
            return true;
        }
    }
</script>
</body>
</html>

