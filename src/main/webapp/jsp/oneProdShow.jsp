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
.ops_preview img {
	width: 450px; 
	height: 450px;
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
	font: 700 16px Arial,"microsoft yahei";
}
.ops_jiage {
	background:#ff9900;
	width: 738px;
	height: 30px;
}
.ops_jiage .jgn {
	float: left;
    color: #999;
    padding: 5px 0px 0px 10px;
}
.ops_jiage .jgv {
	color: #E4393C;
    font-family: "microsoft yahei";
    margin-right: 10px;
}
.jgv .jgv_1 {
	font-size: 18px
}
.jgv .jgv_2 {
	font-size: 22px
}
.ops_weight {
	background:#ff9999;
	width: 738px;
	height: 20px;
	margin-bottom: 3px;
}
.ops_weight .weight_1 {
	float: left;
    padding-left: 10px;
    color: #999;
}
.ops_weight .weight_2 {
	margin-left: 70px;
}
.ops_other {
	background:#ff3300;
	width: 738px;
	height: 384px;
	margin-top: 15px;
	margin-bottom: 3px;
}
.ops_other .other_col{
	float: left;
    padding-left: 10px;
    font-family: simsun;
    color: #999;
    height: 200px;
}

.other_col_v {
	float: left;
    color: #666;
    margin-right: 7px;
    margin-bottom: 4px;
    width: 240px;
    height: 44px;
    background-color: red;
    border: 1px solid #e3393c;
    text-align:center; 
   
}
.other_col_v span{
	font-size: 18px;
	display:block;/*此元素将显示为块级元素*/
	padding-top: 10px;
}
.ops_btn {
	background:#ccffcc;
	width: 718px;
	height: 46px;
	padding: 0 10px;
	margin-top: 10px;
    margin-bottom: 20px;
}
.btn_choose {
	position: relative;
	width: 60px;
    height: 44px;
    border: 1px solid #ccc;
    float:left;
}
.btn_input {
	display:block;
	width: 43px;
    height: 42px;
    line-height: 42px;
    text-align: center;
    border: 0;
    float: left; 
}
.btn_add {
	display:block;
    width: 15px;
    text-align: center;
    height: 20px;
    line-height: 22px;
    background: #f1f1f1;
    color: #666;
    border: 1px solid #ccc;
    float: right; 
}
.btn_reduce {
	display: block;
    width: 15px;
    text-align: center;
    height: 20px;
    line-height: 22px;
    background: #f1f1f1;
    color: #666;
    border: 1px solid #ccc;
    float: right; 
} 
.btn_cart {
	display: block;
	width: 90px;
    height: 46px;
    background: red;
    float:left;
    padding: 0px 26px;
    margin-left: 10px;
  	text-align: center;
  	font-size: 18px;
  	font-weight: 700;/* 属性设置文本的粗细 */
  	line-height: 46px;
  	color:#f1f1f1;
  	cursor: pointer;/*指针样式*/
  	/* vertical-align: middle; */
}

.ops_nav a{
	float: left;
	padding: 10px;
	
}
a {
	text-decoration: none; /*去掉下划线*/
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">
$(function (){
	var erjiName = getCookie("erjiName");
	alert("erjiName:"+erjiName);
});
/*获取cookie 内的值*/
function getCookie(c_name)
{
if (document.cookie.length>0)
  {
  c_start=document.cookie.indexOf(c_name + "=")
  if (c_start!=-1)
    { 
    c_start=c_start + c_name.length+1 
    c_end=document.cookie.indexOf(";",c_start)
    if (c_end==-1) c_end=document.cookie.length
    return decodeURI(document.cookie.substring(c_start,c_end))
    } 
  }
return ""
}
</script>
</head>
<body>
		<div class="ops_nav">
			<a href="javascript:;" >商品一级分类></a>
			<a href="javascript:;" >商品二级分类></a>
			<a href="javascript:;" >商品spuname></a>
		</div>
		<div class="ops_content">
			<div class="ops_preview_wrap">
				<div class="ops_preview">
					<img alt="" src="">
				</div>
				<div class="ops_imglist">ops_imglist</div>
			</div>
			
			<div class="ops_info_wrap">
				<div class="ops_sku_name">
					联想(Lenovo)拯救者Y7000P英特尔酷睿 i7 15.6英寸高色域游戏笔记本电脑(i7-8750H 8G 512G GTX1060 144Hz)
				</div>
				<div class="ops_jiage">
					<div class="jgn">价格:</div>
					<div class="jgv">
						<span class="jgv_1">￥</span>
						<span class="jgv_2">5999</span>
					</div>
				</div>
				<div class="ops_weight">
					<div class="weight_1">重量:</div>
					<div class="weight_2">4.18kg</div>
				</div>
				<div class="ops_other">
					<div class="other_col">选择颜色</div>
					<div class="other_col_v"><span>颜色1</span></div>
					<div class="other_col_v"><span>颜色2</span></div>
					<div class="other_col_v"><span>颜色3</span></div>
					<div class="other_col_v"><span>颜色4</span></div>
					<div class="other_col_v"><span>颜色5</span></div>
					<div class="other_col_v"><span>颜色6</span></div>
					<div class="other_col_v"><span>颜色7</span></div>
					<div class="other_col_v"><span>颜色8</span></div>
				</div>
				<div class="ops_btn">
					<div class="btn_choose">
						<input class="btn_input" value="1">
						<a href="" class="btn_add">+</a>
						<a href="" class="btn_reduce">-</a>
					</div>
					<a href="" class="btn_cart">加入购物车</a>
				</div>
			</div>
		</div>
</body>
</html>