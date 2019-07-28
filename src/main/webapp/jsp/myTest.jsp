<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<style>
.div1{
	height: 200px;
	width: 1000px;
	border: 1px;
	border-color: red;
	border-style:solid;
	margin-left: 150px;
}
.div1> div{
	height: 100px;
	width: 200px;
	border: 1px;
	border-color: red;
	border-style:solid;
	margin-left: 15px;
	margin-top:50px;
	float: left;
}
.div3{
	height: 20px;
	width: 40px;
	border: 1px;
	border-color: red;
	border-style:solid;
	margin-left: 15px;
	margin-top:10px;
	float: left;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">
	function test(){
		/* $(".div1> div:eq(0)> div:first").css("background","red"); */
		$(".div2< div").css("background","red");
	}
	
</script>
<body>
		<div class="div1" id="div1"> 我是祖父类DIV
			<div class="div2">
				我是第一个父类DIV
				<div class="div3">1</div>	
				<div class="div3">2</div>	
				<div class="div3">3</div>	
			</div>
			<div>
				我是第二个父类DIV
			</div>
			<div>
				我是第三个父类DIV
			</div>
			<div>
				我是第四个父类DIV
			</div>
		</div>
		<button onclick="test();" value="">按钮</button>
</body>
</html>