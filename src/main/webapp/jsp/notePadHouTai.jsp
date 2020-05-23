<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<style>
	
</style>
<script type="text/javascript">
		
		function notePadAdd() {
			var content = '<iframe src="${pageContext.request.contextPath}/jsp/notePadAdd.jsp" height="100%"  width="100%" '
					+ ' frameborder="1"  scrolling="0" ></iframe>';
			//添加一个新的选项卡
			$("#mytabs").tabs('add', {
				title : '记事本添加',
				content : content,
				closable : true
			});
		};
		
		function notePadSel() {
			var content = '<iframe src="${pageContext.request.contextPath}/jsp/notePadSel.jsp" height="100%"  width="100%" '
					+ ' frameborder="1"  scrolling="0" ></iframe>';
			//查询记事本内容
			$("#mytabs").tabs('add', {
				title : '记事本查询内容',
				content : content,
				closable : true
			});
		};
		
		
</script>
</head>
<body class="easyui-layout">
		<div data-options="region:'west',title:'West',split:true"
			style="width: 150px;">
			<ul id="tt" class="easyui-tree">
				<li>
					<span>系统管理</span>
					<ul >
						<li>
							<span>记事本管理</span>
							<ul>
								<li><a onclick="notePadAdd();">添加记事本</a></li>
							</ul>
						</li>
						<li><a onclick="notePadSel();">记事本查询</a></li>
					</ul>
				</li>
			</ul>
	
		</div>
		<div data-options="region:'center',title:'center title'"
			style="padding: 5px; background: #eee;">
			<div id="mytabs" class="easyui-tabs" data-options="fit:true"></div>
		</div>
</body>
</html>