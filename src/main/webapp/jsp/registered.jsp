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
	height: 100%;
}
body {
	font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
	padding: 0;
    margin: 0;
}
.content{
	background: url(${pageContext.request.contextPath}/static/img/zucebeijing.jpg) no-repeat 4px 5px;
	background-size:100% 100%; 
	padding-top: 1px;
}
/* .div1{
	width:400px;
	height:50px;
	margin-left: 450px;
	margin-top: 100px;
}
.div2{
	width:400px;
	height:1px;
	margin-left: 450px;
	margin-top: 10px;
}
.select1{
	width:100px;
	height:30px;
	border-radius: 10px;
}
.btn1{
	width:70px;
	height:25px;
	border-radius: 10px;
	background-color: yellow;
}
.table1{
	width:400px;
	height:450px;
	margin-left: 430px;
	margin-top: -400px;
	border:1px solid #F00;
} */

.my_border {
	width:28%;
	margin-left: 36%;
	overflow: hidden;
	border:1px solid #F00;
}
input::-webkit-input-placeholder{ 
	color: black;
}
.input1{
	width:100%;
    height:30px;
    border-radius: 10px;
}
.in_plan {
	width: 100%;
	margin: 20px 0px;
	height: 30px;
	overflow: hidden;
}
.in_plan div:nth-child(1){
	width: 20%;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
}
.in_plan div:nth-child(2){
	width: 65%;
	float: left;
	
}
.sel_check {
	line-height: 30px;
}
.select1{
	width:40%;
	height:30px;
	border-radius: 10px;
}
.btn1{
	width:20%;
	height:25px;
	border-radius: 10px;
	background-color: yellow;
	margin: 0 10px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script>
	$(function(){
		var hight = $(window).height();  
		$(".content").css("height",hight);
		$(".my_border").css("height",hight*0.74);
		$(".my_border").css("margin-top",hight*0.13);
		
	});
	function registeredClick(){
		var params = $("#registeredForm").serialize(); 
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/registered",
			data: params,
			dataType:"json",
			success : function(data) { 
				if(data==0){
					alert("注册失败");
					return ;
				}
				window.location.href="mainpage.jsp";
			},
			 error : function(data){
				alert("注册有误");
			} 
		});
	};
</script>

</head>
<body>
		<div class="content">
			<!-- <form id="registeredForm" method="post" >
				<table class="table1">
					<div class="div1">
							账号：<input type="text" name="userName" placeholder="请输入账号" class="input1" />
					</div>
					<div class="div1" style="margin-top: 10px;">
							密码：<input type="password" name="password" placeholder="请输入密码" class="input1" />
					</div>
					<div class="div1" style="margin-top: 10px;">	
							性别：<input type="radio" name="sex" id="main1" value="1"/>
							<label for="main1">男</label>
							<input type="radio" name="sex" id="main2" value="0"/>
							<label for="main2">女</label>
					</div>
					<div class="div1" style="margin-top: 10px;">
							爱好：
							<label><input type="checkbox" name="aihao" id="aihao0" value="0"/>足球</label>
							<label><input type="checkbox" name="aihao" id="aihao1" value="1"/>篮球</label>
							<label><input type="checkbox" name="aihao" id="aihao2" value="2"/>跑步</label>
							<label><input type="checkbox" name="aihao" id="aihao3" value="3"/>游泳</label>
							<label><input type="checkbox" name="aihao" id="aihao4" value="4"/>其他</label>
					</div>
					<div class="div1" style="margin-top: 10px;">
							民族:<select name="minzu" class="select1">
								<option value="0" selected>汉族</option>
								<option value="1" >满族</option>
								<option value="2">藏族</option>
								<option value="3">维吾尔族</option>
								<option value="4">苗族</option>
								<option value="5">回族</option>
								<option value="6">朝鲜族</option>
								<option value="7">其他</option>
							</select>
					</div>
					<div class="div1" style="margin-top: 10px;">
						<button class="btn1" type="button" onclick="registeredClick();">注册</button>
						<button class="btn1" type="reset" style="margin-left: 200px;">重置</button>
					</div>
				</table>
			</form>  -->
			
			<div class="my_border">
			<form id="registeredForm" method="post" > 
				 <div class="in_plan">
					<div>账号：</div>
					<div><input type="text" name="userName" placeholder="请输入账号" class="input1" /></div>
				</div>
				
				<div class="in_plan">
					<div>密码：</div>
					<div><input type="password" name="password" placeholder="请输入密码" class="input1" /></div>
				</div>
				
				<div class="in_plan">
					<div>性别：</div>
					<div class="sel_check">
						<input type="radio" name="sex" id="main1" value="1"/>
						<label for="main1">男</label>
						<input type="radio" name="sex" id="main2" value="0"/>
						<label for="main2">女</label>
					</div>
				</div>
				
				<div class="in_plan">
					<div>爱好：</div>
					<div class="sel_check">
						<label><input type="checkbox" name="aihao" id="aihao0" value="0"/>足球</label>
						<label><input type="checkbox" name="aihao" id="aihao1" value="1"/>篮球</label>
						<label><input type="checkbox" name="aihao" id="aihao2" value="2"/>跑步</label>
						<label><input type="checkbox" name="aihao" id="aihao3" value="3"/>游泳</label>
						<label><input type="checkbox" name="aihao" id="aihao4" value="4"/>其他</label>
					</div>
				</div>
				
				<div class="in_plan">
					<div>民族:</div>
					<div class="sel_check" >
						<select name="minzu" class="select1" >
								<option value="0" selected>汉族</option>
								<option value="1" >满族</option>
								<option value="2">藏族</option>
								<option value="3">维吾尔族</option>
								<option value="4">苗族</option>
								<option value="5">回族</option>
								<option value="6">朝鲜族</option>
								<option value="7">其他</option>
						</select>
					</div>
				</div>
				
				<div class="in_plan" >
						<button class="btn1" type="button" onclick="registeredClick();">注册</button>
						<button class="btn1" type="reset" style="margin-left: 40%;">重置</button>
				</div>
				</form>
			</div>
			
		</div>	
</body>
</html>