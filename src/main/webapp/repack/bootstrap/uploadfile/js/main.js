(function($) {
	//文件上传插件的引用
	$.fn.fileUploadUI = function(method, type){
		if( type == undefined ){
			type = "id";
		}
		var typeValue = $(this).attr(type);
			$("[" + type + "=" + typeValue + "]").fileUploadUIReady(method);
	};
})(jQuery);
var FREEDISK_URL = $("#freedisk_url").val();
var initImgUpload = function (suffix) {
	$('#freeshare-avatarform').fileUploadUI({
		autoUpload: false,
        maxChunkSize: 20*1024*1024,
        namespace: 'file_upload_' + suffix,
        fileInputFilter: '#freeshare-photo_' + suffix,//对应photo_1
        dropZone: $('#freeshare-drop_zone_' + suffix),//对应drop_zone_1
        uploadTable: $('#freeshare-avatarinfo'),//对应下面的table
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
                handler.uploadRow.find('.file_upload_progress').html('头像必须为png、jpg或gif类型!');
                setTimeout(function () {
                      handler.removeNode(handler.uploadRow);
                }, 3000);
                return;
            }
            //test the size of file
            if (files[index].size > 30*1024) {
                handler.uploadRow.find('.file_upload_progress').html('文件必须小于30KB!');
                setTimeout(function () {
                     handler.removeNode(handler.uploadRow);
                }, 3000);
                return;
            }
            callBack();
        },
        buildDownloadRow: function (file) {
			if(file.docUuid == null || file.docUuid == ""){//action执行后传回来的uuid
               $("#freeshare-avatarinfo").css({"color":"red"});
               return $('<tr><td>文件上传失败，请重传！<\/td><\/tr>');
            }else{
                $("#freeshare-avatarpreview").attr("src", FREEDISK_URL+"/download?uuid="+file.docUuid);
                //$("#freeshare-avatarpreview").removeClass("hidden");
                $('.front-imgbox-70').find('img').attr("src", FREEDISK_URL+"/download?uuid="+file.docUuid);
                $('.front-imgbox-100').find('img').attr("src", FREEDISK_URL+"/download?uuid="+file.docUuid);
				$("#hiddenuuid").val(file.docUuid);
            } 
        }
    });
};
$(document).ready(function() {
     initImgUpload(1);
});

var $uuid = [];
var initFileUpload = function (suffix) {
	$('#freeshare-avatarfileform').fileUploadUI({
		autoUpload: false,
        maxChunkSize: 20*1024*1024,
        namespace: 'file_upload_' + suffix,
        fileInputFilter: '#freeshare-file_' + suffix,//对应photo_1
        dropZone: $('#freeshare-drop_zone_' + suffix),//对应drop_zone_1
        uploadTable: $('#freeshare-avatarfileinfo'),//对应下面的table
        downloadTable: $('#freeshare-avatarfileinfo'),
        //acceptFileTypes: /(png)|(jpe?g)|(gif)$/i,
        buildUploadRow: function (files, index){
			$("#freeshare-avatarfileinfo").html("");
            return $("<table><tr>" +
                    "<td style=\"padding-left:10px;\"><span style=\"margin-top:10px\">" + files[index].name + "</font></td>" +
                    "<td class=\"file_upload_progress\"><div style=\"margin-top:10px\"></div></td></table>");
        },
        beforeSend: function (event, files, index, xhr, handler, callBack) {
            //test the size of file
            if (files[index].size > 20*1024*1024) {
                handler.uploadRow.find('.file_upload_progress').html('&nbsp;&nbsp;文件必须小于20M!');
                setTimeout(function () {
                     handler.removeNode(handler.uploadRow);
                }, 3000);
                return;
            }
            callBack();
        },
        buildDownloadRow: function (file) {
        	var version = $('#version').val();
			if(file.docUuid == null || file.docUuid == ""){//action执行后传回来的uuid
               $("#freeshare-avatarfileinfo").css({"color":"red"});
               return $('<tr><td>文件上传失败，请重传！<\/td><\/tr>');
            }else{
            	var $newfilename ;
            	console.log($('#freeshare-avatarfilelist .deletefronlist').length);
            	if($('#freeshare-avatarfilelist .deletefronlist').length === 0)
            	{
            		$('#freeshare-avatarfilelist').removeClass('hidden');
                    $newfilename = $('<tr><td id="freeshare-firstline" style="padding-left:10px;"><label>已添加：</label></td><td>'+file.docFileName+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="deletefronlist">[删除]</a></td></tr>');
            	}else{
            		if(version == 'newVersion'){
                	  $uuid.splice(0,1);
              		  console.log($uuid);
              		  $.ajax({
              			  type: 'POST',
              			  url: "filedelete",
              			  data: $uuid[0],
              			  success: function(){
              				  $('#freeshare-avatarfilelist tr').eq(0).remove();
              			  },
              			});	
              	     $('#freeshare-hiddenuuid').remove();	
              	     $newfilename = $('<tr><td id="freeshare-firstline" style="padding-left:10px;"><label>已添加：</label></td><td>'+file.docFileName+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="deletefronlist">[删除]</a></td></tr>');
                  	}
            		else $newfilename = $('<tr><td></td><td>'+file.docFileName+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" class="deletefronlist">[删除]</a></td></tr>');
            	}
            	$newfilename.appendTo('#freeshare-avatarfilelist');
            	$uuid.push(file.docUuid);
            	console.log($uuid);
            	console.log(file);
            	$('#freeshare-hiddenuuid').remove();
            	var $uuidspan = $('<span class="hidden" id="freeshare-hiddenuuid">'+ $uuid.join(',') +'</span>');
            	$uuidspan.appendTo('#freeshare-avatarfilelist');
            } 
        }
    });
};
$(document).ready(function() {
    initFileUpload(1);
});


$('body').delegate('.deletefronlist','click',function(){ 
	  if($(this).parent().parent().index() === 0){
		  $uuid.splice($(this).parent().parent().index(),1);
		  console.log($uuid);
		  $.ajax({
			  type: 'POST',
			  url: "filedelete",
			  data: $uuid[$(this).parent().parent().index()],
			  success: function(){
				  $(this).parent().parent().remove();
				  $('#freeshare-avatarfilelist tr').eq(0).find('td').eq(0).html('<td id="firstline" style="padding-left:10px;"><label>已添加：</label></td><td>');
			  },
			});	
		  $(this).parent().parent().remove();
		  $('#freeshare-avatarfilelist tr').eq(0).find('td').eq(0).html('<td id="firstline" style="padding-left:10px;"><label>已添加：</label></td><td>');
	  }else{
		  $uuid.splice($(this).parent().parent().index(),1);
		  console.log($uuid);
		  $.ajax({
			  type: 'POST',
			  url: "filedelete",
			  data: $uuid[$(this).parent().parent().index()],
			  success: function(){
				  $(this).parent().parent().remove(); 
			  },
			  error: function(){
				  
			  },
			});	
		  $(this).parent().parent().remove(); 
	  }
	  $('#freeshare-hiddenuuid').remove();
	  var $uuidspan = $('<span class="hidden" id="freeshare-hiddenuuid">'+ $uuid.join(',') +'</span>');
  	  $uuidspan.appendTo('#freeshare-avatarfilelist');
});