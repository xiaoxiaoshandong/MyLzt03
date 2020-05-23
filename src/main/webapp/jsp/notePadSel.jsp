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
		$('#dg').datagrid({
			url:"${pageContext.request.contextPath}/notepad/notePadSel",
			iconCls : "icon-search",
			width : 1180,
			height : 480,
			pagination:true, //显示分页
			pageSize: 10,
			pageList: [10,20,30],//可以设置每页记录条数的列表
			columns :[[{
				field : 'npId',  
                title : 'ID',  
                align:'center',
                hidden : true 
			},{
				 field : 'npTitle',  
				 title : "记事本题目",  
				 width : 150,  
				 align:'center', 
				 sortable : true,
			},{
				 field : 'npContent',  
				 title : "记事本内容",  
				 width : 350,  
				 align:'center', 
				 sortable : true
			},{
				 field : 'createTime',  
				 title : "创建时间",  
				 width : 100,  
				 align:'center', 
				 sortable : true
			},{
				 field : 'updateTime',  
				 title : "更新时间",  
				 width : 100,  
				 align:'center', 
				 sortable : true
			}
			
			]]
		});
	});
	
</script>
</head>
<body class="easyui-layout">

	<div data-options="region:'center'" style="padding:5px;background:#eee;">
		 <table id="dg"  class="easyui-datagrid" toolbar="#toolbar" rownumbers="true" fitColumns="true"
			singleSelect="true">
			<thead>
				<tr>
					<th field="npTitle" width="100">记事本题目</th>
					<th field="npContent" width="100">记事本内容</th>
					<th field="createTime" width="100">创建时间</th>
					<th field="updateTime" width="100">更新时间</th>
				</tr>
			</thead>
		</table>
	</div> 
	
</body>
</html>