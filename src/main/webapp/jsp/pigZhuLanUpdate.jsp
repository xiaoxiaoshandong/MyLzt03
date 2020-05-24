<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/24
  Time: 0:43
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
        function toPigZhuLanManage() {
            window.location.href = "pigZhuLanManage.jsp";
        };

    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">表单数据
        <div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i
                class="glyphicon glyphicon-question-sign"></i></div>
    </div>
    <div class="panel-body">
        <form role="form">
            <div class="form-group">
                <label for="exampleInputPassword1">猪栏名称</label>
                <input type="text" class="form-control" id="exampleInputPassword1" value="test">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">猪舍名称</label>
                <input type="text" class="form-control" id="exampleInputPassword1" value="测试用户">
            </div>
            <div class="form-group">
                <label>猪栏类型</label>
                <select class="form-control">
                    <option></option>
                    <option value="1">仔猪栏</option>
                    <option value="2">妊娠栏</option>
                    <option value="3">肥猪栏</option>
                    <option value="4">后备栏</option>
                    <option value="5">空栏</option>
                    <option value="6">配种公猪栏</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">猪数量</label>
                <div class="input-group col-xs-2">
                        <span class="input-group-btn">
                            <button class="btn btn-white btn-minuse" type="button">-</button>
                         </span>
                        <input type="text" class="form-control no-padding add-color text-center height-25" maxlength="3"
                                    value="0">
                        <span class="input-group-btn">
                            <button class="btn btn-red btn-pluss" type="button">+</button>
                        </span>
                </div>
            </div>
            <button type="button" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i>更新</button>
            <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i>重置</button>
            <button type="button" class="btn btn-info" onclick="toPigZhuLanManage();"><i
                    class="=glyphicon glyphicon-retweet"></i>返回
            </button>
        </form>
    </div>
</div>
</body>
</html>
