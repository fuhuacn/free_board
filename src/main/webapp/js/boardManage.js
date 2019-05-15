// $.get('admin/boardList',function(data){
//     $("#boardList").html(data);
// });
//
// // function deleteboard(boardId){
// //
// //     /*$.tipModal("confirm","info","ȷ��ɾ����board��",function(result){alert("asdfd");
// //         if(result == true){
// //             $.get("/monitor/admin/deleteBoard",{boardId:boardId},function(data){
// //                 if(data.result=='success'){
// //                     $.fillTipBox({type:'success', icon:'glyphicon-ok-sign', content:'�ɹ�ɾ����'});
// //                     getPage(0);
// //                 }else{
// //                     $.fillTipBox({type:'error', icon:'glyphicon-ok-sign', content:'ʧ�������ԣ�'});
// //                 }
// //
// //             });
// //
// //         }else{
// //
// //         }
// //     });*/
// //
// // }
// function deleteboard(boardId){
//     $.tipModal("confirm","info","确定删除该board吗？",function(result){
//         if(result == true){
//             $.get("admin/deleteBoard",{boardId:boardId},function(data){
//                 if(data.result=='success'){
//                     $.fillTipBox({type:'success', icon:'glyphicon-ok-sign', content:'删除成功！'});
//                     getPage(0);
//                 }else{
//                     $.fillTipBox({type:'error', icon:'glyphicon-ok-sign', content:'失败请重试'});
//                 }
//
//             });
//
//         }else{
//
//         }
//     });
//
// }
// function getPage(page){
//     $.get('admin/boardList',{page:page},function(data){
//         $("#boardList").html(data);
//     });
// }