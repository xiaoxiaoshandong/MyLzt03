<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示</title>
<style>
a {
	width: 70px;
	height: 21px;
	margin-top:10px;
	float: left; /* 使a标签 宽度和高度生效并浮动 */
	border:1px #26bbdb solid;/* 边框 */
	font-size: 12px;/* 设置字体大小 */
	text-align:center;	
	text-decoration : none; /* 去掉a标签下划线*/
}
.div_all{
	width: 1350px;
	height: 1350px;
}
.div_left{
	width: 300px;
	height: 700px;
	background: red;
	float: left;
}
.div_top{
	width:950px;
	height: 40px;
	line-height:21px;/* 改变DIV内字的位置 */
	background: #e4e4e4;
	margin-left: 330px;
	
}
.div_top div{
	margin-left: 10px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
	
</script>
</head>
	
	<div class="div_all">
		<div class="div_left"></div>
		<div class="div_top">
			<div>
				<a href="">综合排序</a> 
				<a href="">销量</a>
				<a href="">价格</a> 
				<a href="">评论数</a>
				<a href="">上架时间</a>
			</div>
			
		</div>
		<div class="div_centre"></div>
		<div class="div_down"></div>
	</div>
<body>
</body>
</html>