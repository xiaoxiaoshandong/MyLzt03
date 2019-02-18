<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div{
	width:100%;
	height:100%;
	margin:0 auto;
}
.div1{
	width:200px;
	height:50px;
	margin-left:40px;
	margin-top:50px;
}
.div2{
	width:200px;
	height:50px;
   	margin-left:40px;
	margin-top:10px;
}
.div3{
	/* width:200px;
	height:100px; */
	margin-left:500px;
	margin-top:10px;
}
.divInput1{
	width:250px;
	height:25px;
}
.btn{
	width:90px;
	height:30px;
}
.sel1{
	width:190px;
	height:30px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">
		$(function(){
			   var str=location.href; //取得整个地址栏
			   var num=str.indexOf("?")
			   str=str.substr(num+1); //取得所有参数   
			   var key = str.match(/key=(\S*)&/)[1];
			   var val = decodeURI(str.match(/val=(\S*)/)[1]);
			   /* document.getElementById('erjiId').value = key; 
			   document.getElementById('val').innerHTML = val;  */
			   $.ajax({
				   type:"POST",
					url:"/lzt03/shuxing/select",
					data:{"erjiId":key},
					dataType:'json',
					success : function(data) {
						for(var i=0;i<data.length;i++){
							var c ="<option value="+data[i].shuxingId+" >"+data[i].shuxingName+"</option>";
							$("#sel1").append(c);
						}
					},
			   		error : function(data){
		           	 	alert("查询属性发生错误！");
		            }
			   });
		});
		function selectNam(){
			var id = $("#sel1 option:selected").val();
			 var value = $("#sel1 option:selected").text();
			document.getElementById('sxid').value = id;
			document.getElementById('sxm').value = value; 
			$("#sel2").empty();
			if(id!="请选择"){
				$.ajax({
					type:"POST",
					url:"/lzt03/shuxings/select",
					data:{"shuxingId":id},
					dataType:'json',
					success : function(data) {
						for(var i=0;i<data.length;i++){
							var c ="<option value="+data[i].shuxingSId+" >"+data[i].shuxingSVal+"</option>";
							$("#sel2").append(c);
						}
					}
				});
			}else{
				$("#sel2").append('<option >请选择</option>');
			}
		};
		
		function selectVal(){
			var sxsid= $("#sel2 option:selected").val();
			var value = $("#sel2 option:selected").text();
			document.getElementById('sxsid').value = sxsid;
			document.getElementById('sxz').value = value; 
		};
		function sxmxg(){
			var params = $("#xgsxm").serialize();
			$.ajax({
				type:"POST",
				url:"/lzt03/shuxing/update",
				data:params,
				dataType:'json',
				success : function(data) {
					if(data==2){
						alert("请输入参数");
					}else if(data==0){
						alert("修改属性名失败");
					}else{
						alert("修改属性名成功");
					}
				}
			});
		};
		function sxzxg(){
			var params = $("#xgsxz").serialize();
			$.ajax({
				type:"POST",
				url:"/lzt03/shuxings/update",
				data:params,
				dataType:'json',
				success : function(data) {
					if(data==2){
						alert("请输入参数");
					}else if(data==0){
						alert("修改属性值失败");
					}else{
						alert("修改属性值成功");
					}
				}
			});
		};
</script>
</head>
<body>
		<div class="div">
			<div class="div1">
				<span>属性名</span>
				<select id="sel1" onchange="selectNam();" class="sel1">
					<option selected >请选择</option>
				</select>
			</div>
			<div  class="div2">
				<span>属性值</span>
				<select id="sel2" onchange="selectVal();"  class="sel1" >
					<option selected>请选择</option>
				</select>
			</div>
			<div class="div3">
				<form id="xgsxm">
					<input type="hidden" id="sxid" name="shuxingId" ></input>
					<table>
						<tr>
							<td><span>属性名</span></td>
							<td><input class="divInput1" id="sxm" name="shuxingName" ></input></td>
							<td><button class="btn" onclick="sxmxg();">属性名修改</button></td>
						</tr>
					</table>
				</form>
				<form id="xgsxz">
					<input type="hidden" id="sxsid" name="shuxingSId" ></input>
					<table>
						<tr>
							<td><span>属性值</span></td>
							<td><input class="divInput1" id="sxz" name="shuxingSVal"></input></td>
							<td><button class="btn" onclick="sxzxg();">属性值修改</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
</body>
</html>