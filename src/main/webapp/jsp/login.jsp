<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html,body{
	height: 100%;
	font-size:62.5%;
	min-width: 768px; 
}
body {
	font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
}
/* #bg{
		width:100%;
		height:100%;
		position:absolute;
		z-index:-1;
		}
.content{
    width:100%;
	height:100%;
    margin: 0px;
}	
.div1 {
	margin-left: 950px;
    margin-top: 350px;
}
.div2 {
	margin-left: 950px;
    margin-top: 10px;
}
.div3 {
   margin-left:1000px;
   margin-top:10px;
}
.div4 {
   margin-left:1200px;
   margin-top:-23px;
}
.content form input{
	width:250px;
    height:30px;
} 
.round {
	border-radius:10px;
	background-color: transparent;
}
input::-webkit-input-placeholder{ 
	color: black;
} */
	
.content{
    background-color: #ffff99;
	height:100%;
	background: url(${pageContext.request.contextPath}/static/img/login.jpg) no-repeat 4px 5px;
	background-size:100% 100%;
}
/* .content img{
	width:100%;
	height:100%;
} */
.div1 {
	position:absolute;
	left: 75%;
    top: 80%;
}
.div2 {
	position:absolute;
	left: 75%;
    top: 85%;
}
.div3 {
	position:absolute;
  	left: 78%;
    top: 90%;
}
.div4 {
   position:absolute;
   left:87%;
   top: 90%;
}
.round {
	width:80%;
	border-radius:10%/20%;
	background-color: transparent;
}
input::-webkit-input-placeholder{ 
	color: black;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script>
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
		<%-- <img id="bg" src="${pageContext.request.contextPath}/static/img/login.jpg" />
		<!-- 音乐播放 --> 
		<EMBED src="${pageContext.request.contextPath}/static/music/fengZhengWu.mp3" 
		 loop="true" autostart="true"  hidden="true"></EMBED>
		<div class="content" >	
			<h3>欢迎进入登录页面</h3>
		
			<form id="loginForm" name="loginForm" method="post">
			<div class="div1">
					账号 : <input type="text"  name="userName"  placeholder="请输入账号" class="round"/>  
			</div>
			<div class="div2">
					密码 : <input type="password"  name="password"  placeholder="请输入密码" class="round"/>  
			</div>
			<div class="div3">
					<button type="button" onclick="loginCheck();" >登录</button>
			</div>		
			<div class="div4">
					<button type="button" onclick="registerCheck();">注册</button>
			</div>
			</form>
		</div> --%>
		
		<div class="content" >	
				<%-- <img id="bg" src="${pageContext.request.contextPath}/static/img/login.jpg" /> --%>
				<!-- 音乐播放 --> 
				<EMBED src="${pageContext.request.contextPath}/static/music/fengZhengWu.mp3" 
				 loop="true" autostart="true"  hidden="true"></EMBED>
				 
				 <form id="loginForm" name="loginForm" method="post">
				 	<div class="div1">
				 		账号 : <input type="text"  name="userName"  placeholder="请输入账号" class="round"/>  
				 	</div>
				 	<div class="div2">
				 		密码 : <input type="password"  name="password"  placeholder="请输入密码" class="round"/>  
				 	</div>
				 	<div class="div3">
				 		<button type="button" onclick="loginCheck();" >登录</button>
				 	</div>
				 	<div class="div4">
				 		<button type="button" onclick="registerCheck();">注册</button>
				 	</div>
				 </form>
		</div>
</body>
</html>