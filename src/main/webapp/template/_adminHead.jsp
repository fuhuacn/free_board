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
<style>
    .front-active:after {
        position: absolute;
        top: 100%;
        left: 0;
        width: 100%;
        height: 4px;
        background: #337ab7;
        content: '';
    }

    @media (max-width: 767px) {
        .nav-collapse {
            position: absolute;
            top: 50px;
            left: 0;
            right: 0;
            background-color: #f8f8f8;
            border-top: 1px solid #e7e7e7;
            padding: 0 15px;
        }
    }
    @media (min-width: 768px){
        .form-horizontal .control-label {
            padding-top: 3px;
        }
    }
</style>
<nav class="navbar navbar-default navbar-fixed-top front-nav" style="background-color: ${bannerColor};">
    <!-- /.navbar-collapse -->
    <div class="container">
            <!-- 品牌图片大小为150 * 30：宽度不定，高度固定30px -->
        <div class="nav-brand">
            <a href="">
                <img src="images/logo.png" onerror="javascript:this.src='images/logo.png';" style="max-height: 30px"/>
            </a>
        </div>
            <!-- 导航栏菜单 -->
        <div class="nav-collapse collapse" id="nav-collapse-demo">
            <ul class="nav navbar-nav">
                <li class="${param.menu== 'boardManage' ?'front-active' : ''}"><a href="admin/boardManage">BOARD管理</a></li>
                <li class="${param.menu== 'fileManage' ? 'front-active' : ''}"><a href="admin/fileManage">文件管理</a></li>
            </ul>
        </div>
        <div class="nav-right">
            <div class="area area-media">
                <a type="button" class="navbar-btn" style="font-size: 14px" href="javascript:void(0);" onclick="changPassword()">
                    修改密码
                </a>
            </div>
            <div class="area area-media"> <a type="button" class="navbar-btn" href="admin/logout" style="font-size: 14px">退出</a></div>
            <div class="area visible-xs nav-toggle-down" data-toggle="collapse" data-target="#nav-collapse-demo"><span class="glyphicon glyphicon-menu-hamburger" id="front-nav-toggle-down-demo"></span></div>
        </div>
    </div>
</nav>
<div class="row">
    <div class="col-md-12">
        <div class="modal fade" id="modify-modal" tabindex="-1" role="dialog"
             aria-labelledby="modify-pwd-label">
            <div class="modal-dialog" role="modify">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="modify-pwd-label">修改密码</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="pwd_modify">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="old_password">旧密码：</label>
                                <div class="col-md-8" style="padding:0">
                                    <input class="col-md-8" type="password" id="old_password" name="old_password" placeholder="请输入旧密码 " />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="new_password">新密码：</label>
                                <div class="col-md-8" style="padding:0">
                                    <input class="col-md-8" type="password" id="new_password" name="new_password" placeholder="请输入新密码 " />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="confirm_password">确认新密码：</label>
                                <div class="col-md-8" style="padding:0">
                                    <input class="col-md-8" type="password" id="confirm_password" name="confirm_password" placeholder="确认新密码 " />
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
                        <a href="javascript: modify(); $('#modify-modal').modal('hide');"
                           class="btn btn-primary">确定</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function changPassword(){
        $("#modify-modal").modal();
    };
    $(function(){
        $("#modify-modal").on("hide.bs.modal",function(){
            $('#pwd_modify')[0].reset(); //重置表单
            $(this).find("label.error").remove(); //去掉错误提示
        })
    })

    function modify(){
        var old_pwd = $("#pwd_modify #old_password").val();
        var new_pwd = $("#pwd_modify #new_password").val();
        var con_pwd = $("#pwd_modify #confirm_password").val();
        //alert(old_psd);
        //alert(new_psd);
        //alert(con_psd);
        if (old_pwd == "" || new_pwd == "" || con_pwd == "") {
            $.fillTipBox({type:'warning', icon:'glyphicon-exclamation-sign', content:'相关字段不为空,请输入!'});
            return false;
        };
        if (old_pwd == new_pwd) {
            $.fillTipBox({type:'warning', icon:'glyphicon-exclamation-sign', content:'旧密码和新密码相同,请重新输入!'});
            return false;
        };
        if (new_pwd != con_pwd) {
            $.fillTipBox({type:'warning', icon:'glyphicon-exclamation-sign', content:'两次输入新密码不相同,请重新输入!'});
            return false;
        };
        var params = $("#pwd_modify").serialize();
        $.ajax({
            cache: true,
            type: "POST",
            url: 'admin/modify',
            data: params,
            async: false,
            success: function (data) {
                if (data.result == "success") {
                    $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功修改'})
                }
                else{
                    $.fillTipBox({type:'warning', icon:'glyphicon-exclamation-sign', content:'旧密码错误!'});
                }
            }
        });
    }
</script>