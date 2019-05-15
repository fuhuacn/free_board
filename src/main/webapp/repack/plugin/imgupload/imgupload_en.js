/**
 * Created by ming on 2017/7/25.
 */
var UploadAvatarModal = function(option) {
    this['default'] = {
        title : 'Modify avatar',
        name : 'doc', // <input type="file" name="doc">
        uploadUrl : '',
        dataUrl : '', // picture url
        dataSource: '', // system picture uuid split with |
        dataUUID: '', // default picture or select picture uuid
        retUUID: 'docUuid'   // return uuid param
    }

    this['configure'] = $.extend(this['default'], option)
    this['configure']['$this'] = $(this)

    var uploadUrl = this['configure']['uploadUrl']

    var template = ['<div class="modal fade" id="front-modal-upload-avatar" tabindex="-1">',
        '<div class="modal-dialog modal-lg">', /* 模态框大小 */
        '<div class="modal-content">',
        '<div class="modal-header">',
        '<button type="button" class="close" action-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
        '<h4 class="modal-title">', this.configure.title, '</h4>', /* 模态框名称 */
        '</div>',
        '<div class="modal-body">',
        '<div class="row">',
        '<div class="col-md-6">',
        '<ul class="nav nav-tabs">',
        '<li class="active">',
        '<a href="#freeshare-diyImg" action-toggle="tab">Custom icon</a>',
        '</li>',
        '<li>',
        '<a href="#freeshare-systemImg" action-toggle="tab">System icon</a>',
        '</li>',
        '</ul>',
        '<div id="myTabContent" class="tab-content front-tab-content">',
        '<div class="tab-pane active in" id="freeshare-diyImg">',
        '<form id="front-pic-form" action="', uploadUrl, '" method="post" enctype="multipart/form-action">', /* 上传图像的后端URL */
        '<input class="btn btn-primary" id="freeshare-drop_zone_1" type="button" value="Upload local image"/>',
        '<input id="freeshare-photo_1" type="file" name="photo" size="1">',
        '<br/>Choose a picture from the local upload, the file size is less than 30kb,<br/>The file types are png, jpg, jpeg, gif<br/>',
        '<img id="freeshare-avatarpreview" height="50" width="50" class="hidden" border="0"/>',
        '<table id="freeshare-avatarinfo" class="xsheight">',
        '<tr><td><br /><br /></td></tr>',
        '</table>',
        '</form>',
        '</div>',
        '<div class="tab-pane fade" id="freeshare-systemImg">']

    var dataSource = this['configure']['dataSource'].split('|')
    var diskUrl = this['configure']['dataUrl']

    for (var i = 0; i < dataSource.length; ++i) {
        template.push('<div class="front-imgbox"><img action-uuid="' + dataSource[i] + '" src="' + diskUrl + dataSource[i] + '"></div>')
    }

    var dataUUID = this['configure']['dataUUID']

    var tailTemplate = ['</div>',
        '</div>',
        '</div>',
        '<div class="col-md-6">',
        '<div class=\'panel panel-default front-panel\' style="margin-top:42px; padding-left:15px">',
        '<div class="panel-body">',
        '<div class="front-imgbox-70">',
        '<img src="', diskUrl,  dataUUID, '">',
        '<p style="margin-top:10px;">70×70</p>',
        '</div>',
        '<div class="front-imgbox-100" >',
        '<img src="', diskUrl, dataUUID, '">',
        '<p style="margin-top:10px;">100×100</p>',
        '</div>',
        '</div>',
        '</div>',
        '</div>',
        '</div>',
        '</div>',
        '<div class="modal-footer">',
        '<a href="#" class="btn btn-default" action-dismiss="modal">Cancel</a>',
        '<a href="#" id="upload-avatar-confirm" class="btn btn-primary">OK</a>',
        '</div>',
        '</div>',
        '</div>',
        '</div>']

    this['configure']['$template'] = $(template.concat(tailTemplate).join(''))
}

UploadAvatarModal.prototype = {
    getUUID : function () {
        return this['configure']['dataUUID']
    },
    generate : function () {
        var configure = this['configure'],
            $modal = configure['$template'],
            retUUID = configure['retUUID'],
            dataUrl = configure['dataUrl'],
            dataUUID = configure['dataUUID'],
            $this = configure['$this']

        $modal.modal().on('hidden.bs.modal', function() {
            $modal.remove()
        }).on('shown.bs.modal', function() {
            // 图像上传初始化
            $('#front-pic-form').fileUploadUIReady({
                autoUpload: false,
                maxChunkSize: 20*1024*1024,
                namespace: 'file_upload_1',
                fileInputFilter: '#freeshare-photo_1',
                dropZone: $('#freeshare-drop_zone_1'),
                uploadTable: $('#freeshare-avatarinfo'),
                downloadTable: $('#freeshare-avatarinfo'),
                acceptFileTypes: /(png)|(jpe?g)|(gif)$/i,
                buildUploadRow: function (files, index) {
                    $("#freeshare-avatarinfo").html("");
                    return $("<table><tr>" +
                        "<td><font color=\"red\">" + files[index].name + "</font></td>" +
                        "<td class=\"file_upload_progress\"><div></div></td></table>");
                },
                beforeSend: function (event, files, index, xhr, handler, callBack) {
                    //test the type of file
                    var regexp = /(png)|(jpe?g)|(gif)$/i;
                    if (!regexp.test(files[index].name)) {
                        handler.uploadRow.find('.file_upload_progress').html('The avatar must be png, jpg or gif type!');
                        setTimeout(function () {
                            handler.removeNode(handler.uploadRow);
                        }, 3000);
                        return;
                    }
                    //test the size of file
                    if (files[index].size > 30*1024) {
                        handler.uploadRow.find('.file_upload_progress').html('The file must be less than 30KB!');
                        setTimeout(function () {
                            handler.removeNode(handler.uploadRow);
                        }, 3000);
                        return;
                    }
                    callBack();
                },
                buildDownloadRow: function (data) {
                    if (data[retUUID] == null || data[retUUID] == "") { // action执行后传回来的uuid
                        $("#freeshare-avatarinfo").css({"color":"red"});
                        return $('<tr><td>The file upload failed, please repeat!<\/td><\/tr>');
                    } else {
                        $("#freeshare-avatarpreview").attr("src", dataUrl + data[retUUID]);
                        $('.front-imgbox-70').find('img').attr("src", dataUrl + data[retUUID]);
                        $('.front-imgbox-100').find('img').attr("src", dataUrl + data[retUUID]);
                        configure['dataUUID'] = data[retUUID]
                    }
                }
            });
            // 选择系统默认图像
            $(".front-imgbox").click(function() {
                var img = $(this).children('img'),
                    imgSrc = img.attr('src')

                $('.front-imgbox-70').children('img').attr('src', imgSrc);
                $('.front-imgbox-100').children('img').attr('src', imgSrc);

                configure['dataUUID'] = img.data('uuid')
            });
            // 点击确认时触发事件
            $('#upload-avatar-confirm').click(function(e) {
                e.preventDefault()
                $this.trigger('avatar-upload.fr.modal.confirm')
                $modal.modal('hide')
            })
        })

        return $this
    }
}