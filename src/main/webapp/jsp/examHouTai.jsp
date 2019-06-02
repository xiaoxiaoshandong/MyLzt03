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
		function examAdd() {
			
			var content = '<iframe src="/lzt03/jsp/fenLei.jsp" height="100%"  width="100%" '
					+ ' frameborder="1"  scrolling="0" ></iframe>';
			//添加一个新的选项卡
			$("#mytabs").tabs('add', {
				title : '试卷后台加题',
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
							<span>试卷添加管理</span>
							<ul>
								<li><a onclick="xzQuestAdd();">选择题添加</a></li>
								<li><a onclick="wdQuestAdd();">问答题添加</a></li>
								<li><a onclick="dQuestAdd();">大题添加</a></li>
							</ul>
						</li>
						<li><a onclick="examSel();">试卷查询管理</a></li>
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