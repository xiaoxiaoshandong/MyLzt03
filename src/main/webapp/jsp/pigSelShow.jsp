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
            border-collapse:collapse;border:none;
            font-size:12px;
            filter:alpha(Opacity=60);-moz-opacity:0.9;opacity: 0.7;
            margin-top: 10px;
            text-align: center;

        }

        td {
           background-color: #D6BBFF;
            BORDER-TOP: 5px solid !important;
            display: table-cell;
            vertical-align: middle;
            text-align:center;

        }
        th {
              background-color:#D6BBFF;
              BORDER-BOTTOM:  10px solid !important;
            text-align:center;
            display: table-cell;
            vertical-align: middle;

        }
        .demo2-bg{
           /* background: url(${pageContext.request.contextPath}/static/img/pig1.jpg) no-repeat 4px 5px;*/
            backgroundColor:'rgba(128, 128, 128, 0.5)';
            background-size: cover;
            position: relative;
        }
        .demo2{
            filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6
        }
        .form-control {
            background-color:rgba(125,125,125,0);
        }
        .tbody tr{
            height: 53px;
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

<div class="container-fluid ">
    <div class="row">
        <div class="col-sm-12  main ">
            <div class="panel panel-default demo2-bg">
                <div class="panel-heading demo2">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="row">
                        <div class='col-sm-3'>
                            <div class="form-group">
                                <label>选择日期：</label>
                                <!--指定 date标记-->
                                <div class='input-group date' id='datetimepicker1' >
                                      <input type='text' class="form-control"  />
                                      <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                      </span>
                                </div>
                            </div>
                        </div>

                        <div class='col-sm-3'>
                            <div class="form-group">
                                <label>选择日期：</label>
                                <!--指定 date标记-->
                                <div class='input-group date' id='datetimepicker2' >

                                    <input type='text' class="form-control"  />

                                    <span class="input-group-addon">
                                         <span class="glyphicon glyphicon-calendar"></span>
                                     </span>
                                </div>
                            </div>
                        </div>

                        <div class='col-sm-2'>
                             <div class="row">
                                <label >猪舍选择</label>
                             </div>
                            <div class="row">
                                <select class="form-control"  style= "width:90%" >
                                    <option></option>
                                    <option value="1">A猪舍</option>
                                    <option value="2">B猪舍</option>
                                    <option value="3">C猪舍</option>
                                </select>
                            </div>
                        </div>

                      <%--  <div class='col-sm-2'>
                            <div class="row">
                                <label >猪栏选择</label>
                            </div>
                            <div class="row">
                                    <select class="form-control " style= "width:90%">
                                        <option></option>
                                        <option value="1">A栏</option>
                                        <option value="2">B栏</option>
                                        <option value="3">C栏</option>
                                    </select>
                            </div>

                        </div>--%>

                        <div class='col-sm-2'>
                            <div class="row">&nbsp</div>
                            <div class="row" style="margin-top:4%">
                                <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                                </button>
                            </div>
                        </div>
                        </div>
                    </form>

                    <br>
                    <div class="row">
                        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                        <div class='col-sm-4' >
                             <div  class=' form-control' id="lrzs" style="height:70%;margin-top: 3%; "></div>
                        </div>

                        <div class='col-sm-4'>
                            <div  class=' form-control' id="gszs" style="height:70%;margin-top:3%;"></div>
                        </div>
                        <div class='col-sm-4'>
                           <%-- <div class="table-responsive">--%>
                                <table class="table table-bordered" >
                                    <thead>
                                    <tr style="height: 70px;">
                                        <th width="50">编号</th>
                                        <th>更换前</th>
                                        <th>更换后</th>
                                        <th>更换时间</th>
                                    </tr>
                                    </thead>

                                    <tbody class="tbody">
                                        <tr  >
                                            <td >1</td>
                                            <td>A栏</td>
                                            <td>B栏</td>
                                            <td>2017-06-01 19:00:00</td>
                                        </tr>
                                        <tr style="">
                                            <td>2</td>
                                            <td>A栏</td>
                                            <td>B栏</td>
                                            <td>2017-06-01 19:00:00</td>
                                        </tr>
                                        <tr style="">
                                            <td>3</td>
                                            <td>A栏</td>
                                            <td>B栏</td>
                                            <td>2017-06-01 19:00:00</td>
                                        </tr>
                                        <tr style="">
                                            <td>4</td>
                                            <td>A栏</td>
                                            <td>B栏</td>
                                            <td>2017-06-01 19:00:00</td>
                                        </tr>
                                        <tr style="">
                                            <td>5</td>
                                            <td>A栏</td>
                                            <td>B栏</td>
                                            <td>2017-06-01 19:00:00</td>
                                        </tr>

                                        <tr style="">
                                            <td>6</td>
                                            <td>A栏</td>
                                            <td>B栏</td>
                                            <td>2017-06-01 19:00:00</td>
                                        </tr>
                                    </tbody>

                                </table>
                          <%--  </div>--%>
                        </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('lrzs'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '利润展示'
        },
        tooltip: {},
        legend: {
            data:['人数']
        },
        xAxis: {
            data: ["纯利润","毛利润","投入"]
        },
        yAxis: {},
        series: [{
            name: '元',
            type: 'bar',
            data: [-30000,10000,40000]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.5)' //rgba设置透明度0.1
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option , true);
    window.addEventListener('resize', function() {
            myChart.resize();
        }
    );

    // 基于准备好的dom，初始化echarts实例
    var gszsChart = echarts.init(document.getElementById('gszs'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '死亡,出栏,新增比例展示'
        },
        tooltip: {},
        legend: {
            data:['个数']
        },
        xAxis: {
            data: ["死亡","出栏","新增仔猪"]
        },
        yAxis: {},
        series: [{
            name: '个',
            type: 'bar',
            data: [5, 15,50]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.5)' //rgba设置透明度0.1
    };

    // 使用刚指定的配置项和数据显示图表。
    gszsChart.setOption(option , true);
    window.addEventListener('resize', function() {
        gszsChart.resize();
        }
    );


</script>
</body>
</html>
