<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Insert title here</title>
<style>
html,body{
	height: 100%;
	font-size:62.5%;
	
}
body {
	padding: 0;
    margin: 0;
    font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
}
.gwc_top {
	height:30px;
	background-color: red;
}
.gwc_logo {
	width: 20.8%;
	height: 50px;
	background-color: #ffff33;
	margin-left: 13%;
	margin-top: 15px;
	margin-bottom: 22px;
	
}
.gwc_login{
	border: 1px solid #edd28b;
	background: #fffdee;
	padding: 10px 20px;
    line-height: 25px;
    margin-bottom: 20px;
    color: #f70;
    margin-left: 13%;
     width: 71%; 
     /* display: none; */
}
.gwc_title{
	margin-top: 10px;
	color: red;
	margin-left: 13%;
	background-color: #ccff66;
	width: 74.2%; 
	font-size:2rem;
	margin-bottom: 10px;
}
.gwc_head{
	display: block;
    height: 32px;
    line-height: 32px;
    margin: 0 0 10px;
    padding: 5px 0;
    background: #f3f3f3;
    border: 1px solid #e9e9e9;
    border-top: 0;
    margin-left: 13%;
    width: 74.05%; 
    float: left;
}
.gwc_show{}
.gwc_cast{}
em {
	font-style: normal;
}
.column_checkbox {
	height: 18px;
    line-height: 18px;
    padding-top: 7px;
    width: 122px;
    padding-left: 11px;
    float: left;
}
.cart_checkbox {
	position: relative;
    z-index: 3;
    float: left;
    margin-right: 0.5%;
    line-height: 18px;
}
.cart_prod {
	line-height: 32px;
	width: 20%;
	background-color: #cccc99;
	float: left;
}
.cart_props{
	height: 32px;
    padding: 0 1% 0 2%;
    float: left;
    width: 14.152%;
    background-color: #cc9999;
}
.cart_price{
	width: 16.174%;
    text-align: right;
    background-color: #99ffcc;
    float: left;
}
.cart_quantity{}
.cart_sum{}
.cart_action{}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
</head>
<body>
		<div class="gwc_top">gwc_top</div>
		<div class="gwc_logo">gwc_logo</div>
		<div class="gwc_login">
			您还没有登录！登录后购物车的商品将保存到您账号中
			<a class="" href="#none" >立即登录</a>
		</div>
		<div class="gwc_title">
			<em>全部商品</em>
		</div>
		<div class="gwc_head">
			<div class="column_checkbox">
				<div class="cart_checkbox">
					<input type="checkbox" id="toggle-checkboxes_up" name="toggle-checkboxes" class="jdcheckbox" checked="checked">
				</div>
				全选
			</div>
			<div class="cart_prod">商品</div>
			<div class="cart_props"></div>
			<div class="cart_price">单价</div>
			<!-- <div class="cart_quantity">数量</div>
			<div class="cart_sum">小计</div>
			<div class="cart_action">操作</div> -->
		</div>
		<div class="gwc_show">gwc_show</div>
		<div class="gwc_cast">gwc_cast</div>
	
</body>
</html>