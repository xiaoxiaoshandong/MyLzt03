<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bg1{
		width:100%;
		height:100%;
		position:absolute;
		z-index:-1;
		}
.content{
	width: 100%;
	height: 100%;
	position: absolute;
	/* background-color: #e3f2f2; */
	margin: 0px;
}
.div1{
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
.input1{
	width:300px;
    height:30px;
    border-radius: 10px;
    
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
}

input::-webkit-input-placeholder{ 
	color: black;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script>
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
			<img id="bg1" src="${pageContext.request.contextPath}/static/img/zucebeijing.jpg" /> 
			<form id="registeredForm" method="post" >
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
			</form>
		</div>	
</body>
</html>