<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据脚本</title>
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
.box{
	width:auto;
}
.top {
	margin-top: 0.5%;
	margin-left:2%;
	width: 95.5%;
	height: 9%;
	background-color: #ffff00;
	text-align:center; 
}
.span {
	display: inline-block;
    height: 100%;
    vertical-align: middle; 
}
.left {
	margin-top: 0.5%;
	margin-left: 2%;
	width:10%;
	height:79%;
	background-color: #ffcc00;
	float:left;
	text-align:center; 
}
.centre {
	margin-top: 0.5%;
	margin-left: 0.5%;
	width:74.5%;
	height:79%;
	background-color: #ff9900;
	float:left;
}
.ctn_up {
	margin-top: 0.5%;
	margin-left: 0.5%;
	width:99%;
	height:57%;
	background-color: #ffffcc;
	
}
.ctn_up li {
	list-style-type: none;/* 去掉小黑点 */
	margin-top: 1%;
}
.ctn_up01 {
	padding-top: 1%;
	margin-left: 0.5%;
	background-color: #ffcc99;
	width:99%;
	height:75%;
}
.ctn_up02 {
	padding-top: 1%;
	margin-left: 0.5%;
	background-color: #ff9999;
	width:99%;
	height:15%;
}
.ctn_down {
	margin-top: 0.5%;
	margin-left: 0.5%;
	width:99%;
	height:40%;
	background-color: #ffffcc;
}
.right {
	margin-top: 0.5%;
	margin-left: 0.5%;
	width:10%;
	height:79%;
	background-color: #ffcc00;
	float:left;
	text-align:center; 
}
.down{
	margin-top: 0.5%;
	margin-left:2%;
	width: 95.5%;
	height:9%;
	background-color: #ff9900;
	float:left;
	text-align:center; 
}
td {
	align:left;
	valign:middle;
}
select{
	width: 100%;
	height:100%;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/vue/vue.js" charset="utf-8"></script>
</head>
<body>
	<div class="box">
		<div class ="top"><a>广告位招租</a><span class="span"></span></div>
		<div class ="left"><a>广告位招租</a><span class="span"></span></div>
		<div class ="centre">
			<div class="ctn_up">
				<div class="ctn_up01">
					<form id="jbform"  action="/dataScript/createData" method="post">
						<table>
							<tr>
								<td>选择表</td>
								<td>
									<select  name="tableName"  id="sjcl_id"></select>
								</td>
							</tr>
							<tr>
								<td>数据个数：</td>
								<td><input type="text" name="dataCont"/></td>
							</tr>
							<tr>
								<td>数据处理类型：</td>
								<td>
									<select name="dataType">
										<option value="0" >原有数据添加数据</option>
										<option value="1">重新添加数据</option>
									</select>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="ctn_up02">
					<button onclick="zx();">执行</button>
					<button>清空数据</button>
					<button>数据用时</button>
					<button>数据个数</button>
				
				</div>
			</div>
			<div class="ctn_down" id="show_id"></div>
		</div>
		<div class ="right"><a>广告位招租</a><span class="span"></span></div>
		<div class ="down"><a>广告位招租</a><span class="span"></span></div>
	</div>
	
	<script>
		$(function(){
			var h = $(window).height();
			$(".box").css("height",h);
		/* 	alert(h); */
		
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/dataScript/getTableNames",
				dataType:"json",
				success : function(data) { 
						if(data==0){
							alert("查询表失败！");
						}else{
							for (var i = 0; i < data.length; i++) {
								var c = "<option value="+data[i].tableName+" >" + data[i].tableName
										+ "</option>";
								$("#sjcl_id").append(c);
							}
						}
				}
			});
		});
			
		function zx(){
			$('#show_id').empty();
			var params  = $('#jbform').serialize();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/dataScript/createData",
				dataType:"json",
				data: params,
				   success: function (data) {
					   if(data.errorMsg=="没有此视图"){
						   var c = data.errorMsg;
							$("#show_id").append(c);
						}else{
							var c = data.dataTime;
							$("#show_id").append(c);
							
						}
				   }
			});
		};
</script>
</body>
</html>