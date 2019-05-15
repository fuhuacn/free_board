var setting = {
    data: {
        key: {
            //title: "t",
        },
        simpleData: {
            enable: true
        }

    },
    callback: {
        beforeClick: beforeClick,
        onClick: onClick
    },
    async: {
        enable: true,
    },
    view: {
    	dblClickExpand: false
    	},
};

var setting1 = {
	    data: {
	        key: {
	            //title: "t",
	        },
	        simpleData: {
	            enable: true
	        }

	    },
	    callback: {
	        beforeClick: beforeClick1,
	        onClick: onClick
	    },
	    async: {
	        enable: true,
	    },
	    view: {
	    	dblClickExpand: false
	    	},
	};

var setting2 = {
	    data: {
	        key: {
	            //title: "t",
	        },
	        simpleData: {
	            enable: true
	        }

	    },
	    callback: {
	        beforeClick: beforeClick2,
	        onClick: onClick
	    },
	    async: {
	        enable: true,
	    },
	    view: {
	    	dblClickExpand: false
	    	},
	};
function beforeClick(treeId, treeNode, clickFlag) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	//console.log(zTree);
	zTree.expandNode(treeNode);
    //清空选中成员列表
    $("a[role=clearselected]").click(function() {
        treeNode.click = true;
    });
    $('#freeshare-memberselected').delegate('a[name=delete_member]', 'click', function() {
        treeNode.click = true;
    });

    if (treeNode.pId == null) {
        return false;
    } else if (treeNode.click == false) {
        return false;
    } else {
        return true;
    }
}

function beforeClick1(treeId, treeNode1, clickFlag) {
	var zTree1 = $.fn.zTree.getZTreeObj("treeDemo1");
	console.log(zTree1);
	zTree1.expandNode(treeNode1);
    //清空选中成员列表
    $("a[role=clearselected]").click(function() {
        treeNode1.click = true;
    });
    $('#freeshare-memberselected').delegate('a[name=delete_member]', 'click', function() {
        treeNode1.click = true;
    });

    if (treeNode1.pId == null) {
        return false;
    } else if (treeNode1.click == false) {
        return false;
    } else {
        return true;
    }
}

function beforeClick2(treeId, treeNode2, clickFlag) {
	var zTree2 = $.fn.zTree.getZTreeObj("treeDemo2");
	//console.log(zTree);
	zTree2.expandNode(treeNode2);
    //清空选中成员列表
    $("a[role=clearselected]").click(function() {
        treeNode2.click = true;
    });
    $('#freeshare-memberselected').delegate('a[name=delete_member]', 'click', function() {
        treeNode2.click = true;
    });

    if (treeNode2.pId == null) {
        return false;
    } else if (treeNode2.click == false) {
        return false;
    } else {
        return true;
    }
}

//清空选中成员列表
$("a[role=clearselected]").click(function() {
    $("#freeshare-memberselected li").remove();
    Cal_memberNum();
});
$('#freeshare-memberselected').delegate('a[name=delete_member]', 'click', function() {
    $(this).parent("li").remove();
    Cal_memberNum();
});

function onClick(event, treeId, treeNode, clickFlag) {
	var $selectlist = $("#freeshare-memberselected span");
	var flag = 0;
	for(var i=0;i<$selectlist.length;i++)
	{
		if($selectlist.eq(i).text() == treeNode.name)
		{
			flag = 1;
		}
	}
	if(flag === 0)
	{
		showLog(treeNode.name,treeNode.uid);	
	}
    Cal_memberNum();
    treeNode.click = false;
}

function showLog(str,uid) {
    var selectlist = $("#freeshare-memberselected");
    selectlist.append("<li><span class='freeshare-memberId' action-id=" + uid +">" + str + "</span><a class='pull-right' name='delete_member'>删除</a></li>");
}

/*$(document).ready(function() {
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    
    $("#freeshare-searchbtntree").click(function() {
        alert($("#freeshare-searchcontenttree").val().length);
        if ($("#freeshare-searchcontenttree").val().length > 0) {
            $("#freeshare-searchtitletree").css("display", "block");
            $("#freeshare-searchboxtree").css("display", "block");
        }
    });
});*/
//显示搜索面板
$("#freeshare-searchbtntree").click(function() {
    alert($("#freeshare-searchcontenttree").val().length);
    if ($("#freeshare-searchcontenttree").val().length > 0) {
        $("#freeshare-searchtitletree").css("display", "block");
        $("#freeshare-searchboxtree").css("display", "block");
    }
});
//计算选中成员个数
function Cal_memberNum() {
    var $memberNum = $("#freeshare-memberNum span");
    var $selectmember_list = $("#freeshare-memberselected li");
    $memberNum.text($selectmember_list.length);
}