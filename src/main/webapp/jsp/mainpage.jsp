<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	padding:0;
	margin:0;
	margin:0 auto;
	width:100%;
	height:100%;
	border:1px solid #F00;
	background-image: url(${pageContext.request.contextPath}/static/img/mainpage.jpg);
}
.a0{
height:150px;
width:200px;
background-color:red;
margin-left: 110px;
margin-top: 40px;
float: left;
}
.button0 {
    background-color: #4CAF50; /* Green */
    height:150px;
	width:200px;
	font-size: 35px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script>
	function gouWuShangCheng(){
		window.location.href="${pageContext.request.contextPath}/jsp/gouWuShangCheng.jsp";
		return false;
	};
	
	function shangChengHouTai(){
		window.location.href="${pageContext.request.contextPath}/jsp/shangChengHouTai.jsp";
		return false;
	};
</script>
</head>
<body>
		<!-- <div ><h1>欢迎进入主页面</h1></div> -->


<div class="a0">
<button class="button0" onclick="gouWuShangCheng();" >购物商城</button>
</div>
<div class="a0">
<button class="button0" onclick="shangChengHouTai();" >商城后台</button>
</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>
<div class="a0">待开发中。。。</div>


</body>
</html>