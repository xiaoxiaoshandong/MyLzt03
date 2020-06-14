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
    <script src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js">

    <script type="text/javascript">
        function pigTouRuAdd(){
            window.location.href="pigTouRuAdd.jsp";
        };

        function pigTouRuUpdate(){
            window.location.href="pigTouRuUpdate.jsp";
        };
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

                        <div class="row">
                            <div class='col-sm-3'>
                                <div class="form-group">
                                    <label>起始日期：</label>
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
                                    <label>结束日期：</label>
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

                            <div class='col-sm-2'>
                                <div class="row">
                                    <label >类型</label>
                                </div>
                                <div class="row">
                                    <select class="form-control"  style= "width:90%" >
                                        <option></option>
                                        <option value="1">猪栏更换</option>
                                        <option value="2">猪动态</option>
                                    </select>
                                </div>
                            </div>

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
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th>猪栏ID</th>
                                <th>猪栏名称</th>
                                <th>变更数量</th>
                                <th>修改类型</th>
                                <th>创建时间</th>
                                <th>更新时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>1001</td>
                                <td>A栏</td>
                                <td>50</td>
                                <td>新增</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>2017-06-01 19:00:00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>1001</td>
                                <td>A栏</td>
                                <td>2</td>
                                <td>死亡</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>2017-06-01 19:00:00</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>1001</td>
                                <td>A栏</td>
                                <td>49</td>
                                <td>出栏</td>
                                <td>2017-06-01 19:00:00</td>
                                <td>2017-06-01 19:00:00</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="8" align="center">
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
