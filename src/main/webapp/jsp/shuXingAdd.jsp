<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.div{
	width:100%;
	height:100%;
	margin:0 auto;
}
.div table{
	margin-left: 450px;
	margin-top: 10px;
}
.btn1{
	margin-left: 450px;
	margin-top: 1px;
}
.btn2{
	margin-left: 630px;
	margin-top: -23px;
}
.btn3{
	margin-left: 450px;
	margin-top: 40px;
}
.btn4{
	margin-left: 545px;
	margin-top: -23px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">
	function addTab(){
		var length = $('#tab tr').length;
		var t = $("#tab tr:nth-child("+length+")");
		var str ="<tr><td>属性值:<input name='shuxingSVal'></input></td></tr>";
			t.after(str);
	};
	function delTab(){
		/* 获取tab 倒数第二个TR节点 */
		var l = $('#tab tr').length;
		var t = $("#tab tr:last-child");
		if(l>2){
		t.remove();
		}else{
			alert("无法继续再删！");
		}
	};
	function tiJiao(){
		var params = $("#shuXing").serialize(); 
		$.ajax({
			type:"POST",
			url:"/lzt03/shuxing/add",
			data: params,
			dataType:"json",
			success : function(data) {
				if(data==1){
               alert("添加属性成功！");
				}else{
					alert("添加属性失败！");
				}
            },
            error : function(data){
           	 alert("添加属性发生错误！");
            }
		});
	};
	$(function(){
		   var str=location.href; //取得整个地址栏
		   var num=str.indexOf("?")
		   str=str.substr(num+1); //取得所有参数   
		   var key = str.match(/key=(\S*)&/)[1];
		   var val = decodeURI(str.match(/val=(\S*)/)[1]);
		   document.getElementById('erjiId').value = key; 
		   document.getElementById('val').innerHTML = val; 
	});
	
</script>
</head>
<body>
		<div class="div">
			
			<div >
				<div class="btn3">
					<span id="val" style="color: red"></span>:分类属性添加
				</div>
				<form action="" id="shuXing">
					<input name="erjiId" type="hidden" id="erjiId"></input>
					<table border="1" id="tab">
						<tr>
							<td>属性名:<input name="shuxingName"></input></td>
						</tr>
						<tr>
							<td>属性值:<input name="shuxingSVal"></input></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="btn1">
				<button onclick="addTab();">添加值</button>
			</div>
			<div class="btn2">
				<button onclick="delTab();">删除值</button>
			</div>
			<div class="btn4">
				<button onclick="tiJiao();">提交 </button>
			</div>
		</div>
</body>
</html>