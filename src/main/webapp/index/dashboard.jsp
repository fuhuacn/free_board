<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="constants.Constants"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>${title}</title>
    <script src="repack/js/jquery/jquery.min.js"></script>
    <script src="repack/echarts/echarts3.8.js"></script>
    <script src="highcharts/highcharts.js"></script>
    <script src="highcharts/highcharts-more.js"></script>
    <script src="highcharts/modules/solid-gauge.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="repack/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="repack/css/front.css"/>
    <script src="repack/js/plugin/front.js"></script>
    <script src="http://newfront.free4inno.com/plugin/fileupload/fileupload.min.js"></script>
    <link rel="stylesheet" href="css/dashboard.css"/>
    <style>
        .front-active:after {
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            height: 4px;
            background: <s:if test="bannerLabelColor==''||bannerLabelColor==null">#3778bc</s:if><s:else><s:property value='bannerLabelColor'/></s:else>;
            content: '';
        }

        @media (max-width: 767px) {
            .nav-collapse {
                position: absolute;
                top: 50px;
                left: 0;
                right: 0;
                background-color: <s:if test="bannerColor==''||bannerColor==null">#f8f8f8</s:if><s:else><s:property value='bannerColor'/></s:else>;
                border-top: 1px solid <s:if test="bannerLineColor==''||bannerLineColor==null">#f8f8f8</s:if><s:else><s:property value='bannerLineColor'/></s:else>;
                padding: 0 15px;
            }
        }
    </style>
</head>
<input id="backgroundPic" style="display: none" value="${bkPic}">
<body class="front-body"
      style="background-color: ${bkColor};background-image: url(${bkPic});background-repeat:repeat-y;background-size: 100% ;">
<s:if test="ifBanner=='exist'">
<s:include value="../template/_nav.jsp"/>
<div class="front-inner">
    </s:if>
    <s:else>
    <div class="front-inner" style="padding-top: 0px">
        </s:else>
        <s:if test="ifCover==true">
            <s:include value="/template/_cover.jsp"/>
        </s:if>
        <div class="container" style="width:${width}%;">
            <div class="row" id="dashboards">
            </div>
        </div>
        <s:include value="/template/_footer.jsp"/>
    </div>
    <script src="js/card.js"></script>
    <script>
        var locations="<%=Constants.LOCATION%>"
        var height1 = 100;
        var height2 = 200;
        var height3 = 330.5;
        var height4 = 463;
        var height5 = 550;
        var height6 = 722;
        var height8 = 989;
        var cards = [];
        var index = 0;
        var refreshDic = new Array();
        var uploadValue;
        $(function () {
            $.post("getData", {boardId:${boardId}}, function (data) {
                var dataValue = data.datas;

                for (var i = 0; i < dataValue.length; i++) {
                    // 不为banner类型
                    if (content_html(dataValue[i]) == true) {
                        // 刷新时间为键，卡片序列数组作为值写入字典
                        if (dataValue[i].refresh != null) {
                            if (refreshDic[dataValue[i].refresh] == null) {
                                refreshDic[dataValue[i].refresh] = [dataValue[i].order];
                            } else {
                                refreshDic[dataValue[i].refresh].push(dataValue[i].order);
                            }
                        }
                        //写type刷新用
                        var card = create_card(dataValue[i].type, "charts" + dataValue[i].id);
                        if (dataValue[i].length == 'auto') {
                            $("#" + card.container).css("height", "auto");
                        }
                        try {
                            // 初始化卡片
                            uploadValue = dataValue[i];
                            card.init_card(dataValue[i]);
                        } catch (e) {
                            console.log("ID:" + dataValue[i].id + " no data or data format is wrong.");
                            $("#charts" + dataValue[i].id).html("暂无数据");
                            $("#charts" + dataValue[i].id).css("background-color", dataValue[i].bkcolor);
                            console.log(e);
                        }
                        cards.push(card);
                    }
                }
                for (var key in refreshDic) {
                    (function (key) {
                        setInterval(function () {
                            // 闭包，dataValue为初始化时的获取的配置和数据
                            refreshCharts(refreshDic[key], dataValue, cards);
                        }, key * 1000);
                    })(key);
                }
            });
            window.onresize = function () {
                for (var i = 0; i < cards.length; i++) {
                    try {
                        cards[i].resize();
                    } catch (e) {
                    }
                }
            };
        });

        //刷新
        function refreshCharts(dic, dataValue, cards) {
            var ids = [];
            for (var i = 0; i < dic.length; i++) {
                ids.push(dataValue[dic[i]].dataId);
            }
            $.ajaxSetup({traditional: true});
            $.post("getDataByIds", {dataIds: ids}, function (data) {
                var dataDataValue = data.datas;
                for (var i = 0; i < dataDataValue.length; i++) {
                    try {
                        cards[dic[i]].updateData(dataValue[dic[i]], dataDataValue[i]);
//                    cards[dic[i]].init_card(cards[dic[i]].updateData(dataValue[dic[i]], dataDataValue[i]));
                    } catch (e) {
                        console.log(e);
                    }
                }
            });
        }


        function changeSize(length, wide, id, index) {
            $.ajax({
                url: "changeSize",
                data: {
                    changeId: id,
                    newWide: wide,
                    newLength: length
                },
                success: function (data) {
                    if (!$.isEmptyObject(data.message)) {
                        // "changeSize"
                        console.log(data.message);
                        $.fillTipBox({type: 'warning', icon: 'glyphicon-exclamation-sign', content: '失败了，请重试'});
                        return
                    }
                    $("#panel" + id).attr("class", "panel-groove col-md-" + wide);
                    var height;
                    switch (length) {
                        case 1:
                            height = 100;
                            break;
                        case 2:
                            height = height2;
                            break;
                        case 3:
                            height = height3;
                            break;
                        case 5:
                            height = height5;
                            break;
                        case 6:
                            height = height6;
                            break;
                        case 8:
                            height = height8;
                            break;
                        default:
                            height = height4;
                    }
                    $("#charts" + id).css("height", height);

                    try {
                        cards[index].resize();
                    } catch (e) {
                    }
                    $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '修改成功！'})
                }
            });
        }

        function jumpLink(strHref) {
            window.open(strHref);
        }
    </script>
</body>
</html>
