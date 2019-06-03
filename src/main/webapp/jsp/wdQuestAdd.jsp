<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	function wdtj(){
		var params = $("#wdtjForm").serialize(); 
		alert(params);
	};
</script>
</head>
<body>
	<div class="container-fluid ">
		<form id="wdtjForm" method="post" > 
		<div class="row" style="margin-top: 30px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">问答题题目</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><textarea name="tmAdd" class="form-control" rows="2" style="min-width: 50%"></textarea></div>
		</div>
		
		<div class="row" style="margin-top: 10px">
		  <div class="col-md-6 col-md-offset-3"><font size="4">正确答案：(关键字","隔开)</font></div>
		</div>
		<div class="row" style="margin-top: 10px">
			<div class="col-md-3 col-md-offset-3">
			  	<textarea class="form-control" type="text" name="daAn" rows="1" style=" width: 70%"></textarea>
			</div>
			<div class="col-md-3" style="margin-left: 17.5%">
			  	 <button type="button" class="btn btn-info active" onclick="wdtj();" >提交</button> 
			</div>
		</div>
		</form>
	</div>
</body>
</html>