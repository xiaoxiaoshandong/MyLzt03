<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
	width: 70px;
	height: 50px;
	margin-left: 40px;
	margin-top: 10px;
	float: left;
}

.div4 {
	width: 70px;
	height: 50px;
	margin-left: 50px;
	margin-top: 10px;
	float: left;
}

.div5 {
	width: 120px;
	height: 20px;
	margin-left: 50px;
	margin-top: -140px;
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
<script type="text/javascript">
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
						if (i == 0) {
							var d = "<option >请选择</option>";
							var c = "<option value="+v[i].id+" >" + v[i].flmch2
									+ "</option>";
							$("#select3").append(d).append(c);
						} else {
							var c = "<option value="+v[i].id+" >" + v[i].flmch2
									+ "</option>";
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
		var key = $("#select3 option:selected").val();
		var val = $("#select3 option:selected").text();
		document.getElementById('show').innerHTML = val;
		
		$('#dg').datagrid({
			url:"/lzt03/shuxing/select?erjiId="+key+"",
			iconCls : "icon-search",
			width : 850,
			height : 520,
			pagination:true, //显示分页
			pageSize: 10,
			pageList: [10,20,30],//可以设置每页记录条数的列表
			columns :[[{
				field : 'shuxingId',  
                title : 'ID',  
                align:'center',
                hidden : true 
			},{
				 field : 'shuxingName',  
				 title : "属性名称",  
				 width : 100,  
				 align:'center', 
				 sortable : true,
			},{
				 field : 'erjiId',  
				 title : "二级ID",  
				 width : 100,  
				 align:'center', 
				 sortable : true,
				 hidden : true 
			}
			
			]]
		});
	};

	function tianJiaShuXing() {
		var key = $("#select3 option:selected").val();
		var val = $("#select3 option:selected").text();
		/*  子页面需要用父页面的对象 用top.jQuery*/
		var jq = top.jQuery;
		var content = '<iframe src="/lzt03/jsp/shuXingAdd.jsp?key=' + key
				+ '&val=' + encodeURI(val) + '" height="100%"  width="100%" '
				+ ' frameborder="1"  scrolling="0" ></iframe>';
		jq("#mytabs").tabs('add', {
			title : '添加属性',
			content : content,
			closable : true
		});
	};
	function xiuGaiShuXing() {
		var key = $("#select3 option:selected").val();
		var val = $("#select3 option:selected").text();
		/*  子页面需要用父页面的对象 用top.jQuery*/
		var jq = top.jQuery;
		var content = '<iframe src="/lzt03/jsp/shuXingUpdate.jsp?key=' + key
				+ '&val=' + encodeURI(val) + '" height="100%"  width="100%" '
				+ ' frameborder="1"  scrolling="0" ></iframe>';
		jq("#mytabs").tabs('add', {
			title : '修改属性',
			content : content,
			closable : true
		});

	};
</script>
</head>
<body class="easyui-layout">
	 <div data-options="region:'west',split:true" style="width:300px;">
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
		<div class="div5">
			添加<span id="show" style="color: red"></span>属性
		</div>
		<div class="div3">
			<button onclick="tianJiaShuXing();">添加属性</button>
		</div>

		<div class="div4">
			<button onclick="xiuGaiShuXing();">修改属性</button>
		</div>
	</div>

	<div data-options="region:'center'" style="padding:5px;background:#eee;">
		 <table id="dg"  class="easyui-datagrid" toolbar="#toolbar" rownumbers="true" fitColumns="true"
			singleSelect="true">
			<thead>
				<tr>
					<th field="shuxingId" width="50">属性ID</th>
					<th field="shuxingName" width="50">属性名称</th>
					<th field="erjiId" width="50">二级ID</th>
				</tr>
			</thead>
		</table>
		<!-- <div id="toolbar">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
				onclick="newUser()">New User</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-edit" plain="true"
				onclick="editUser()">Edit User</a> <a href="#"
				class="easyui-linkbutton" iconCls="icon-remove" plain="true"
				onclick="destroyUser()">Remove User</a>
		</div> -->
	</div> 
	
	    <!-- <div data-options="region:'west',title:'West',split:true" style="width:300px;"></div>
	    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div> -->
</body>
</html>