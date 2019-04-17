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
	min-width: 768px; 
}
body {
	padding: 0;
    margin: 0;
    font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
}
.gwc_top {
	height:30px;
	background: #e3e4e5;
}
.gwc_logo {
	width: 20.8%;
	height: 120px;
	margin-left: 13%;
	margin-top: 15px;
	margin-bottom: 22px;
	
}
.gwc_login{
	border: 1px solid #edd28b;
	background: #fffdee;
	padding: 10px 2%;
    line-height: 25px;
    margin-bottom: 20px;
    color: #f70;
    margin-left: 13%;
     width: 71.8%; 
     /* display: none; */
}
.gwc_title{
	margin-top: 10px;
	color: red;
	margin-left: 13%;
	width: 75.93%; 
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
    width: 75.8%; 
    float: left;
}
.column_checkbox {
	height: 18px;
    line-height: 18px;
    padding-top: 7px;
    width: 12.4%;
    padding-left: 1.1%;
    float: left;
    white-space: nowrap;
    overflow:hidden;
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
	float: left;
}
.cart_props{
	height: 32px;
    padding: 0 1% 0 2%;
    float: left;
    width: 14.152%;
}
.cart_price{
	width: 16.174%;
    text-align: right;
    float: left;
}
.cart_quantity{
	width: 10.8%;
    text-align: center;
    float: left;
    line-height: 32px;
}
.cart_sum{
	width: 10.4%;
    padding-right: 4.1%;
    text-align: right;
    float: left;
    line-height: 32px;
}
.cart_action{
	width: 7.5%;
	float: left;
	white-space: nowrap;
}
.gwc_cast {
	display: block;
    height: 52px;
    line-height: 32px;
    background: #f3f3f3;
    border: 1px solid #e9e9e9;
    border-top: 0;
    margin-left: 13%;
    margin-top:10px;
    width: 75.8%; 
    float: left;
}
.select_all {
    float: left;
    height: 18px;
    width: 4.5%;
    line-height: 18px;
    padding: 16px 0 16px 0.9%;
    white-space: nowrap;
}
.operation {
	float: left;
    height: 50px;
    width: 31.4%;
    line-height: 50px;
    white-space: nowrap;
    overflow: hidden;
}
.operation a{
	float: left;
    margin-left: 3.24%;
    color: #666;
}
.comm_right {
	float: right;
    width: 60%;
    height: 52px;
}
.btn-area {
	float: right;
	width: 15.6%;
	height: 52px;
	white-space: nowrap;
}
.btn-area a{
	display: block;
    position: relative;
    line-height: 52px;
    color: #fff;
    text-align: center;
    font-size: 1.8rem;
    font-family: "Microsoft YaHei";
    background: #e54346;
    overflow: hidden;
}
a {
    text-decoration: none;
}
.price_sum {
	float: right;
    height: 43px;
    width:13% !important;
    line-height: 20px;
    margin: 7px 3% 0 2%;
    color: #666;
    position: relative;
    white-space: nowrap;
    overflow: hidden;
}
.total {
	 height: 20px;
	 margin-top: 10px;
	 margin-right:4%; 
	 display:block;
	 float: left;
	 
}
.sum_price {
    float: left;
    margin-top: 10px;
    font-size: 1.6rem;
    color: #E2231A;
    font-weight: 700;
}

.gwc_show {
	margin-left: 13%;
	background: #fff4e8;
	padding: 0 0 1px 0;
	line-height: 20px;
	min-height: 118px; 
	width: 76%;  
	margin-top: 10px;
	float: left;
	font-size: 2rem;
	text-align: center;
}

.gwc_show span {
	font-size: 2rem;
	text-align: center;
	line-height:3.5em;
}
.goods{
	width: 30%;
	height:82px;
	float: left;
	padding: 15px 0 10px 0;
	margin-right:15%; 
}
.goods_img {
	float: left;
    width: 34%;
    height: 80px;
    border: 1px solid #eee;
    margin-right: 3.5%;
    margin-bottom:10px;
    background: #fff;
    padding: 0;
    text-align: center;
    overflow: hidden;
}
.goods_name {
	width:60%;
	height: 40px;
    line-height: 20px;
    overflow: hidden;
   	float: left; 
   	font-size: 1.5rem;
}
.goods_price {
	width: 16%;
    font-family: verdana;
    text-align: right;
    float: left;
    padding: 15px 0 10px;
    overflow: hidden;
    line-height: 20px;
}
.quantity {
	width: 8.2%;
	float: left;
    padding: 15px 0 10px 1.3rem;
    height:18px;
}
.number {
    border: 0.1rem solid #cacbcb;
    width: 52.5%;
    height: 18px;
    line-height: 18px;
    text-align: center;
    overflow: hidden;
    font-size: 1.2rem;
    font-family: verdana;
    color: #333;
    float: left;
    display:block; 
}
.add_sub {
	color: #e9e9e9;
	float: left;
	border: 0.1rem solid #cacbcb;
    border-right: 0;
    border-left:0;
    height: 18px;
    line-height: 18px;
    padding: 1px 0;
    width: 20%;
    text-align: center;
    background: #fff;
    overflow: hidden;
    white-space:nowrap; 
    display:block; 
}
.subtotal {
	width: 12%;
    text-align: right;
    font-family: verdana;
    float: left;
    padding: 15px 0 10px;
    line-height: 20px;
}
.del {
	width: 7%;
    position: relative;
    float: left;
    padding: 15px 0 10px;
    line-height: 20px;
    text-align:right;
    min-height: 20px;
    font-size: 1.5rem;
    text-overflow: ellipsis;
	white-space:nowrap; 
   
}
.top_small {
	margin-left: 13%;
	height: 30px;
	width: 75.9%;
}
.kefu {
	float: right;
    padding: 0 8px;
    line-height: 30px;
}
.dingdan {
	float: right;
    padding: 0 8px;
    line-height: 30px;
}
.denglu_zhuce {
	float: right;
    padding: 0 8px;
    line-height: 30px;
}
.spacer {
	width: 1px;
    height: 12px;
    margin-top: 9px;
    padding: 0;
    background: #ccc;
    overflow: hidden;
    float: right;
}
.gwc_logo img{
	width: 100%;
	height: 120px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
</head>
<body>
		<div class="gwc_top">
			<div class="top_small">
				<div class="kefu">
					<a href="">客服服务</a>
				</div>
				<div class="spacer" ></div>
				<div class="dingdan">
					<a href="">我的订单</a>
				</div>
				<div class="spacer" ></div>
				<div class="denglu_zhuce">
					<a href="">你好，请登录</a>
					<a href="">免费注册</a>
				</div>
			</div>
		</div>
		<div class="gwc_logo">
			<img alt="" src="/lzt03/static/img/lizhentao_logo.jpg" >
		</div>
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
			<div class="cart_quantity">数量</div>
			<div class="cart_sum">小计</div>
			<div class="cart_action">操作</div>
		</div>
		<!-- <div class="gwc_show">
			<span>购物车空空如也！买点东西吧</span>
		</div> -->
		<div class="gwc_show">
			<div class="select_all">
				<div class="cart_checkbox">
					<input type="checkbox" id="toggle-checkboxes_up" name="toggle-checkboxes" class="jdcheckbox" checked="checked">
				</div>
			</div>
			<div class="goods">
				<div class="goods_img">
					<a href=""></a>
				</div>
				<div class="goods_name">商品测试名称商品测试名称商品测试名称商品测试名称商品测试名称</div>
				<div class="goods_props"></div>
			</div>
			<div class="goods_price">¥7000.00</div>
			<div class="quantity" id="clearfix">
				<a href="" class="add_sub">-</a>
				<input class="number"  value="55"/>
				<a href="" class="add_sub">+</a>
			</div>
			<div class="subtotal">129.00</div>
			<div class="del">
				<a href="" class="">删除</a>
			</div>
		</div>
		
		<div class="gwc_cast">
			<div class="select_all">
				<div class="cart_checkbox">
					<input type="checkbox" id="toggle-checkboxes_up" name="toggle-checkboxes" class="jdcheckbox" checked="checked">
				</div>
				全选
			</div>
			<div class="operation">
				<a href="">删除选中的商品</a>
				<a href="">清理购物车</a>
			</div>
			<div class="comm_right">
				<div class="btn-area">
					<a href="">去结算</a>
				</div>
				<div class="price_sum">
					<span class="total">总价:</span>
					<span class="sum_price">¥0.00</span>
				</div>
			</div>
			
		</div>
	
</body>
</html>