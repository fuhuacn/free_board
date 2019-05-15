<%--
  Created by IntelliJ IDEA.
  User: FuHua
  Date: 2018/5/28
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="constants.Constants" %>
<html>
<head>
    <base href="<%= request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() %>/"/>

    <title>文件管理 - 悉BOARD</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
</head>
<body class="front-body">
<s:include value="/template/_adminHead.jsp?menu=fileManage"/>
<div class="front-inner2">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <span class="text-left" style="padding-left:0">
                        <a href="javascript:void(0)" class="btn btn-default" style="max-width: 20%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; "onclick="updateFile()">
                            从磁盘更新到数据库
                        </a>
                    </span>
                    <span style="padding-right:0">
                        <a href="javascript:void(0)" id="uploadFile" class="btn btn-primary pull-right">上传</a>
                        <span class="searchBox" style="display:inline">
                            <span class="searchMain  pull-right" style="width: 35%; display: inline; margin-right:15px; text-overflow: ellipsis; white-space: nowrap;">
                                <input type="text" id="fuzzyInput" class="form-control front-no-box-shadow freeshare-title " onkeydown="if(event.keyCode==13) {fuzzySearch()} if(event.keyCode==8) {showicon()}" onfocus="showicon()" style="width:80%;" placeholder="请输入搜索内容" >
                                <a href="javascript:void(0)" style="background:white;display:none" id="removeicon" ><span class="glyphicon glyphicon-remove" style="margin-left:-18px;opacity:0.5;top:3px" onclick="clearInput()"></span></a>
                                <a class="btn btn-primary" onclick="fuzzySearch()" style="width:17%;overflow: hidden;text-overflow:ellipsis;white-space:nowrap;margin-top:0">搜索</a>
                                <%--<a href="javascript:void(0)" style="background:white"><span class="glyphicon glyphicon-remove" style="padding-top:10px;margin-left:-10px"></span></a>--%>
                            </span>
                        </span>
                    </span>
                </div>
                <div class="clearfix"></div>
                <div id="filetable"></div>
            </div>
            <div class="modal fade" id="fileupload-modal" tabindex="-1" role="dialog"
                 aria-labelledby="food-info-modal-label">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <h4 class="modal-title" id="food-info-modal-label">上传文件</h4>
                        </div>
                        <div class="modal-body" style="padding:10px">
                            <div class='form-horizontal'>
                                <div class='form-group'>
                                   <div class="col-md-12" style="padding-left:23px">
                                    <input id="file1" type="file" name="uploadFile">
                                   </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
                            <a href="javascript: upload(); $('#fileupload-modal').modal('hide');"
                               class="btn btn-primary">确定</a> <!-- 注意按钮换行会导致多余的外补(margin) -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <s:include value="/template/_adminFooter.jsp"></s:include>

    <script>
        $(function () {
            getPage(1);
            $("[data-toggle='popover']").popover();
        });
        $('#uploadFile').on('click', function () {
            //alert("asdf");
            $("#fileupload-modal").modal();
        })

        function clearInput(){
            $('#removeicon').hide();
            getPage(1);
            $('#fuzzyInput').val("")

        }

        function hideicon(){
            $('#removeicon').hide();
        }

        function showicon(){
            if($('#fuzzyInput').val()!=""&&$('#fuzzyInput').val()!=null){
                $('#removeicon').show();
            }else{
                $('#removeicon').hide();
            }
        }

        function getPage(page){
            $.get('admin/listFiles',{
                page:page-1
            },function(data){
                $('#filetable').html(data);
                $('#pageColumn').html($.getDivPageHtml(page,$('#pageColumn').data('endpage'),'(' + getPage + ')'));
            })
        }

        function deleteFile(fileName,item) {
            var id=$(item).data('id');
            $.tipModal('confirm', 'info', '确认删除该文件吗？', function (result) {
                if (result == true) {
                    $.post('admin/deleteFile', {
                        id:id,
                        uploadFileFileName: fileName
                    }, function () {
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功删除'});
                        setTimeout("self.location.reload();", 1000);
                    })
                }
            })
        }

        function upload() {
            //alert(uploadValue.jsonData);
            var file = document.getElementById("file1");
            var fileobj = file.files[0];
            var formData = new FormData();
            var paramNames = 'uploadFile';
            formData.append(paramNames, fileobj);
            $.ajax({
                url: 'uploadFile',
                type: 'POST',
                data: formData,
                dataType: 'json',
                async: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.uploadFileFileName != null){
                        $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '上传成功！'});
                        getPage(1);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    /*            alert(XMLHttpRequest.status);
                                alert(XMLHttpRequest.readyState);
                                alert(XMLHttpRequest.responseText);
                                alert(textStatus);*/
                    $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '上传失败请重试！'});
                }
            });
        }

        function updateFile(){
            $.tipModal('confirm', 'warning', '确定从磁盘更新到数据库吗？', function(result) {
                if(result==true){
                    $.post('admin/updateFile',{

                    },function(data){
                        if(data.result=="success"){
                            $.fillTipBox({type:'success', icon:'glyphicon-ok-sign', content:'更新成功'})
                        }else{
                            $.fillTipBox({type:'warning', icon:'glyphicon-exclamation-sign', content:'操作失败请重试！'})
                        }
                        setTimeout(function(){
                            getPage(1);
                        },1000);
                    })
                }
            })
        }
        var fuzzyvalue;
        function fuzzySearch(){
            fuzzyvalue=$('#fuzzyInput').val();
            getFuzzyPage(1);
        }

        function getFuzzyPage(page){
            $.get('admin/fuzzySearch',{
                page:page-1,
                value:fuzzyvalue
            },function(data){
                $('#filetable').html(data);
                $('#pageColumn').html($.getDivPageHtml(page,$('#pageColumn').data('endpage'),'(' + getFuzzyPage + ')'));
            })
        }
    </script>
</body>
</html>
