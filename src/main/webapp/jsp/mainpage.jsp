<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body{
	font-size:62.5%;
	min-width: 768px; 
	height:100%;
}
body{
	font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
	padding:0;
	margin:0;
}
.content{
	background: url(${pageContext.request.contextPath}/static/img/mainpage.jpg) no-repeat 4px 5px;
	background-size:100% 100%;
	overflow: hidden;
}
.a0{
height:150px;
width:15%;
background-color:red;
margin-left: 7%;
float: left;
}
.button0 {
    height:150px;
	width:100%;
	font-size: 35px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script>
	$(function(){
		var hight = $(window).height();  
		$(".content").css("height",hight);
		$(".a0").css("margin-top",hight*0.066);
		
	});
	function gouWuShangCheng(){
		window.location.href="${pageContext.request.contextPath}/jsp/gouWuShangCheng.jsp";
		return false;
	};
	
	function shangChengHouTai(){
		window.location.href="${pageContext.request.contextPath}/jsp/shangChengHouTai.jsp";
		return false;
	};
	function examHouTai(){
		window.location.href="${pageContext.request.contextPath}/jsp/examHouTai.jsp";
		return false;
	};
	function javaExam(){
		window.location.href="${pageContext.request.contextPath}/jsp/javaExam.jsp";
		return false;
	};
</script>
</head>
<body>
		<!-- <div ><h1>欢迎进入主页面</h1></div> -->

<div class="content">

	<div class="a0">
	<button class="button0" onclick="gouWuShangCheng();" >购物商城</button>
	</div>
	<div class="a0">
	<button class="button0" onclick="shangChengHouTai();" >商城后台</button>
	</div>
	<div class="a0">
	<button class="button0" onclick="javaExam();" >java面试题试卷</button>
	</div>
	<div class="a0">
	<button class="button0" onclick="examHouTai();" >java面试题系统后台</button>
	</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
	<div class="a0">待开发中。。。</div>
</div>

</body>
</html>