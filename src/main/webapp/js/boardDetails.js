/*
/!*if($("#banner").is(":checked")==true) {$("#bannerdetail").removeClass('hidden');}
if($("#footer").is(":checked")==true){ $("#footerdetail").removeClass('hidden');}*!/
if($("#banner").is(":checked")==false) {$("#bannerdetail").hide();}
if($("#footer").is(":checked")==false){ $("#footerdetail").hide();}
var boardId=$("#boardId").val();
$.get('admin/cardList',{boardId:boardId},function(data){
    $("#cardList").html(data);
});

$("#ifbanner").find("label").on("click",function(){
   /!* $("#bannerdetail").slideToggle();*!/
    if($("#banner").is(":checked")==true) {$("#bannerdetail").show();}
    else{$("#bannerdetail").hide();}


});
$("#iffooter").find("label").on("click",function(){
    if($("#footer").is(":checked")==true) {$("#footerdetail").show();}
    else{$("#footerdetail").hide();}

});

function setDashboard(boardId) {
    $.tipModal("confirm","info","确定删除该board吗？",function(result){
        if(result == true){
            var ifBanner = $("#banner").is(":checked");
            var bannerColor = $("#bannerColor").val();
            var logo = $("#logo").val();
            var displayName = $("#displayName").val();
            var showBanner = $("#showBanner").is(":checked");
            var ifFooter = $("#footer").is(":checked");
            var footerColor = $("#footerColor").val();
            var footerText = $("#footerText").val();
            $.post('admin/setBoards', {
                boardId: boardId,
                ifBanner: ifBanner,
                bannerColor: bannerColor,
                logo: logo,
                displayName: displayName,
                showBanner: showBanner,
                ifFooter: ifFooter,
                footerColor: footerColor,
                footerText: footerText
            }, function (data) {
                if (data.result == "success") {
                    $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功修改'});
                    getPage(0);
                }
            })

        }else{

        }
    });
}
/!*    $.tipModal('confirm', 'info', '确认修改吗？', function (result) {
        console.log('ok info callback: ' + result);
        var ifBanner = $("#banner").is(":checked");
        var bannerColor = $("#bannerColor").val();
        var logo = $("#logo").val();
        var displayName = $("#displayName").val();
        var showBanner = $("#showBanner").is(":checked");
        var ifFooter = $("#footer").is(":checked");
        var footerColor = $("#footerColor").val();
        var footerText = $("#footerText").val();
        $.post('admin/setBoards', {
            boardId: boardId,
            ifBanner: ifBanner,
            bannerColor: bannerColor,
            logo: logo,
            displayName: displayName,
            showBanner: showBanner,
            ifFooter: ifFooter,
            footerColor: footerColor,
            footerText: footerText
        }, function (data) {
            if (data.result == "success") {
                $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '成功修改'});
                getPage(0);
            }
        })

    });*!/


function getPage(page){
    $.get('admin/cardList',{boardId:boardId},function(data){
        $("#cardList").html(data);
    });
}

*/
