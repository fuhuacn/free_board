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

var zNodes = [{
    id: 1,
    pId: 0,
    name: "庆亚分舵111",
    open: true,
    uid: 3,
    click:false
},
{
    id: 11,
    pId: 1,
    name: "温鉴荣",
    uid: 1111
},
{
    id: 12,
    pId: 1,
    name: "我很普通，随便点我吧",
    uid: 9
},
{
    id: 13,
    pId: 1,
    name: "叶子节点73",
    uid: 4
},
{
    id: 2,
    pId: 0,
    name: "庆亚分舵222",
    open: true,
    click:false
},
{
    id: 21,
    pId: 2,
    name: "点我可以",
},
{
    id: 22,
    pId: 2,
    name: "叶子",
},
{
    id: 23,
    pId: 2,
    name: "叶子节点2",
},
{
    id: 3,
    pId: 0,
    name: "庆亚分舵333",
    open: false,
    click:false
},
{
    id: 31,
    pId: 3,
    name: "叶子节点3",
},
{
    id: 32,
    pId: 3,
    name: "随便点我吧",
},
{
    id: 33,
    pId: 3,
    name: "节点8",
},
{
    id: 33,
    pId: 3,
    name: "节点8",
},
{
    id: 33,
    pId: 3,
    name: "节点8",
},
{
    id: 33,
    pId: 3,
    name: "节点8",
},
{
    id: 33,
    pId: 3,
    name: "节点8",
}
];

var zNodes1 = [{
    id: 1,
    pId: 0,
    name: "庆亚分舵111",
    open: true,
    uid: 3,
    click:false
},
{
    id: 13,
    pId: 1,
    name: "叶子节点73",
    uid: 4
},
{
    id: 2,
    pId: 0,
    name: "庆亚分舵222",
    open: true,
    click:false
},
{
    id: 21,
    pId: 2,
    name: "点我可以",
},
{
    id: 23,
    pId: 2,
    name: "叶子节点2",
},
];

function beforeClick(treeId, treeNode, clickFlag){
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	//var zTree1 = $.fn.zTree.getZTreeObj("treeDemo1");
	zTree.expandNode(treeNode);
	//zTree1.expandNode(treeNode);
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

function beforeClick1(treeId, treeNode, clickFlag){
	//var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	var zTree1 = $.fn.zTree.getZTreeObj("treeDemo1");
	//zTree.expandNode(treeNode);
	zTree1.expandNode(treeNode);
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



function onClick(event, treeId, treeNode, clickFlag) {
	console.log(treeNode.name);
	var $selectlist = $("#freeshare-memberselected span");
	console.log($selectlist);
	var flag = 0;
	for(var i=0;i<$selectlist.length;i++)
	{
		//console.log($selectlist.eq(i).text());
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

$(document).ready(function() {
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    $.fn.zTree.init($("#treeDemo1"), setting1, zNodes1);
    //显示搜索面板
    $("#freeshare-searchbtntree").click(function() {
        alert($("#freeshare-searchcontenttree").val().length);
        if ($("#freeshare-searchcontenttree").val().length > 0) {
            $("#freeshare-searchtitletree").css("display", "block");
            $("#freeshare-searchboxtree").css("display", "block");
        }
    });
});

//计算选中成员个数
function Cal_memberNum() {
    var $memberNum = $("#freeshare-memberNum span");
    var $selectmember_list = $("#freeshare-memberselected li");
    $memberNum.text($selectmember_list.length);
}