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
        function toPigTouRuManage(){
            window.location.href="pigTouRuManage.jsp";
        };

    </script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
    <div class="panel-body">
        <form role="form">
            <div class="form-group ">
                <label >投入类型</label>
                <select class="form-control">
                    <option></option>
                    <option value="1">饲料投入</option>
                    <option value="2">人工投入</option>
                    <option value="3">水投入</option>
                    <option value="4">电投入</option>
                    <option value="5">粮食投入</option>
                    <option value="6">防疫投入</option>
                    <option value="7">其他投入</option>
                </select>
            </div>
            <div class="row">
                <div class="form-group col-md-2 ">
                    <label for="exampleInputPassword1">投入金额(元)</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" value="0.00">
                </div>
            </div>

            <button type="button" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i>新增</button>
            <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i>重置</button>
            <button type="button" class="btn btn-info" onclick="toPigTouRuManage();"><i class="=glyphicon glyphicon-retweet"></i>返回</button>

        </form>
    </div>
</div>
</body>
</html>

