<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    margin-bottom: 50px;
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
   /*  width:13% !important; */
    line-height: 20px;
    margin: 7px 3% 0 2%;
    color: #666;
    position: relative;
    white-space: nowrap;
    overflow: hidden;
    width:auto;
    min-width: 60px;
}
.total {
	 height: 20px;
	 margin-top: 10px;
	/*  margin-right:4%;  */
	 display:block;
	 float: left;
	 margin-right:5px;
}
.sum_price {
    float: left;
    margin-top: 10px;
    font-size: 1.6rem;
    color: #E2231A;
    font-weight: 700;
    overflow: hidden;
    display: block;
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
.goods_img img{
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
	 $(function(){
		$("#toggle-checkboxes_01").click(function(){
			var a = $("#toggle-checkboxes_01").attr("checked");
			if(a == undefined ){//非全选
				$("input:checkbox").removeAttr("checked");
				window.location.href="${pageContext.request.contextPath}/cart/selCartAll?cbl=-1"; 
			}else{ // 全选
				$("input:checkbox").attr("checked","checked");
				var cbl  = fxkAll();
				window.location.href="${pageContext.request.contextPath}/cart/selCartAll?cbl="+cbl+""; 
			}
		});
		
		$("#toggle-checkboxes_02").click(function(){
			var a = $("#toggle-checkboxes_02").attr("checked");
			if(a == undefined ){
				$("input:checkbox").removeAttr("checked");
				window.location.href="${pageContext.request.contextPath}/cart/selCartAll?cbl=-1"; 
			}else{
				$("input:checkbox").attr("checked","checked");
				var cbl  = fxkAll();
				window.location.href="${pageContext.request.contextPath}/cart/selCartAll?cbl="+cbl+""; 
			}
			
		});
		
 		// 所有复选框
		var list1 = fxkAll();
		var list  = list1.split(',');
		// 被选中的复选框
		var strList = $("#fxkjh").val();
		var arr  = strList.split(',');
		if(strList!=""){
			for(var i=0;i<list.length;i++){
				var a = list[i];
				var b=arr.indexOf(a);
				if(b==-1){
					$("#"+a).removeAttr("checked");
					$("#"+a).parent().parent().parent().css("background-color","white");
					$("#toggle-checkboxes_01").removeAttr("checked");
					$("#toggle-checkboxes_02").removeAttr("checked");
				}else{
					$("#"+a).attr("checked","checked");
				}
			}
		}
	});
	
	function selGwc(data){
		var cbl = checkboxList();  
		window.location.href="${pageContext.request.contextPath}/cart/selCartAll?cbl="+cbl+""; 
	};
	// 被选中复选框 集合的字符串
	function checkboxList(){
		var d ="";
		var childs = $("#assist").children(".gwc_show");
		var c = childs.find(".jdcheckbox");
		for(var i=0;i<childs.length;i++){
			var text = c.get(i);
			var b = text.checked;
			if(b){
				var id = text.id;
				if(i<childs.length-1){
					d = d+id+",";
				}else{
					d = d+id;
				}
			}
		}
		if(d==""){
			d=-1;
		}
		return d;
	};
	// 所有复选框的集合
	function fxkAll(){
		var d ="";
		var childs = $("#assist").children(".gwc_show");
		var c = childs.find(".jdcheckbox");
		for(var i=0;i<childs.length;i++){
			var text = c.get(i);
			var id = text.id;
			if(i<childs.length-1){
				d = d+id+",";
			}else{
				d = d+id;
			}
		}
		return d;
	}
	
	// 判断复选框是否全选
	function checkAllIsOrNo(){
		var childs = $("#assist").children(".gwc_show");
		var c = childs.find(".jdcheckbox");
		for(var i=0;i<childs.length;i++){
			var text = c.get(i);
			var b = text.checked;
			if(!b){
				return false;
			}
		}
		return true; 
	}
	function delNum(data){
		var skuId = data.name;
		var cbl = checkboxList();
		window.location.href="${pageContext.request.contextPath}/cart/updNum?addOrSub=0&num=1&skuId="+skuId+"&checkboxList="+cbl+"";
	};
	
	// 删除选中的商品
	function delSelItem(){
		 var skuId = checkboxList();
		 window.location.href="${pageContext.request.contextPath}/cart/delGwc?cbl=2&skuId="+skuId+""; 
	}
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
		<c:if test="${ynlogin==0 }">
			<div class="gwc_login">
				您还没有登录！登录后购物车的商品将保存到您账号中
				<a href="${pageContext.request.contextPath}/index.jsp" >立即登录</a>
			</div>
		</c:if>
		
		<div class="gwc_title">
			<em>全部商品</em>
		</div>
		<div class="gwc_head">
			<div class="column_checkbox">
				<div class="cart_checkbox">
					<input type="checkbox" id="toggle-checkboxes_01" name="toggle-checkboxes" class="jdcheckbox"  checked="checked" >
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
		<div id="assist">
		<c:forEach items="${pvs}" var="item">
			<div class="gwc_show" >
				<div class="select_all">
					<div class="cart_checkbox">
						<input type="checkbox" id="${item.skuId}" name="toggle-checkboxes" class="jdcheckbox" checked="checked" onclick="selGwc(this);" >
					</div>
				</div>
				<div class="goods">
					<div class="goods_img">
						<a href=""></a>
						<img src="${item.myPicture[0].tupianName}">
					</div>
					<div class="goods_name">${item.chanpinName } ${item.skuName}</div>
					<div class="goods_props"></div>
				</div>
				<div class="goods_price">¥${item.jiage }</div>
				<div class="quantity" id="clearfix">
					<a href="#" name="${item.skuId}" class="add_sub" onclick="delNum(this);">-</a>
					<input class="number"  value="${item.num}"/>
					<a href="${pageContext.request.contextPath}/cart/updNum?addOrSub=1&num=1&skuId=${item.skuId}"  class="add_sub">+</a>
				</div>
				<div class="subtotal">${item.num*item.jiage}</div>
				<div class="del">
					<a href="${pageContext.request.contextPath}/cart/delGwc?skuId=${item.skuId}" class="">删除</a>
				</div>
			</div>
		</c:forEach>	
		</div>	
		
		<div class="gwc_cast">
			<div class="select_all">
				<div class="cart_checkbox">
					<input type="checkbox" id="toggle-checkboxes_02" name="toggle-checkboxes" class="jdcheckbox" checked="checked" >
				</div>
				全选
			</div>
			<div class="operation">
				<a href="#" onclick="delSelItem();">删除选中的商品</a>
				<a href="${pageContext.request.contextPath}/cart/cleanGwc">清理购物车</a>
			</div>
			<div class="comm_right">
				<div class="btn-area">
					<a href="">去结算</a>
				</div>
				<div class="price_sum">
					<span class="total">总价:</span>
					<span class="sum_price" id="sumPrice">¥ ${zongHe }</span>
				</div>
			</div>
		</div>
		<input type="text" id="fxkjh" name="fxkjh"   value="${cbl}" />
</body>
</html>