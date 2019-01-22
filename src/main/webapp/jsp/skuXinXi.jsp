<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.div1 {
	width: 200px;
	height: 50px;
	margin-left: 40px;
	margin-top: 20px;
}

.div2 {
	width: 200px;
	height: 200px;
	margin-left: 40px;
	margin-top: 5px;
}
.div3 {
	width: 200px;
	height: 50px;
	margin-left: 40px;
	margin-top: 5px;
}
.div4{
	margin-left: 40px;
	margin-top: 5px;
}
#tab tr{
	width: 200px;
	height: 50px;
	margin-left: 40px;
	margin-top: 10px;
}
.sel1 {
	width: 190px;
	height: 30px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script>
	$(function() {
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/data/class_1.txt",
			datatype : "json",
			success : function(data) {
				var v = JSON.parse(data);
				for (var i = 0; i < data.length; i++) {
					var c = "<option value="+v[i].id+" >" + v[i].flmch1
							+ "</option>";
					$("#select1").append(c);
				}
			}
		});
	});

	function select2() {
		
		var op = $("#select1 option:selected").val();
		$("#select3").empty();
		if (op != "请选择") {
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/data/class_2_" + op
						+ ".txt",
				datatype : "json",
				success : function(data) {
					var v = JSON.parse(data);
					for (var i = 0; i < data.length; i++) {
						if(i==0){
							var d = '<option >请选择</option>';
							var e = "<option value="+v[i].id+" >" + v[i].flmch2 + "</option>";
							$("#select3").append(d).append(e);
						}else{
							var c = "<option value="+v[i].id+" >" + v[i].flmch2 + "</option>";
							$("#select3").append(c);
						}

					}
				}
			});
		} else {
			$("#select3").append('<option >请选择</option>');
		}
	};

	function select4() {
		var op = $("#select3 option:selected").val();
		var val =$("#select3 option:selected").text();
		document.getElementById('show').innerHTML = val;
		$.ajax({
			type : "post",
			url : "/lzt03/spu/select",
			data: {"erjiId":op},
			datatype : "json",
			success : function(data) {
				var spu = data.spuList;
				var shuxing = data.shuxingList;
				for (var i = 0; i < spu.length; i++) {
					var c = "<option value="+spu[i].spuId+" >" + spu[i].chanpinName
							+ "</option>";
					$("#select5").append(c);
				}
				
				for(var i =0;i<shuxing.length; i++){
					var c = '<td><input id="'+i+'" type="checkbox" name="shuxingId" onclick="sxzSelect(this);" '
					+'value="'+shuxing[i].shuxingId+'">'+shuxing[i].shuxingName+'</input></td>';
					$("#sxTab tr").append(c);
					
				}
			}
		});
	};
	
	function sxzSelect(data){
		var c  = data.value;
		var id = data.id;
		// 判断 复选框是否被选中  选中：去查询数据 未选中：隐藏数据
		var b = $('#'+id+'').is(':checked');
		if(b){
			$("#ulId li:eq(0)").append("<li id='li"+id+"'></li>");
			$.ajax({
				type : "post",
				url : "/lzt03/shuxings/select",
				data: {"shuxingId":c},
				datatype : "json",
				success : function(data) {
					var v = JSON.parse(data);
					for(var i =0;i<v.length; i++){
						var c = '<input type="checkbox" name="shuxingSId"  '
						+'value="'+v[i].shuxingSId+'">'+v[i].shuxingSVal+'</input>';
						$("#li"+id+"").append(c);
					}
				}
			});
		}else{
			$("#li"+id+"").remove();
		}
	}
	
	function tiJiaoSku(){
		var param = $("#skuForm").serialize();
		$.ajax({
			type:"post",
			url : "/lzt03/sku/insert",
			data:param,
			datatype : "json",
			success : function(data) {
				if(data==0){
					alert("添加sku库存信息失败!");
				}else{
					alert("添加sku库存信息成功！");
				}
			}
		});
	};
	
	function select6(){
		var op = $("#select5 option:selected").val();
		document.getElementById('hid').value = op;
	};
</script>
</head>
<body class="easyui-layout">

	<div data-options="region:'west',split:true" style="width: 300px;">
		<div class="div1">
			<span>一级分类</span> <select id="select1" onchange="select2();"
				class="sel1">
				<option selected>请选择</option>
			</select>
		</div>

		<div class="div2">
			<span>二级分类</span> <select id="select3" onchange="select4();"
				class="sel1">
				<option selected>请选择</option>
			</select>
		</div>
		
		<div class="div3">
			<span>商品名称</span> <select id="select5" onchange="select6();"
				class="sel1">
				<option selected>请选择</option>
			</select>
		</div>
	</div>
	
	<div data-options="region:'center'" style="padding: 5px;">
					<div class="div4">
						<span>属性名称:</span>
						<form id="sxForm">
							<table id="sxTab">
								<tr></tr>
							</table>
						</form>
						
					</div>
					
					<div class="div4">
						<form id="skuForm">
								<ul id="ulId">
									<li><span>属性值组:</span></li>
									<li><span id="show" style="color: red"></span><span>类产品sku发布:</span></li>
									<li><span> sku名称:</span></li>
									<li><input name="skuName"></input></li>
									<li><span>产品库存:</span></li>
									<li><input name="kucun"></input><span>件</span></li>
									<li><span>产品价格:</span></li>
									<li><input name="jiage"></input><span>元</span></li>
									<li><button onclick="tiJiaoSku();">提交该商品sku</button></li>
									<li><input type="hidden" id="hid" name="spuId"></input></li>
								</ul>
						</form>
					</div>
	</div>
</html>