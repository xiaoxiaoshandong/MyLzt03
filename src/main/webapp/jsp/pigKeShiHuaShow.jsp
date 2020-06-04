<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/23
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
    <script  src="${pageContext.request.contextPath}/static/jquery/3.3.1/jquery.js"></script>
    <script  src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/moment/2.24.0/moment-with-locales.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/echarts/4.7.0/echarts.js"></script>
    <style>
        table {
            border-collapse:separate;
            border-spacing:  0px 5px;
            font-size:12px;
            filter:alpha(Opacity=60);-moz-opacity:0.9;opacity: 0.7;
            margin-top: 10px;
            text-align: center;
           /* color: #3300FF;*/
            border: 0px solid #ddd !important;
        }

        td {
            background-color: #284c6f;
            BORDER-TOP: 1px solid !important;
            display: table-cell;
            vertical-align: middle;
            text-align:center;
            padding: 0px 0px 0px 0px !important;
            vertical-align:middle !important;
            color:#FFFFFF;
            border-left:0px !important;
            border-right: 0px !important;

        }
        .demo2-bg{
            background: url(${pageContext.request.contextPath}/static/img/pigDaShuJu.jpg) no-repeat 4px 5px;
            backgroundColor:'rgba(128, 128, 128, 0.5)';
            background-size: cover;
            position: relative;
        }
        .demo2{
            filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6
        }
        .form-control {
            background-color:rgba(125,125,125,0);
            border: 0px solid #ddd !important;
        }
        .tbody tr{
            height: 40px;
            border: 0px solid #ddd !important;
           /* color:#fff;*/
        }
      /*  .tableTr {
           !* border: 10px !important;*!
            height: 20px !important;
        }*/
        .tableTr > th{
           padding-top: 6%  !important;
            padding-bottom: 6%  !important;
            background-color:#284c6f;
            text-align:center;
            color:#FFFFFF;
            border: 0px !important;
            font-size: 1em;
          /*  color:#fff;*/
        }
        .yhcz {
            color:#fff;
           font-size: 15px;
        }
    </style>
    <script type="text/javascript">
        function pigTouRuAdd(){
            window.location.href="pigTouRuAdd.jsp";
        };

        function pigTouRuUpdate(){
            window.location.href="pigTouRuUpdate.jsp";
        };



        $(function () {
            var picker1 = $('#datetimepicker1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn'),
                //minDate: '2016-7-1'
            });
            var picker2 = $('#datetimepicker2').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
            //动态设置最小值
            picker1.on('dp.change', function (e) {
                picker2.data('DateTimePicker').minDate(e.date);
            });
            //动态设置最大值
            picker2.on('dp.change', function (e) {
                picker1.data('DateTimePicker').maxDate(e.date);
            });
        });

        $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn'),
            defaultDate: "1990-1-1"
        });



    </script>
</head>

<body>

<div class="container-fluid demo2-bg">
    <div class="row">
        <div class="col-sm-12 dropdown" style="margin-top: 1%;margin-left: 1%;">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="background-color: rgba(0,0,0,0.4);">
                Dropdown button
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="#">A舍</a>
                <a class="dropdown-item" href="#">B舍</a>
                <a class="dropdown-item" href="#">C舍</a>
                <a class="dropdown-item" href="#">D舍</a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3"  style="height:59%; ">
            <div class="yhcz" style="margin-left: 4%;margin-top: 3%;" ><span >用户操作</span></div>
            <table class="table table-bordered" style="margin-left:4%;margin-top: -1%;" >
                    <thead>
                    <tr class="tableTr" style="height: 20px" >
                        <th >编号</th>
                        <th>猪栏</th>
                        <th>类型</th>
                        <th>数量</th>
                        <th>更换时间</th>
                    </tr>
                    </thead>

                    <tbody class="tbody">
                    <tr  >
                        <td >1</td>
                        <td>A栏</td>
                        <td>死亡</td>
                        <td>2</td>
                        <td>2017-06-01 19:00:00</td>
                    </tr>
                    <tr style="">
                        <td>2</td>
                        <td>A栏</td>
                        <td>出栏</td>
                        <td>10</td>
                        <td>2017-06-01 19:00:00</td>
                    </tr>
                    <tr style="">
                        <td>3</td>
                        <td>A栏</td>
                        <td>新增</td>
                        <td>9</td>
                        <td>2017-06-01 19:00:00</td>
                    </tr>
                    <tr style="">
                        <td>4</td>
                        <td>A栏</td>
                        <td>新增</td>
                        <td>9</td>
                        <td>2017-06-01 19:00:00</td>
                    </tr>
                    <tr style="">
                        <td>5</td>
                        <td>A栏</td>
                        <td>新增</td>
                        <td>9</td>
                        <td>2017-06-01 19:00:00</td>
                    </tr>

                    <tr style="">
                        <td>6</td>
                        <td>A栏</td>
                        <td>新增</td>
                        <td>9</td>
                        <td>2017-06-01 19:00:00</td>
                    </tr>
                    </tbody>

            </table>
        </div>
        <div class="col-sm-6" id="lrzs" style="height:59%;"></div>
        <div class="col-sm-3" style="height:59%;">
            <div class="row">
                <div class="col-sm-12" id="zzb" style="height:45%; "></div>
            </div>
            <div class="row">
                <div class="col-sm-12" id="trgxbzt" style="height:45%; "></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <div  class=' form-control' id="trgx"  style="height:33%; "></div>
        </div>
        <div class="col-sm-4">
            <div  class=' form-control' id="gsbl"  style="height:33%;"></div>
        </div>
        <div class="col-sm-3">
            <div  class=' form-control' id="trlr"  style="height:33%; "></div>
        </div>
       <%-- <div class="col-sm-3">投入各项饼状图</div>--%>
    </div>

</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('trgx'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '投入各项(1月1日至今)',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 15
            }
        },
        tooltip: {},
        legend: {
            data:['元'],
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 12
            }
        },
        grid:{left:"2%",right:"2%",bottom:"10%",containLabel:true},
        xAxis: {
         /*   axisLabel:{interval:0,rotate:50,margin:6},*/
            data: ["饲料投入","人工投入","水投入","电投入","粮食投入","防疫投入","其他投入"],
            // x轴的字体样式
            axisLabel: {
                show: true,
                textStyle: {
                    color: '#fff',
                    fontSize:'10'
                }
            }
        },
        yAxis: {
            tpye:'value',
            // y轴的字体样式
            axisLabel: {
                show: true,
                textStyle: {
                    color: '#fff',
                    fontSize:'10'
                }
            }
        },
        series: [{
            name: '元',
            type: 'bar',
            data: [40000,30000,500,900,4000,5000,40000]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.3)' //rgba设置透明度0.1
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option , true);
    window.addEventListener('resize', function() {
            myChart.resize();
        }
    );

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('gsbl'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '个数比例(当前)',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 15
            }
        },
        tooltip: {},
        legend: {
            data:['个'],
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 12
            }
        },
        grid:{left:"2%",right:"2%",bottom:"10%",containLabel:true},
        xAxis: {
            data: ["仔猪","妊娠猪","肥猪","后备猪","配种公猪"],
            // x轴的字体样式
            axisLabel: {
                show: true,
                textStyle: {
                    color: '#fff',
                    fontSize:'10'
                }
            }
        },
        yAxis: {
            tpye:'value',
            // y轴的字体样式
            axisLabel: {
                show: true,
                textStyle: {
                    color: '#fff',
                    fontSize:'10'
                }
            }
        },
        series: [{
            name: '个',
            type: 'bar',
            data: [20,50,100,5,2]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.3)' //rgba设置透明度0.1
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option , true);
    window.addEventListener('resize', function() {
            myChart.resize();
        }
    );

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('trlr'));
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '利润\n(1月1日至今)',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 15
            }
        },
        tooltip: {},
        legend: {
            data:['元'],
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 12
            }
        },
        grid:{left:"2%",right:"2%",bottom:"10%",containLabel:true},
        xAxis: {
            data: ["纯利润","毛利润","投入"],
            // x轴的字体样式
            axisLabel: {
                show: true,
                textStyle: {
                    color: '#fff',
                    fontSize:'10'
                }
            }

        },
        yAxis: {
                tpye:'value',
                // y轴的字体样式
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff',
                        fontSize:'10'
                    }
                }
        },
        series: [{
            name: '元',
            type: 'bar',
            data: [-30000,10000,40000]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.3)' //rgba设置透明度0.1
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option , true);
    window.addEventListener('resize', function() {
            myChart.resize();
        }
    );

// 折线图
    var lrzsChart = echarts.init(document.getElementById('lrzs'));
    option = {
        title: {
            text: '利润走势',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 15
            }
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        legend: {
            data: ['纯利润', '毛利润', '投入'],
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 12
            }
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            },
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: ['2020.1.1', '2020.1.2', '2020.1.3', '2020.1.4', '2020.1.5', '2020.1.6', '2020.1.7'
                    , '2020.1.8', '2020.1.9', '2020.1.10', '2020.1.11', '2020.1.12', '2020.1.13', '2020.1.14'
                    , '2020.1.15', '2020.1.16', '2020.1.17', '2020.1.18', '2020.1.19', '2020.1.20', '2020.1.21'
                    , '2020.1.22', '2020.1.23', '2020.1.24', '2020.1.25', '2020.1.26', '2020.1.27', '2020.1.28'
                    , '2020.1.29', '2020.1.30'
                ],
                // x轴的字体样式
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff',
                        fontSize:'10'
                    }
                }
            },

        ],
        yAxis: [
            {
                type: 'value',
                // y轴的字体样式
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff',
                        fontSize:'10'
                    }
                }
            } ],
        series: [
            {
                name: '纯利润',
                type: 'line',
                stack: '总量',
                areaStyle: {},
                data: [120, 132, 101, 134, 90, 230, 210,120, 132, 101, 134, 90, 230, 210,120, 132, 101, 134, 90, 230
                    , 210,120, 132, 101, 134, 90, 230, 210,222,111]
            },
            {
                name: '毛利润',
                type: 'line',
                stack: '总量',
                areaStyle: {},
                data: [220, 182, 191, 234, 290, 330, 310,220, 182, 191, 234, 290, 330, 310,220, 182, 191, 234, 290, 330
                    , 310,220, 182, 191, 234, 290, 330, 310,555,22]
            },
            {
                name: '投入',
                type: 'line',
                stack: '总量',
                areaStyle: {},
                data: [150, 232, 201, 154, 190, 330, 410,150, 232, 201, 154, 190, 330, 410,150, 232, 201, 154, 190, 330
                    , 410,150, 232, 201, 154, 190, 330, 410,123,221]
            },
        ],
       /* backgroundColor:'rgba(128, 128, 128, 0.5)'*/ //rgba设置透明度0.1
    };
    // 使用刚指定的配置项和数据显示图表。
    lrzsChart.setOption(option , true);
    window.addEventListener('resize', function() {
        lrzsChart.resize();
        }
    );


    // 饼状图
    var zzbChart = echarts.init(document.getElementById('zzb'));

    option = {
        title: {
            text: '猪占比\n(当前)',
            left: 'left',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 15
            },
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        /*legend: {
            orient: 'vertical',
            left: 'left',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 12
            },
            data: ['死亡', '出栏', '新增', '其他']
        },*/
        series: [
            {
                name: '猪占比',
                type: 'pie',
                radius: '80%',
                center: ['55%', '60%'],
                data: [
                    {value: 335, name: '死亡'},
                    {value: 310, name: '出栏'},
                    {value: 234, name: '新增'},
                    {value: 135, name: '其他'}
                ],

                // 修改字体颜色的代码begin
                itemStyle: {
                    normal: {
                        label: {
                            textStyle: {
                                color:'#FFFFFF',
                                fontSize: 12,
                                fontWeight:'bolder'
                            }
                        },
                        labelLine : {
                            lineStyle:{
                                color:'black'
                            }
                        }
                    }
                },

                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    zzbChart.setOption(option , true);
    window.addEventListener('resize', function() {
            zzbChart.resize();
        }
    );
//投入各项饼状图
    var trgxbztChart = echarts.init(document.getElementById('trgxbzt'));

    option = {
        title: {
            text: '投入各项',
            left: 'left',
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 15
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        /*legend: {
            orient: 'vertical',
            left: 'left',
            data: ['饲料', '人工', '水', '电', '粮食','防疫','其他'],
            textStyle: { //图例文字的样式
                color: '#fff',
                fontSize: 12
            }
        },*/
        series: [
            {
                name: '各项投入',
                type: 'pie',
                radius: '80%',
                center: ['55%', '60%'],
                data: [
                    {value: 335, name: '饲料'},
                    {value: 310, name: '人工'},
                    {value: 234, name: '水'},
                    {value: 135, name: '电'},
                    {value: 1548, name: '粮食'},
                    {value: 100, name: '防疫'},
                    {value: 50, name: '其他'}
                ],
                // 修改字体颜色的代码begin
                itemStyle: {
                    normal: {
                        label: {
                            textStyle: {
                                color:'#FFFFFF',
                                fontSize: 12,
                                fontWeight:'bolder'
                            }
                        },
                        labelLine : {
                            lineStyle:{
                                color:'black'
                            }
                        }
                    }
                },
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    trgxbztChart.setOption(option , true);
    window.addEventListener('resize', function() {
        trgxbztChart.resize();
        }
    );
</script>
</body>
</html>

