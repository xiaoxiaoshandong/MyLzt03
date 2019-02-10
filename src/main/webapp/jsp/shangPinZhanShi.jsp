<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示</title>
<style>
.div_top a{
	width: 70px;
	height: 21px;
	margin-top:10px;
	float: left; /* 使a标签 宽度和高度生效并浮动 */
	border:1px #26bbdb solid;/* 边框 */
	font-size: 12px;/* 设置字体大小 */
	text-align:center;	
	text-decoration : none; /* 去掉a标签下划线*/
}
.div_test_2 a{
	text-decoration : none; /* 去掉a标签下划线*/
	
}
.div_test_2 li{
	position: relative;
	list-style-type: none;/* 去掉小黑点 */
	margin-left:30px;
	float: left;
	margin-top: -12px;  
}
.div_spml{
	width: 1200px;
	height: 30px;
	margin-left:70px;
	background: #FFDEAD	;
	
}
.div_spml div:nth-child(1) span{
	margin-left:10px;
	line-height:30px;
	color: red;
	
}
.div_spml div:nth-child(2) span:first-child{
	margin-left:10px;
	line-height:30px;
	color: #090;
}
.div_spml div:nth-child(2) span:first-child span{
	line-height:30px;
	color: red;
}
.div_spml div:nth-child(1){
	float: left;
}
.div_spml div:nth-child(2){
	float: left;
}
.div_all{
	width: 1350px;
	height: 1350px;
}
.div_left{
	width: 210px;
	height: 990px;
	margin-left:70px;
	margin-top:50px;
	background: red;
	float: left;
} 
.div_top{
	width:970px;
	height: 40px;
	margin-top:50px;
	margin-left: 300px;
	line-height:21px;/* 改变DIV内字的位置 */
	background: #e4e4e4;
}
.div_top div{
	margin-left: 10px;
}
.div_test{
	width:1200px;
	height:30px;
	background: #FFD700;
	margin-top:10px;
	margin-left: 70px
}
.div_test_1{
	width:100px;
	 height: 30px;
	background: #FFB6C1;
	float: left;
	line-height:30px;/* 改变DIV内字的位置 */
}
.div_test_2{
	position: relative;
	width:1000px;
	height: 30px;
	background: #FFA07A;
	float: left;
}
.div_centre {
	width: 970px;
	height: 950px;
	background: #FFA07A;
	float: left;
	/* margin-top:10px; */
	margin-left: 20px
}
.div_centre >div {
	width: 220px;
	height: 300px;
	background: #FFB6C1;
	float: left;
	margin-top:10px;
	margin-left: 14px
}
.div_centre >div :nth-child(1) {
	width: 218px;
	height: 200px;
	background: red;
	margin-top:1px;
	margin-left: 1px
}
.div_centre >div :nth-child(2) {
	width: 218px;
	height: 50px;
	background: red;
	margin-top:5px;
	margin-left: 1px
}
.div_centre >div :nth-child(3) {
	width: 218px;
	height: 35px;
	background: red;
	margin-top:5px;
	margin-left: 1px
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function (){
		var url = decodeURI(location.search);/* decodeURI() 解决URL参数乱码问题 */
		var e=0;
		for(var k=0;k<url.length;k++){
			if(url[k]=="&"){
				e=k-8;
			}
		};
		var erjiId = url.substr(8,e);
		
		var f = url.search("name=");
		var name= url.substr(f+5);
		document.getElementById('div_spml_span').innerHTML = name;
		$.ajax({
			type:"get",
			url:"/lzt03/spu/selectProd",
			data: {"erjiId":erjiId},
			dataType:"json",
			success : function(result) {
				var sx = result.sv;
				for(var i = 0; i < sx.length; i++){
					var s= sx[i];
					var ss=	s.shuxingS;
					var c = '<div class="div_test">'
						 +'<div class="div_test_1">'+s.shuxingName+'</div>'
						 +'<div class="div_test_2">'
						 +'<ul>'
						 for(var j =0; j<ss.length; j++){
								 var e = ss[j];
								 var d = '<li><a href="">'+e.shuxingSVal+'</a></li>';
								 c+=d;
						 }
						 +'</ul>'
						 +'</div>'
						 +'</div>';
						 
						 $("#div_spml").after(c);
				}
			}
		});
	});
</script>
</head>
	
	<div class="div_all">
		<div class="div_spml" id="div_spml">
			<div>
				<span id="div_spml_span"></span>
			</div>
			<div>
				<span>
					共<span>1</span>个商品
				</span>
			</div>
		</div>
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
		<div class="div_centre">
			<div>
				<div>图片div</div>
				<div>商品名称div</div>
				<div>购物车div</div>
			</div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		
		
		
		<div class="div_down">div_down</div>
	</div>
<body>
</body>
</html>