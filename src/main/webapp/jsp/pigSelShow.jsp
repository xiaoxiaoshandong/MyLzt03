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

    <!--图标样式-->
 <%--  <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.24.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>--%>
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

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12  main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">

                        <div class='col-sm-6'>

                            <div class="form-group">

                                <label>选择日期：</label>

                                <!--指定 date标记-->

                                <div class='input-group date' id='datetimepicker1'>

                                    <input type='text' class="form-control" />

                                    <span class="input-group-addon">

                    <span class="glyphicon glyphicon-calendar"></span>

                </span>

                                </div>

                            </div>

                        </div>

                        <div class='col-sm-6'>

                            <div class="form-group">

                                <label>选择日期+时间：</label>

                                <!--指定 date标记-->

                                <div class='input-group date' id='datetimepicker2'>

                                    <input type='text' class="form-control" />

                                    <span class="input-group-addon">

                    <span class="glyphicon glyphicon-calendar"></span>

                </span>

                                </div>

                            </div>

                        </div>

                <div class="form-group ">
                            <label >猪舍选择</label>
                            <select class="form-control">
                                <option></option>
                                <option value="1">A猪舍</option>
                                <option value="2">B猪舍</option>
                                <option value="3">C猪舍</option>
                            </select>
                        </div>

                        <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                        </button>

                    </form>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th>投入类型</th>
                                <th>投入金额(元)</th>
                                <th>创建时间</th>
                                <th>更新时间</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>饲料投入</td>
                                <td>2000.00</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-xs" onclick="pigTouRuUpdate();"><i
                                            class="glyphicon glyphicon-edit"></i></button>
                                    <button type="button" class="btn btn-success btn-xs"><i
                                            class="glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>粮食投入</td>
                                <td>10000.00</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-xs"><i
                                            class="glyphicon glyphicon-edit"></i></button>
                                    <button type="button" class="btn btn-success btn-xs"><i
                                            class="glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>猪舍投入</td>
                                <td>300.00</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-xs"><i
                                            class="glyphicon glyphicon-edit"></i></button>
                                    <button type="button" class="btn btn-success btn-xs"><i
                                            class="glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="7" align="center">
                                    <ul class="pagination">
                                        <li class="disabled"><a href="#">上一页</a></li>
                                        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">下一页</a></li>
                                    </ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
