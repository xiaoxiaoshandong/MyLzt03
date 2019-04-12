<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
html,body{
	height: 100%;
	font-size:62.5%;
	
}
body {
	padding: 0;
    margin: 0;
    font:normal 100% Arial,sans-serif;font-size:14px; font-size:1.4rem;
}
.gwc_top {
	line-height:30px;
	background-color: red;
}
.test_a1 {
	position:fixed;
	display: block;
	padding: 10% ;
	background-color: red;
	margin-left: 5%;
	
}
.test_a2 {
	position:fixed;
	display: block;
	padding: 10% ;
	background-color: red;
	margin-left: 55%;
}
.div0{
	width:100%;
	min-width:700px;
	height: 80%;
	background-color: #e4393c;
}
.div1{
	position:fixed;
	padding: 10% ;
	background-color: red;
	margin-left: 5%;
}
.div2{
	/* min-width:200px; */
	position:fixed;
	width:30%;
	height:400px;
	background-color: red;
	margin-left: 55%;
	
}
.div2 div{
	width:8%;
	height: 50px;
	background-color: #d9d9d9;
	float: left;
	margin: 5%;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
</head>
<body>
		<!-- <div class="gwc_top">gwc_top</div>
		<div class="gwc_logo">gwc_logo</div> -->
		<!-- <a href="" class="test_a1">测试1</a> <a href="" class="test_a2">测试2</a> -->
	<div class="div0">
		<div class="div1">div1</div>
		<div class="div2">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
</body>
</html>