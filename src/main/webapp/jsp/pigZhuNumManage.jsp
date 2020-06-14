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
        function pigZhuNumAdd(){
            window.location.href="pigZhuNumAdd.jsp";
        };

        function pigZhuNumUpdate(){
            window.location.href="pigZhuNumUpdate.jsp";
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
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                        <button type="button" class="btn btn-warning" onclick="pigZhuNumAdd()"><i class="glyphicon  glyphicon-share"></i> 新增
                        </button>
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
                                <th width="100">操作</th>
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
                                <td>
                                    <button type="button" class="btn btn-success btn-xs" onclick="pigZhuNumUpdate();"><i
                                            class="glyphicon glyphicon-edit"></i></button>
                                    <button type="button" class="btn btn-success btn-xs"><i
                                            class="glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>1001</td>
                                <td>A栏</td>
                                <td>2</td>
                                <td>死亡</td>
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
                                <td>1001</td>
                                <td>A栏</td>
                                <td>49</td>
                                <td>出栏</td>
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
