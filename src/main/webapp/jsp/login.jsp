<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html,body{
	font-size:62.5%;
	min-width: 768px; 
}
body {
	font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
	padding: 0;
    margin: 0;
}
.content{
	background: url(${pageContext.request.contextPath}/static/img/login.jpg) no-repeat 4px 5px;
	background-size:100% 100%;
}
.login_box {
	position:relative;
	width:20%;
	margin-left:76%;
	height:auto;
}
.round {
	width:80%;
	border-radius:10%/20%;
	background-color: transparent;
	height: 20px;
	padding: 2px;
}
input::-webkit-input-placeholder{ 
	color: black;
} 
.dl_zc{
	display: block;
	 width: 35%;
	 height:30px;
	border: 2px;
	line-height: 30px;
	text-align: center;
	float: left;
	margin: 0 9% 0 4%;
	background: #ffffff;
	
	
}
a {
	 text-decoration:none; 
}
.zh_mmDiv{
	height: 30px;
	width: 100%;
	margin-bottom: 10px;
}
.zh_mmDiv div:nth-child(1){
	width: 20%;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
}
.zh_mmDiv div:nth-child(2){
	width: 80%;
	height: 30px;
	float: left;
}
.anniuDiv {
	height: 30px;
	width: 100%;
	margin-top: 15px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script>
	$(function(){
		var hight = $(window).height();  
		$(".content").css("height",hight);
		$(".login_box ").css("margin-top",hight*0.6);
	});
	function loginCheck(){
		var params = $("#loginForm").serialize(); 
		$.ajax({
			type:"POST",
			url:"user/login",
			data: params,
			dataType:"json",
			success : function(data) {  
                 if(data==1){
                 window.location.href="jsp/mainpage.jsp";
                 return false;
                 }else{
                	 alert("账号密码不对");
                 }
             },
             error : function(data){
            	 alert("登录错误！");
             }
		});
	};
	
	function registerCheck(){
		window.location.href="jsp/registered.jsp";
		return false;
	};
	
</script>
</head>
<body>
		<div class="content" >	
				<%-- <img id="bg" src="${pageContext.request.contextPath}/static/img/login.jpg" /> --%>
				<!-- 音乐播放 --> 
				<EMBED src="${pageContext.request.contextPath}/static/music/fengZhengWu.mp3"
				 loop="true" autostart="true"  hidden="true"></EMBED>
				 <div class="login_box">
				 		 <form id="loginForm" name="loginForm" method="post">
						 		<!-- <table>
						 		<tr>
						 			<td class="td1">账号 :</td>
						 			<td><input type="text"  name="userName"  placeholder="请输入账号" class="round"/></td>
						 		</tr>
						 		<tr>
						 			<td class="td1">密码 :</td>
						 			<td><input type="password"  name="password"  placeholder="请输入密码" class="round"/></td>
						 		</tr>
						 		<tr>
						 			<td class="td2"><a href="#"  onclick="loginCheck();" id="dengLu">登录</a></td>
						 			<td><button type="button" onclick="registerCheck();">注册</button></td>
						 		</tr>
						 		</table> -->
						 		
						 		<div  class="zh_mmDiv">
						 			<div>账号 :</div>
						 			<div><input type="text"  name="userName"  placeholder="请输入账号" class="round"/></div>
						 		</div>
						 		<div class="zh_mmDiv">
						 			<div>密码 :</div>
						 			<div><input type="password"  name="password"  placeholder="请输入密码" class="round"/></div>
						 			</div>
						 		<div class="anniuDiv">
						 			<a href="#"  onclick="loginCheck();" class="dl_zc">登录</a>
						 			<a type="#" onclick="registerCheck();" class="dl_zc">注册</a>
						 		</div>
				 		</form>
				 </div>
		</div>
</body>
</html>