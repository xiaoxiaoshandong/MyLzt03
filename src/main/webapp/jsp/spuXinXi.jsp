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
#tab tr{
	width: 200px;
	height: 50px;
	margin-left: 40px;
	margin-top: 10px;
}
.div3 {
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
							document.getElementById('erjiId').value = v[i].id; 
						};
						var c = "<option value="+v[i].id+" >" + v[i].flmch2
								+ "</option>";
						$("#select3").append(c);

					}
				}
			});
		} else {
			$("#select3").append('<option >请选择</option>');
		}
	};

	function select4() {
		var key = $("#select3 option:selected").val();
		document.getElementById('erjiId').value = key; 
	};
	
	function tinaJiaTuPian(data){
		var length = $('#tab tr').length;
		var id = parseInt(data.id);
		if(length-id==3 &&length<7 ){
		
		var d = id+1;
		var t = $("#tab tr").eq(-2); 
		 var str ="<tr><td><input id='"+d+"' type='file' name='file' onchange='tinaJiaTuPian(this);'></input></td></tr>";
			t.after(str);
			var preview = document.getElementById('img1');
			 var file  = document.getElementById(id).files[0];
			  var reader  = new FileReader();

			  reader.onloadend = function () {
			    preview.src = reader.result;
			  };

			  if (file) {
			    reader.readAsDataURL(file);
			  } else {
			    preview.src = "";
			  }
		}
	};
	
	function faBuShangPin(){
		var params = new FormData($("#faBuShangPin")[0]);
		/* var params = $("#faBuShangPin").serialize();  */
		$.ajax({
			type:"POST",
			url:"/lzt03/spu/add",
			data: params,
			async: false, 
			contentType:false, //必须false才会避开jQuery对 formdata 的默认处理 , XMLHttpRequest会对 formdata 进行正确的处理
		    processData: false, //必须false才会自动加上正确的Content-Type 
			success : function(data) {
				if(data==1){
					alert("上传图片成功!");
				}else{
					alert("上传图片失败！");
				}
			}
			
		});
		
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
	</div>
	
	<div data-options="region:'center'" style="padding: 5px;">
		<form id="faBuShangPin" method="post" enctype="multipart/form-data">
			<input name="erjiId" type="hidden" id="erjiId"></input>
			<table id="tab">
				<tr>
					<td><label for="name">发布商品名称:</label> <input class="easyui-validatebox"
						type="text" name="chanpinName" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><span>你还可以上传图片</span><br>
					<input id="0" type="file" name="file"  onchange="tinaJiaTuPian(this);"></input><br>
					
					</td>
				</tr>
				<tr>
					<td><button onclick="faBuShangPin();" >发布该商品</button></td>
				</tr>
			</table>
		</form>
			<img id="img1" src="" height="100px" width="100px"  alt="Image preview...">
			
	</div>
</html>