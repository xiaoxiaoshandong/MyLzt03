<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Bootstrap 101 Template</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<style>
.col-md-12{
 	background-color: red;
}
.row{
	
}
</style>
<script type="text/javascript">
	function xztj(){
		var params = $("#xztjForm").serialize(); 
		
	};
</script>
</head>
<body>
	<div class="container-fluid ">
		<form id="xztjForm" method="post" > 
		<div class="row" style="margin-top: 30px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">选择题题目</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><textarea name="tmAdd" class="form-control" rows="2" style="min-width: 50%"></textarea></div>
		</div>
		
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">A:</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><textarea name="A" class="form-control" rows="1" style="min-width: 50%"></textarea></div>
		</div>
		
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">B:</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><textarea name="B" class="form-control" rows="1" style="min-width: 50%"></textarea></div>
		</div>
		
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">C:</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><textarea name="C" class="form-control" rows="1" style="min-width: 50%"></textarea></div>
		</div>
		
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">D:</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><textarea name="D" class="form-control" rows="1" style="min-width: 50%"></textarea></div>
		</div>
		
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">正确答案：</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col-md-2 col-md-offset-3">
			  	<input class="form-control" type="text" name="daAn" style=" width: 50%"></input>
			</div>
			<div class="col-md-2 col-md-offset-3">
			  	 <button type="button" class="btn btn-info active" onclick="xztj();">提交</button> 
			</div>
		</div>
		</form>
	</div>
</body>
</html>