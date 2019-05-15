// 有效宽度数组
var vaild_wide = [1, 2, 3, 4, 8, 12];

//生成html地址
function content_html(data) {
    // if (data.wide != 2 && data.wide != 3 && data.wide != 4 && data.wide != 8 && data.wide != 12) {
    //     data.wide = 4;
    // }
    if (!$.inArray(vaild_wide, data.wide)) {
        data.wide = vaild_wide[2];
    }
    switch (data.length) {
        case '1':
            data.length = height1;
            break;
        case '2':
            data.length = height2;
            break;
        case '3':
            data.length = height3;
            break;
        case '5':
            data.length = height5;
            break;
        case '6':
            data.length = height6;
            break;
        case '8':
            data.length = height8;
            break;
        case 'auto':
            break;
        default:
            data.length = height4;
    }
    var strHTML = "<div id='panel" + data.id + "' class='panel-groove col-md-" + data.wide + " ";
    if (data.wide <= 6) {
        strHTML += "col-xs-" + data.wide * 2;
    } else {
        strHTML += "col-xs-12";
    }
    strHTML += "' style='padding-left: " + data.leftMargin + "px;"
        + "padding-right: " + data.rightMargin + "px;"
        + "padding-top: " + data.topMargin + "px;"
        + "padding-bottom: " + data.bottomMargin + "px;"
        + "'>"
        + "<div class='panel-sp panel-default front-panel' style='";
    if (data.borderColor != "" && data.borderColor != null) {
        strHTML += "border-color:" + data.borderColor + ";";
    }
    else if ($("#backgroundPic") == "") {
        strHTML += "border:none;";
    }
    strHTML += "background: transparent;margin-bottom:0px;'>";
    if (!$.isEmptyObject(data.title)) {
        strHTML += "<div class='panel-heading' id='heading" + data.id + "' style='height:41px;"
        if (data.titleBorderColor != "" && data.titleBorderColor != null) {
            strHTML += "border:" + data.titleBorderColor + " 1px solid;";
        }
        strHTML += "'>" + data.title.substring(0, 40)
            // + "<div class='btn-group' style='float: right'>"
            // + "<button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>"
            // + "<span class='caret'></span>"
            // + "</button>"
            // + "<ul class='dropdown-menu' role='menu'>"
            // + "<li><a href='javascript:changeSize(1,1," + data.id + "," + index + ")'>1*1</a></li>"
            // + "<li><a href='javascript:changeSize(2,2," + data.id + "," + index + ")'>2*2</a></li>"
            // + "<li><a href='javascript:changeSize(4,4," + data.id + "," + index + ")'>4*4</a></li>"
            // + "<li><a href='javascript:changeSize(8,4," + data.id + "," + index + ")'>4*8</a></li>"
            // + "<li><a href='javascript:changeSize(4,8," + data.id + "," + index + ")'>8*4</a></li>"
            // + "<li><a href='javascript:changeSize(1,12," + data.id + "," + index + ")'>12*1</a></li>"
            // + "</ul>"
            // + "</div>"
            + "</div>";
    } else {
        // banner类型
        data.length += 41;
    }
    strHTML += "<div class='panel-body'"
        + "style='padding-left: " + data.leftPadding + "px;"
        + "padding-right: " + data.rightPadding + "px;"
        + "padding-top: " + data.topPadding + "px;"
        + "padding-bottom: " + data.bottomPadding + "px;"
        + "'>"
        + "<div class='front-last-no-margin' style='";
    if (data.paddingBorderColor != "" && data.paddingBorderColor != null) {
        strHTML += "border:" + data.paddingBorderColor + " 1px solid;";
    }
    strHTML += "height:" + data.length + "px;background: transparent;' id='charts" + data.id + "'>"
        + "</div>"
        + "</div>"
        + "</div></div>";
    $("#dashboards").append(strHTML);
    if (data.message != "") {
        $("#charts" + data.id).html(data.message);
        return false;
    }
    index++;
    return true;
}

//生成卡片
function create_card(card_type, container) {
    /*
     增加新的卡片时再次增加方法
     */
    switch (card_type) {
        case 'heart':
            return Object.create(card_heart, {
                container: {value: echarts.init(document.getElementById(container)), writable: true},
            });
            break;
        case 'heart2':
            return Object.create(card_heart2, {
                container: {value: echarts.init(document.getElementById(container)), writable: true},
            });
            break;
        case 'pie':
            return Object.create(card_pie, {
                container: {value: echarts.init(document.getElementById(container)), writable: true},
            });
            break;
        case 'gauge':
            gauge = Object.create(card_gauge);
            gauge.setContainer(container);
            return gauge;
        case 'timeLine':
            return Object.create(card_timeLine, {
                timeLineData: {value: [], writable: true},
                container: {value: echarts.init(document.getElementById(container)), writable: true},
            });
            break;
        case "timeLine2YAxis":
            return Object.create(card_timeLine2YAxis, {
                timeLineData: {value: [], writable: true},
                container: {value: echarts.init(document.getElementById(container)), writable: true},
            });
            break;
        case "banner":
            return Object.create(card_banner, {
                    container: {value: container, writable: true}
                }
            );
            break;
        case "float":
            return Object.create(card_float, {
                    htmlArray: {value: [], writable: true},
                    container: {value: container, writable: true}
                }
            );
            break;
        case "richBanner":
            return Object.create(card_richBanner, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "picText":
            return Object.create(card_picText, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "picText2":
            return Object.create(card_picText2, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "picTextHorizon":
            return Object.create(card_picTextHorizon, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "image":
            return Object.create(card_image, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "bigNews":
            return Object.create(card_bigNews, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "Carousel":
            return Object.create(card_lunbo, {
                    container: {value: container, writable: true},
                }
            );
            break;
        case "upload":
            return Object.create(card_upload, {
                container: {value: container, writable: true},
            });
            break;
        default:
            break;
    }
}

/**
 * 卡片对象需要提供下面的自己接口
 * init_card    初始化，只调用一次，传入参数为卡片的设置数据(param.xxx 字段见数据库cardconfig)，和param.jsonData数据
 * updateData   更新数据，param1第一传入的配置和数据，param2为对应卡片的json数据，获取方式，param2.jsonData
 * resize       改变尺寸
 */

//心跳类卡片生成
var card_heart = {
    // 下面的container好像没有意义
    container: null,
    init_card: function (dataValue) {
        var heartOption = {
            backgroundColor: '',
            series: {
                name: 'name',
                type: 'pie',
                radius: ['70%', '85%'],
                label: {
                    normal: {
                        show: true,
                        position: 'center',
                        fontSize: 20
                    }
                },
                data: [
                    {value: 1, name: 'wrong'}
                ],
                itemStyle: {
                    normal: {
                        color: '#342dc2',
                    }
                }
            }
        };
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            heartOption.backgroundColor = dataValue.bkcolor;
        }
        var currentTime = new Date().getTime() / 1000;
        var heartBeatTime = dataValue.jsonData.heartBeatTime;
        if (currentTime - heartBeatTime < dataValue.jsonData.failureNum * dataValue.jsonData.interval) {
            heartOption.series.data[0].name = "Online";
            heartOption.series.itemStyle.normal.color = "green";
        } else {
            heartOption.series.data[0].name = "Offline";
            heartOption.series.itemStyle.normal.color = "red";
        }
        if (dataValue.wide == 4) {
            heartOption.series.label.normal.fontSize = 55;
        } else if (dataValue.wide == 2) {
            heartOption.series.label.normal.fontSize = 20;
        } else if (dataValue.length == height1) {
            heartOption.series.label.normal.fontSize = 12;
        }
        this.container.setOption(heartOption);
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.heartBeatTime = dataNewValue.jsonData.heartBeatTime;
        dataValue.jsonData.failureNum = dataNewValue.jsonData.failureNum;
        dataValue.jsonData.interval = dataNewValue.jsonData.interval;

        this.init_card(dataValue);
    },
    resize: function () {
        this.container.resize();
    }
};

// 心跳类卡片2
var card_heart2 = {
    // 下面的container好像没有意义
    container: null,
    init_card: function (dataValue) {
        var heartBeatTime = dataValue.jsonData.heartBeatTime, statusColor, bkColor, name;
        var currentTime = new Date().getTime() / 1000;

        if (!$.isEmptyObject(dataValue.bkcolor)) {
            bkColor = dataValue.bkcolor;
        } else {
            bkColor = "";
        }
        // 判断是否离线
        if (currentTime - heartBeatTime < dataValue.jsonData.failureNum * dataValue.jsonData.interval) {
            statusColor = "green";
            name = "Online";
        } else {
            statusColor = "red";
            name = "Offline";
        }
        var heartOption = {
            backgroundColor:'white',
            tooltip: {
                trigger: 'item',
                formatter: "{b}"
            },
            series: {
                name: '',
                type: 'pie',
                hoverOffset: 5,
                // 状态点的位置
                center: ['90%', '90%'],
                // // 状态点的半径
                radius: '10%',
                label: {
                    normal: {show: false}
                },
                data: [
                    {value: 1, name: name}
                ],
                itemStyle: {
                    normal: {
                        color: statusColor
                    }
                }
            }
        };

        this.setCanvasBkImg(dataValue.bkcolor);
        this.container.setOption(heartOption);
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.heartBeatTime = dataNewValue.jsonData.heartBeatTime;
        dataValue.jsonData.failureNum = dataNewValue.jsonData.failureNum;
        dataValue.jsonData.interval = dataNewValue.jsonData.interval;
        dataValue.jsonData.img_url = dataNewValue.jsonData.img_url;

        this.init_card(dataValue);
    },
    /**
     * 的设置card canvas的背景图片,
     * @param img_url 背景图片的url，如果为空值则采用默认图片
     */
    setCanvasBkImg: function (img_url) {
        if ($.isEmptyObject(img_url)) {
            // 默认的图片
            img_url = "http://repack.free4inno.com/resource/img/function2.png";
        }
        var canvas = $(this.container.getDom().firstElementChild);
        // 设置canvas中心的背景图片为 img_url
        canvas.css({
            "background-image": "url(" + img_url + ")",
            "background-size": "70%",
            "background-repeat": "no-repeat",
            "background-position": "center"
        });
    },
    resize: function () {
        this.container.resize();
    }
};

// 饼图类卡片生成
var card_pie = {
    container: null,
    init_card: function (dataValue) {
        var hintFontSize = 12, bkcolor = "";
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            bkcolor = dataValue.bkcolor;
        }
        // if (dataValue.wide >= 4) {
        //     hintFontSize = 27;
        // } else {
        //     hintFontSize = 10;
        // }
        var pieOption = {
            backgroundColor: bkcolor,
            tooltip: {
                trigger: 'item',
                formatter: "{b} : {c} ({d}%)"
            },
            series: {
                name: 'pie',
                type: 'pie',
                radius: '60%',
                center: ['50%', '50%'],
                data: dataValue.jsonData.data.sort(function (a, b) {
                    return a.value - b.value;
                }),
                //roseType: 'radius',
                label: {
                    normal: {
                        fontSize: hintFontSize
                    }
                }
            }
        };

        this.container.setOption(pieOption);
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData = dataNewValue.jsonData;
        dataValue.wide = dataNewValue.wide;
        dataValue.length = dataNewValue.length;

        this.init_card(dataValue);
    },
    resize: function () {
        this.container.resize();
    }
};

// 百分比同心环图
var card_gauge = {
    container: null,
    chart: null,
    setContainer: function (cID) {
        this.containerID = cID;
    },
    init_card: function (dataValue) {
        var hintFontSize = 12, bkcolor = "";
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            bkcolor = dataValue.bkcolor;
        }
        $("#" + this.containerID).css({
            "background-color": bkcolor,

        });
        // if (dataValue.wide >= 4) {
        //     hintFontSize = 27;
        // } else {
        //     hintFontSize = 12;
        // }
        var series_config = this.__genSeries(dataValue.jsonData);
        var chartOption = {
            credits: {enabled: false},
            chart: {
                type: 'solidgauge',
                backgroundColor: bkcolor,
            },
            title: {text: ''},
            tooltip: {
                borderWidth: 0,
                backgroundColor: 'none',
                shadow: false,
                style: {
                    fontSize: hintFontSize + 'px'
                },
                pointFormat: '{series.name}<br><span style="font-size:1em; color: {point.color}; font-weight: bold">{point.y}%</span>',
                positioner: function (labelWidth) {
                    return {
                        x: (this.chart.chartWidth - labelWidth) / 2,
                        y: (this.chart.plotHeight / 2) - hintFontSize
                    };
                }
            },
            pane: {
                background: series_config.background
            },
            yAxis: {
                min: 0,
                max: 100,
                lineWidth: 0,
                tickPositions: []
            },
            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        enabled: false
                    },
                    linecap: 'round',
                    stickyTracking: false,
                    rounded: true
                }
            },
            series: series_config.series
        };

        this.chart = Highcharts.chart(this.containerID, chartOption);
    },
    /**
     * 根据数据计算chart配置数据
     * @param param 数据格式应该为{"data":[{"name":"name1","value":1},{"name":"name","value":2},...]}
     * @returns {{series: Array, background: Array}}
     * @private
     */
    __genSeries: function (param) {
        var ret = {series: [], background: []};
        var len = param.data.length, max_r = 115, min_r = 50;
        if (len == 0) {
            return ret;
        }
        var wide_r = (max_r - min_r) / len;
        for (var i = 0; i < len; i++) {
            var outer_r = max_r - wide_r * i;
            ret.series.push({
                name: param.data[i].name,
                data: [{
                    color: Highcharts.getOptions().colors[i],
                    radius: outer_r + '%',
                    innerRadius: (outer_r - wide_r) + '%',
                    y: param.data[i].value
                }]
            });
            ret.background.push({
                outerRadius: outer_r + '%',
                innerRadius: (outer_r - wide_r) + '%',
                backgroundColor: Highcharts.Color(Highcharts.getOptions().colors[i]).setOpacity(0.3).get(),
                borderWidth: 0
            });
        }
        return ret;
    },
    updateData: function (dataValue, dataNewValue) {
        var len = dataNewValue.jsonData.data.length;
        for (var i = 0; i < len; i++) {
            this.chart.series[i].data[0].update(dataNewValue.jsonData.data[i].value);
        }
    },
    resize: function (height, width) {
        this.chart.setSize(null);
    }
};

var card_timeLine = {
    container: null,
    timeLineData: null,
    card_id: null,
    init_card: function (dataValue) {
        var dataTime = dataValue.jsonData.dataTime;
        var content = dataValue.jsonData.data;
        var maxPoints = dataValue.jsonData.maxPoints;
        var dataName = null, labelFontSize = 10;
        // 判断是否自定义纵坐标最大值
        var isDef_Ymax = dataValue.jsonData.hasOwnProperty("max");
        // 判断是否自定义纵坐标最小值
        var isDef_Ymin = dataValue.jsonData.hasOwnProperty("min");

        this.card_id = dataValue.id;
        if (dataValue.jsonData.hasOwnProperty("dataName")) {
            if (dataValue.jsonData.dataName.length == dataValue.jsonData.data.length) {
                dataName = dataValue.jsonData.dataName;
            }
        }
        // 如果多数据点，累积绘制
        if (maxPoints > 0) {
            this.timeLineData = this.recordData(dataTime * 1000, content, maxPoints);
            var timeLineOption = {
                tooltip: {
                    formatter: function (obj) {
                        var value = obj.value;
                        return '<div>'
                            + obj.seriesName
                            + "<br>"
                            + new Date(value[0]).toLocaleTimeString() + ' - '
                            + value[1]
                            + dataValue.jsonData.unit
                            + '</div>';
                    }
                },
                legend: {
                    y: 'top',
                    data: [],
                    show: true,
                    left: 'center'
                },
                xAxis: {
                    type: 'time',
                },
                yAxis: {
                    name: '',
                    type: 'value',
                    axisLabel: {
                        fontSize: labelFontSize
                    }
                },
                grid: {},
                series: []
            };
            if (dataValue.bkcolor != null && dataValue.bkcolor != "") {
                timeLineOption.backgroundColor = dataValue.bkcolor;
            }
            timeLineOption.yAxis.name = dataValue.jsonData.yAxis + "\n(" + dataValue.jsonData.unit + ")";
            for (var i = 0; i < this.timeLineData.length; i++) {
                for (var j = 0; j < this.timeLineData[i][1].length; j++) {
                    if (timeLineOption.series.length == j) {
                        timeLineOption.series.push({type: "line", data: [], name: ""});
                        if (dataName != null) {
                            timeLineOption.series[j].name = dataName[j];
                        }
                    }
                    timeLineOption.series[j].data.push([this.timeLineData[i][0], this.timeLineData[i][1][j]]);
                }
            }
            if (dataName != null) {
                timeLineOption.legend.show = true;
                timeLineOption.legend.data = dataName;
            }
            if (isDef_Ymax) {
                timeLineOption.yAxis.max = dataValue.jsonData.max;
            }
            if (isDef_Ymin) {
                timeLineOption.yAxis.min = dataValue.jsonData.min;
            }
            this.container.setOption(timeLineOption);

            // 修复当卡片为最小尺寸时候可能出现纵坐标label显示不全的问题
            if (dataValue.wide == 2) {
                // 获取自动生成的纵坐标范围的最大值的数值的位数
                var yAxis1Max = this.container.getModel().getComponent('yAxis', 0).axis.scale.getExtent()[1].toString().length;
                // 根据最大值计算纵坐标label的宽度，如果为一位数字，无论数据是否为小数，留白小数点后一位
                if (yAxis1Max != 1) {
                    timeLineOption.grid.x = labelFontSize * yAxis1Max;
                } else {
                    timeLineOption.grid.x = labelFontSize * 2.5;
                }
                // 重新再设置
                this.container.setOption(timeLineOption);
            }
        }
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.yAxis = dataNewValue.jsonData.yAxis;
        dataValue.jsonData.unit = dataNewValue.jsonData.unit;
        dataValue.jsonData.dataTime = dataNewValue.jsonData.dataTime;
        dataValue.jsonData.data = dataNewValue.jsonData.data;
        if (dataNewValue.jsonData.hasOwnProperty("dataName")) {
            if (dataNewValue.jsonData.dataName.length == dataNewValue.jsonData.data.length
                && dataValue.jsonData.hasOwnProperty("dataName")) {
                dataValue.jsonData.dataName = dataNewValue.jsonData.dataName;
            }
        }
        if (dataNewValue.jsonData.hasOwnProperty("max")) {
            dataValue.jsonData.max = dataNewValue.jsonData.max;
        }
        if (dataNewValue.jsonData.hasOwnProperty("min")) {
            dataValue.jsonData.min = dataNewValue.jsonData.min;
        }
        this.init_card(dataValue);
    },
    resize: function () {
        this.container.resize();
    },
    // 将数据存储到浏览器的localStorage之中
    recordData: function (data_time, data_value, max_points) {
        var record = localStorage.getItem(this.card_id);
        if (record === null) {
            record = [];
        } else {
            record = JSON.parse(record);
            var timeInterval = data_time - record[record.length - 1][0];
            if (timeInterval > 12 * 60 * 60 * 1000) { //超过12小时清空历史数据
                record = [];
            }
            else if (timeInterval > 0) {
                if (record.length > max_points) {
                    record.shift();
                }
            }
        }
        record.push([data_time, data_value]);
        localStorage.setItem(this.card_id, JSON.stringify(record));
        return record;
    }
};

var card_timeLine2YAxis = {
    container: null,
    timeLineData: null,
    card_id: null,
    init_card: function (dataValue) {
        var dataTime = dataValue.jsonData.dataTime;
        var content = dataValue.jsonData.data;
        var maxPoints = dataValue.jsonData.maxPoints;
        var dataName = null, labelFontSize = 10;
        var isDef_Ymax1 = dataValue.jsonData.hasOwnProperty("max1");
        var isDef_Ymax2 = dataValue.jsonData.hasOwnProperty("max2");
        var isDef_Ymin1 = dataValue.jsonData.hasOwnProperty("min1");
        var isDef_Ymin2 = dataValue.jsonData.hasOwnProperty("min2");

        this.card_id = dataValue.id;
        if (dataValue.jsonData.hasOwnProperty("dataName")) {
            if (dataValue.jsonData.dataName.length == dataValue.jsonData.data.length) {
                dataName = dataValue.jsonData.dataName;
            }
        }
        if (maxPoints > 0) {
            this.timeLineData = this.recordData(dataTime * 1000, content, maxPoints);
            var timeLineOption = {
                tooltip: {
                    formatter: function (obj) {
                        var value = obj.value;
                        return '<div>'
                            + obj.seriesName
                            + "<br>"
                            + new Date(value[0]).toLocaleTimeString() + ' - '
                            + value[1] + value[2]
                            + '</div>';
                    }
                },
                legend: {
                    y: 'top',
                    data: [],
                    show: true,
                    left: 'center'
                },
                xAxis: {
                    type: 'time'
                },
                yAxis: [{
                    name: dataValue.jsonData.yAxis1 + "\n(" + dataValue.jsonData.unit1 + ")",
                    type: 'value',
                    axisLabel: {
                        fontSize: labelFontSize
                    }
                }, {
                    name: dataValue.jsonData.yAxis2 + "\n(" + dataValue.jsonData.unit2 + ")",
                    type: 'value',
                    axisLabel: {
                        fontSize: labelFontSize
                    }
                }],
                grid: {},
                series: [{type: "line", data: [], name: ""}, {type: "line", yAxisIndex: 1, data: [], name: ""}]
            };
            if (!$.isEmptyObject(dataValue.bkcolor)) {
                timeLineOption.backgroundColor = dataValue.bkcolor;
            }
            for (var i = 0; i < this.timeLineData.length; i++) {
                timeLineOption.series[0].data.push([this.timeLineData[i][0], this.timeLineData[i][1][0], dataValue.jsonData.unit1]);
                timeLineOption.series[1].data.push([this.timeLineData[i][0], this.timeLineData[i][1][1], dataValue.jsonData.unit2]);
            }
            if (dataName != null) {
                timeLineOption.legend.show = true;
                timeLineOption.legend.data = dataName;
                timeLineOption.series[0].name = dataName[0];
                timeLineOption.series[1].name = dataName[1];
            }
            if (isDef_Ymax1) {
                timeLineOption.yAxis[0].max = dataValue.jsonData.max1;
            }
            if (isDef_Ymax2) {
                timeLineOption.yAxis[1].max = dataValue.jsonData.max2;
            }
            if (isDef_Ymin1) {
                timeLineOption.yAxis[0].min = dataValue.jsonData.min2;
            }
            if (isDef_Ymin2) {
                timeLineOption.yAxis[1].min = dataValue.jsonData.min2;
            }
            this.container.setOption(timeLineOption);

            // 修复当卡片为最小尺寸时候可能出现纵坐标label显示不全的问题
            if (dataValue.wide == 2) {
                // 获取自动生成的纵坐标范围的最大值的数值的位数
                var yAxis1Max = this.container.getModel().getComponent('yAxis', 0).axis.scale.getExtent()[1].toString().length;
                var yAxis2Max = this.container.getModel().getComponent('yAxis', 1).axis.scale.getExtent()[1].toString().length;
                // 根据最大值计算纵坐标label的宽度，如果为一位数字，无论数据是否为小数，留白小数点后一位
                if (yAxis1Max != 1) {
                    timeLineOption.grid.x = labelFontSize * yAxis1Max;
                } else {
                    timeLineOption.grid.x = labelFontSize * 2.5;
                }
                if (yAxis2Max != 1) {
                    timeLineOption.grid.x2 = labelFontSize * yAxis2Max;
                } else {
                    timeLineOption.grid.x2 = labelFontSize * 2.5;
                }
                // 重新再设置
                this.container.setOption(timeLineOption);
            }
        }
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.yAxis1 = dataNewValue.jsonData.yAxis1;
        dataValue.jsonData.yAxis2 = dataNewValue.jsonData.yAxis2;
        dataValue.jsonData.unit1 = dataNewValue.jsonData.unit1;
        dataValue.jsonData.unit2 = dataNewValue.jsonData.unit2;
        dataValue.jsonData.dataTime = dataNewValue.jsonData.dataTime;
        dataValue.jsonData.data = dataNewValue.jsonData.data;
        if (dataNewValue.jsonData.hasOwnProperty("dataName")) {
            if (dataNewValue.jsonData.dataName.length == dataNewValue.jsonData.data.length && dataValue.jsonData.hasOwnProperty("dataName")) {
                dataValue.jsonData.dataName = dataNewValue.jsonData.dataName;
            }
        }
        if (dataNewValue.jsonData.hasOwnProperty("max1")) {
            dataValue.jsonData.max1 = dataNewValue.jsonData.max1;
        }
        if (dataNewValue.jsonData.hasOwnProperty("max2")) {
            dataValue.jsonData.max2 = dataNewValue.jsonData.max2;
        }
        if (dataNewValue.jsonData.hasOwnProperty("min1")) {
            dataValue.jsonData.min1 = dataNewValue.jsonData.min1;
        }
        if (dataNewValue.jsonData.hasOwnProperty("min2")) {
            dataValue.jsonData.min2 = dataNewValue.jsonData.min2;
        }
        this.init_card(dataValue);
    },
    resize: function () {
        this.container.resize();
    },
    // 将数据存储到浏览器的localStorage之中
    recordData: function (data_time, data_value, max_points) {
        var record = localStorage.getItem(this.card_id);
        if ($.isEmptyObject(record)) {
            record = [];
        } else {
            record = JSON.parse(record);
            var timeInterval = data_time - record[record.length - 1][0];
            if (timeInterval > 12 * 60 * 60 * 1000) { //超过12小时清空历史数据
                record = [];
            } else if (timeInterval > 0) {
                if (record.length > max_points) {
                    record.shift();
                    console.log(this.card_id);
                }
            }
        }
        record.push([data_time, data_value]);
        localStorage.setItem(this.card_id, JSON.stringify(record));
        return record;
    }
};
var card_banner = {
    container: null,
    init_card: function (dataValue) {
        var html = "";
        if (dataValue.jsonData.hasOwnProperty('text') && dataValue.jsonData.text != "") {
            html += "<p style='font-size: 20px'>" + dataValue.jsonData.text + "</p>";
        }
        if (dataValue.jsonData.hasOwnProperty('imgURL') && dataValue.jsonData.imgURL != "") {
            html += "<img style='max-height: 200px' src='" + dataValue.jsonData.imgURL + "' alt='图片'>"
        }
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        $("#" + this.container).html(html);
        if (dataValue.jsonData.noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
    },
    updateData: function (dataValue, dataNewValue) {
        if (dataNewValue.jsonData.hasOwnProperty('text')) {
            dataValue.jsonData.text = dataNewValue.jsonData.text;
        } else {
            dataValue.jsonData.text = "";
        }
        if (dataNewValue.jsonData.hasOwnProperty('imgURL')) {
            dataValue.jsonData.imgURL = dataNewValue.jsonData.imgURL;
        } else {
            dataValue.jsonData.imgURL = "";
        }
        dataValue.jsonData.noBorder = dataNewValue.jsonData.noBorder
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_float = {
    container: null,
    htmlArray: null,
    init_card: function (dataValue) {
        var tempHtml = "";
        if (dataValue.jsonData.hasOwnProperty('imgURL') && dataValue.jsonData.imgURL != "") {
            tempHtml += "<img style='max-height: 80px' src='" + dataValue.jsonData.imgURL + "' alt='图片'>";
        }
        if (dataValue.jsonData.hasOwnProperty('text') && dataValue.jsonData.text != "") {
            tempHtml += dataValue.jsonData.text;
        }
        if (this.htmlArray.length == 0 || this.htmlArray[this.htmlArray.length - 1][1] != tempHtml) {
            if (this.htmlArray.length == dataValue.jsonData.maxSize) {
                this.htmlArray.splice(0, 1);
            }
            this.htmlArray.push([dataValue.jsonData.time, tempHtml]);
            if (!$.isEmptyObject(dataValue.bkcolor)) {
                $("#" + this.container).css("background-color", dataValue.bkcolor);
            }
            var floatHtml = "";
            for (var i = 0; i < this.htmlArray.length; i++) {
                floatHtml = "<div id='float" + i + "' style='font-size: 20px'>" + new Date(this.htmlArray[i][0] * 1000).toLocaleString() + "&nbsp;" + this.htmlArray[i][1] + "</div>" + floatHtml;
            }
            floatHtml = "<div id='float'>" + floatHtml + "</div>";
            $("#" + this.container).html(floatHtml);
            $("#float" + (this.htmlArray.length - 1)).hide();
            $("#float" + (this.htmlArray.length - 1)).show(1000);
        }
    },
    updateData: function (dataValue, dataNewValue) {
        if (dataNewValue.jsonData.hasOwnProperty('text')) {
            dataValue.jsonData.text = dataNewValue.jsonData.text;
        } else {
            dataValue.jsonData.text = "";
        }
        if (dataNewValue.jsonData.hasOwnProperty('imgURL')) {
            dataValue.jsonData.imgURL = dataNewValue.jsonData.imgURL;
        } else {
            dataValue.jsonData.imgURL = "";
        }
        dataValue.jsonData.maxSize = dataNewValue.jsonData.maxSize;
        dataValue.jsonData.time = dataNewValue.jsonData.time;

        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_richBanner = {
    container: null,
    init_card: function (dataValue) {
        var strHtml = dataValue.jsonData.html;
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        $("#" + this.container).html(strHtml);
        if (dataValue.jsonData.href != undefined) {
            $("#" + this.container).attr("onclick", "jumpLink('" + dataValue.jsonData.href + "')");
            $("#" + this.container).css("cursor", "pointer");
        }
        if (dataValue.jsonData.noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.html = dataNewValue.jsonData.html;
        dataValue.jsonData.href = dataNewValue.jsonData.href;
        dataValue.jsonData.noBorder = dataNewValue.jsonData.noBorder
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_picText = {
    container: null,
    init_card: function (dataValue) {
        var pic = dataValue.jsonData.pic;
        var text = dataValue.jsonData.text;
        var title = dataValue.jsonData.title;
        var href = dataValue.jsonData.href;
        var noBorder = dataValue.jsonData.noBorder;
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        if (noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
        var strHtml = "<div style='text-align:center'>"
            + "<img style='margin-bottom: 20px;max-width:100%;height: 200px' src='" + pic + "'>"
            + "<h1 style='margin-bottom: 20px'>" + title + "</h1>"
            + text
            + "</div>";
        $("#" + this.container).html(strHtml);
        if (href != undefined) {
            $("#" + this.container).attr("onclick", "jumpLink('" + href + "')");
            $("#" + this.container).css("cursor", "pointer");
        }
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.pic = dataNewValue.jsonData.pic;
        dataValue.jsonData.noBorder = dataNewValue.jsonData.noBorder
        dataValue.jsonData.text = dataNewValue.jsonData.text;
        dataValue.jsonData.title = dataNewValue.jsonData.title;
        dataValue.jsonData.href = dataNewValue.jsonData.href;
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_picText2 = {
    container: null,
    init_card: function (dataValue) {
        var uuid = dataValue.jsonData.uuid;
        var pic =locations + uuid;
        //var pic = dataValue.jsonData.pic;
        var text = dataValue.jsonData.text;
        var title = dataValue.jsonData.title;
        var href = dataValue.jsonData.href;
        var noBorder = dataValue.jsonData.noBorder;
        var cardSize = dataValue.jsonData.picSize;
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        if (noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
        var strHtml = "<div style='margin-bottom: 20px;border: 10px solid #ececec;border-radius: 50%;position: relative;width: 145px;height: 145px;margin: auto;'>"
            + "<i id='picText2" + dataValue.id + "' style='border-radius: 50%;background:url(" + pic + ") no-repeat center;width:100%; height:100%;position: absolute;background-size: " + cardSize + "px'></i></div>"
            + "<div style='text-align: center'><h3 style='margin-top:10px;margin-bottom: 5px'>" + title + "</h3>"
            + text + "</div>";

        $("#" + this.container).html(strHtml);
        if (href != undefined) {
            if (href.substring(0, 1) == '?') {
                $("#picText2" + dataValue.id).attr("onclick", "window.open('" + href + "')");
            }
            else {
                $("#picText2" + dataValue.id).attr("onclick", "jumpLink('" + href + "')");
            }
            $("#picText2" + dataValue.id).css("cursor", "pointer");
        }
        $("#" + this.container).parent().css("padding", "0px");
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.pic = dataNewValue.jsonData.pic;
        dataValue.jsonData.noBorder = dataNewValue.jsonData.noBorder
        dataValue.jsonData.text = dataNewValue.jsonData.text;
        dataValue.jsonData.title = dataNewValue.jsonData.title;
        dataValue.jsonData.href = dataNewValue.jsonData.href;
        dataValue.jsonData.picSize = dataNewValue.jsonData.picSize;
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_picTextHorizon = {
    container: null,
    init_card: function (dataValue) {
        var uuid = dataValue.jsonData.uuid;
        var pic = locations+ uuid;
        //var pic = dataValue.jsonData.pic;
        var text = dataValue.jsonData.text;
        var href = dataValue.jsonData.href;
        var noBorder = dataValue.jsonData.noBorder;
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        if (noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
        var strHtml = "<div class='row'>"
            + "<div class='col-md-2' style='text-align:center'><img style='max-width:100%;' src='" + pic + "'></div>"
            + "<div class='col-md-10'><div style='font-size: 18px;'>" + text + "</div></div>"
            + "</div>";
        $("#" + this.container).html(strHtml);
        if (href != undefined) {
            $("#" + this.container).attr("onclick", "jumpLink('" + href + "')");
            $("#" + this.container).css("cursor", "pointer");
        }
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.pic = dataNewValue.jsonData.pic;
        dataValue.jsonData.noBorder = dataNewValue.jsonData.noBorder
        dataValue.jsonData.text = dataNewValue.jsonData.text;
        dataValue.jsonData.href = dataNewValue.jsonData.href;
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_image = {
    container: null,
    init_card: function (dataValue) {
        //var url = dataValue.jsonData.url;
        var noBorder = dataValue.jsonData.noBorder;
        var uuid = dataValue.jsonData.uuid;
        var url = locations+ uuid;
        if (noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
        var strHtml = "<img src='" + url + "' class='image' style='width: " + dataValue.jsonData.width + "%'>";
        strHtml += "</img>";
        $("#" + this.container).html(strHtml);
        $("#" + this.container).parent().css("text-align", "center");
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.url = dataNewValue.jsonData.url;
        dataValue.jsonData.width = dataNewValue.jsonData.width;
        dataValue.jsonData.noBorder = dataNewValue.jsonData.noBorder;
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_bigNews = {
    container: null,
    init_card: function (dataValue) {
        var date = dataValue.jsonData.date;
        var text = dataValue.jsonData.text;
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        if (dataValue.jsonData.noBorder == true) {
            $("#" + this.container).parent().parent().css("border", "none");
        }
        var strHtml = "<div class='col-md-2' style='padding: 10px 0px;font-size: 14px;border-bottom: 1px solid #ededed'>" + date + "</div><div style='padding: 10px 0px;font-size: 14px;border-bottom: 1px solid #ededed' class='col-md-10'>" + text + "</div>";
        $("#" + this.container).html(strHtml);
    },
    updateData: function (dataValue, dataNewValue) {
        dataValue.jsonData.date = dataNewValue.jsonData.date;
        dataValue.jsonData.text = dataNewValue.jsonData.text;
        dataValue.jsonData.noBorder = dataNewalue.jsonData.noBorder;
        this.init_card(dataValue);
    },
    resize: function () {
    }
};
var card_lunbo = {
    container: null,
    init_card: function (dataValue) {
        //var urls=dataValue.jsonData.urls;
        var urls = dataValue.jsonData.uuids;
        var chevron = dataValue.jsonData.chevron;
        var strHtml = "<div id='carousel-example-generic"+dataValue.id+"' class='carousel slide' data-ride='carousel' data-interval='5000' style='width:100%;'>"
            + "<ol class='carousel-indicators'>";
        for (i = 0; i < urls.length; i++) {
            if (i == 0)
                strHtml = strHtml + "<li data-target='#carousel-example-generic"+dataValue.id+"' data-slide-to='0' class='active'></li>";
            else
                strHtml = strHtml + "<li data-target='#carousel-example-generic"+dataValue.id+"' data-slide-to='" + i + "'></li>";
        }
        strHtml = strHtml + "</ol>"
            + "<div class='carousel-inner' role='listbox'>";
        for (i = 0; i < urls.length; i++) {
            if (i == 0) {
                strHtml = strHtml + "<div class='item active'>"
                    + "<a href='javascript:void(0)'><img src='"+locations + urls[i].uuid + "' style='width:100%' class='img-responsive' alt='Slide1'></a>"
                    + "</div>";
            }
            else {
                strHtml = strHtml + "<div class='item'>"
                    + "<a href='javascript:void(0)'><img src='"+locations + urls[i].uuid + "' style='width:100%' class='img-responsive' alt='Slide2'></a>"
                    + "</div>"
            }
        }
        strHtml = strHtml + "</div>"
            + "<a class='left carousel-control' href='#carousel-example-generic"+dataValue.id+"' role='button' data-slide='prev'"
            + "style=' background-image:none; background-repeat: repeat-x; filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#80000000\', endColorstr=\'#00000000\', GradientType=1);'>"
            + "<span class='glyphicon glyphicon-chevron-left' style='color:" + chevron + "; opacity:0.5' aria-hidden='true'></span>"
            + "<span class='sr-only'>Previous</span>"
            + "</a>"
            + "<a class='right carousel-control' href='#carousel-example-generic"+dataValue.id+"' role='button' data-slide='next'"
            + "style='left: auto; right: 0; background-image:none; background-repeat: repeat-x;  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=\'#00000000\\', endColorstr=\'#80000000\', GradientType=1);'>"
            + "<span class='glyphicon glyphicon-chevron-right' style='color:" + chevron + "; opacity:0.5' aria-hidden='true'></span>"
            + "<span class='sr-only'>Next</span>"
            + "</a>"
            + "</div>"
            + "<div style='text-align: center;font-size: 40px; margin-top:10px'><span  id='active'><a href='javascript:void(0)' onclick=\"card_lunbo.play('"+dataValue.id+"')\"><span class='glyphicon glyphicon-play' style='opacity:0.5' aria-hidden='true'></span></a></span>"
            + "<span  id='pause' class='hide'><a href='javascript:void(0)' onclick=\"card_lunbo.pause('"+dataValue.id+"')\"><span class='glyphicon glyphicon-pause' style='opacity:0.5' aria-hidden='true'></span></a></span></div>"
           ;
        $("#" + this.container).html(strHtml);
        $('#carousel-example-generic').carousel();
    },
    updateData: function (dataValue, dataNewValue) {

        this.init_card(dataValue);
    },
    resize: function () {
    },
    play: function (id) {
        $('#active').addClass('hide');
        $('#pause').removeClass('hide');
        $('#carousel-example-generic'+id).carousel('cycle');
    },
    pause: function (id) {
        $('#pause').addClass('hide');
        $('#active').removeClass('hide');
        $('#carousel-example-generic'+id).carousel('pause');
    }
};

var card_upload = {
    container: null,
    init_card: function (dataValue) {
        if (!$.isEmptyObject(dataValue.bkcolor)) {
            $("#" + this.container).css("background-color", dataValue.bkcolor);
        }
        //if (dataValue.jsonData.noBorder == true) {
        $("#" + this.container).parent().parent().css("border", "none");
        //}
        $("#" + this.container).parent().css("padding", "0px");
        var heading = dataValue.jsonData.heading;
        var strHtml =
            "<div class='panel panel-default front-panel' style='margin:0'>" +
            "    <div class='panel-heading'>" +
            "        <strong>" + heading + "</strong>" +
            "    </div>" +
            "    <div class='panel-body'>" +
            "        <div class='form-horizontal'>" +
            "<form id='uploadForm'> " +
            "            <div class='form-group'>" +
            "                <label class='col-md-1 control-label front-label' style='text-align:center'>文件</label>" +
            "                <input type=\"file\" id='file1' name=\"uploadFile\">" +
            "            </div>" +
            "            <div class='from-group'>" +
            "                <div class='text-right col-md-12'>" +
            "                    <input type=\"button\" class='btn btn-primary' value=\"提交\" onclick='upload()'>" +
            "                </div>" +
            "            </div>" +
            "</form>" +
            "        </div>" +
            "    </div>" +
            "</div>";

        $("#" + this.container).html(strHtml);
    },
    updateData: function (dataValue, dataNewValue) {

        this.init_card(dataValue);
    },
    resize: function () {
    }

};

function upload() {
    //alert(uploadValue.jsonData);
    var file = document.getElementById("file1");
    var fileobj = file.files[0];
    var formData = new FormData();
    var paramNames = uploadValue.jsonData.paramName;
    var actions = uploadValue.jsonData.action;
    formData.append(paramNames, fileobj);
    $.ajax({
        url: actions,
        type: 'POST',
        data: formData,
        dataType: 'json',
        async: false,
        contentType: false,
        processData: false,
        success: function (data) {
            if (data.uploadFileFileName != null)
                $.fillTipBox({type: 'success', icon: 'glyphicon-ok-sign', content: '上传成功！'});
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