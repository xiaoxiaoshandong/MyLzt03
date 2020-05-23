<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	function fenlei() {
		var content = '<iframe src="${pageContext.request.contextPath}/jsp/fenLei.jsp" height="100%"  width="100%" '
				+ ' frameborder="1"  scrolling="0" ></iframe>';
		//添加一个新的选项卡
		$("#mytabs").tabs('add', {
			title : '分类属性',
			content : content,
			closable : true
		});
	};
	function spuXinXi() {
		var content = '<iframe src="${pageContext.request.contextPath}/jsp/spuXinXi.jsp" height="100%"  width="100%" ></iframe>';
		//添加一个新的选项卡
		$("#mytabs").tabs('add', {
			title : '商品信息',
			content : content,
			closable : true
		});
	};
	
	function skuXinXi() {
		var content = '<iframe src="${pageContext.request.contextPath}/jsp/skuXinXi.jsp" height="100%"  width="100%" ></iframe>';
		//添加一个新的选项卡
		$("#mytabs").tabs('add', {
			title : '库存信息',
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
			<li><span>系统管理</span>
				<ul>
					<li><a onclick="fenlei();">分类属性管理</a></li>
					<li><a onclick="spuXinXi();">商品信息发布</a></li>
					<li><a onclick="skuXinXi();">库存信息发布</a></li>
				</ul></li>
			<li><span>缓存管理</span></li>
		</ul>

	</div>
	<div data-options="region:'center',title:'center title'"
		style="padding: 5px; background: #eee;">
		<div id="mytabs" class="easyui-tabs" data-options="fit:true"></div>
	</div>

</body>
</html>