<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单个商品展示页面</title>
<style>
.ops_nav {
	background:#ffff00;
	height: 44px;
	width: 1210px; 
}
.ops_content {
	background:#00ff99;
	width: 1210px;
	height: 975px;
	margin-top: 10px;
}
.ops_preview_wrap {
	position: relative;
	background:#ffcc33;
	border: 1px solid #eee;
	width: 452px; 
	height: 626px;
	padding-bottom: 15px;
	float:left;
}
.ops_preview {
	position: relative;
	background:red;
	width: 450px; 
	height: 450px;
	margin-bottom: 20px;
	border: 1px solid #eee;
}
.ops_imglist {
	position: relative;
	background:#00ff33;
	width: 452px;
	height: 58px; 
	margin-bottom: 18px;
}
.ops_info_wrap {
	width: 738px;
	height: 975px; 
	background:#003300;
	float:right;
}
.ops_sku_name {
	background:#ffcccc;
	width: 738px;
	line-height: 28px;
	padding-top: 10px;
	margin-bottom: 5px;
}
.ops_jiage {
	background:#ff9900;
	width: 738px;
	height: 30px;
}
.ops_weight {
	background:#ff9999;
	width: 738px;
	height: 20px;
}
.ops_other {
	background:#ff3300;
	width: 738px;
	height: 384px;
	margin-top: 15px;
	margin-bottom: 3px;
}
.ops_btn {
	background:#ccffcc;
	width: 718px;
	height: 46px;
	padding: 0 10px;
	margin-top: 10px;
    margin-bottom: 20px;
}
/* .w {
	width: 1210px;
} */
</style>
</head>
<body>
		<div class="ops_nav">ops_nav</div>
		<div class="ops_content">
			<div class="ops_preview_wrap">
				<div class="ops_preview">ops_preview</div>
				<div class="ops_imglist">ops_imglist</div>
			</div>
			
			<div class="ops_info_wrap">
				<div class="ops_sku_name">ops_sku_name</div>
				<div class="ops_jiage">ops_jiage</div>
				<div class="ops_weight">ops_weight</div>
				<div class="ops_other">ops_other</div>
				<div class="ops_btn">ops_btn</div>
			</div>
		</div>
</body>
</html>