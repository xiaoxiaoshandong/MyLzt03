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
	margin-left: 70px;
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
	margin-left: 20px;
}
.div_centre >div {
	width: 220px;
	height: 302px;
	background: #FFB6C1;
	float: left;
	margin-top:10px;
	margin-left: 14px;
}
.div_centre >div :nth-child(1) {
	width: 218px;
	height: 200px;
	background: red;
}
.div_centre >div :nth-child(1) img{
	border:0;
}
.div_centre >div :nth-child(2) {
	width: 218px;
	height: 20px;
	background: red;
	margin-top:2px;
	margin-left: 1px;
}
.div_centre >div :nth-child(3) {
	width: 218px;
	height: 40px;
	background: red;
	margin-top:3px;
	margin-left: 1px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box; /* 本属性+下两个属性功能：文本超出容易两行 文本超出部分省略号代替 */
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
.div_centre >div :nth-child(3) a{
	text-decoration : none; /* 去掉a标签下划线*/
}
.div_centre >div :nth-child(4) {
	width: 218px;
	height: 30px;
	background: red;
	margin-top:2px;
	margin-left: 1px;
	position: relative;
}
.div_centre >div :nth-child(4) input {
	width: 218px;
	height: 30px;
	background: #f6f6f6;
	text-align: right; /*placeholder文字居右*/
	padding-right:20px; /*placeholder文字距右20px*/
	color: red;
	border: none;
	margin:0;
}
.icon-user {
	position: absolute !important;
	display: block !important;
	width: 30px !important;
	height: 25px !important; 
	background : url(${pageContext.request.contextPath}/static/img/gwc_logo.png) !important; /*引入图片图片*/
	background-repeat: no-repeat !important; /*设置图片不重复*/
	background-size: 20px 30px !important; /*图片显示的位置*/
	left: 10px;
	top:1px; 
}
.div_page {
	width:970px;
	height: 38px;
	margin-left: 300px;
	margin-top: 980px;
	background-color: red;
}
.div_page a{
	float: left;
    height: 36px;
    line-height: 36px;
    padding: 0 14px;
    margin-right: 5px;
    font-size: 14px;/*设置字体的尺寸。*/
    background-color: #f7f7f7;
    color: #333;
   	border: 1px solid #ddd; 
	text-decoration : none; /* 去掉a标签下划线*/
}
.div_page a em{
	vertical-align: middle;/*把此元素放置在父元素的中部。*/
	font-style: normal;/*汉字样式*/
	font-size: 14px;/*设置字体的尺寸。*/
}
.div_page .p-skip {
	margin-left: 20px;
	background-color: #f7f7f7;
}
.div_page .p-skip em{
	float: left;
	line-height: 38px;
	font-style: normal;/*汉字样式*/
    font-size: 14px;/*设置字体的尺寸。*/
}
.div_page .p-skip .input-txt{
	float: left;
	width: 30px;
    height: 30px;
    margin: 0 3px;
    line-height: 30px;
    font-size: 14px;
    text-align: center;
    border: 1px solid #CCC;
    padding: 3px;
}
.div_page .p-skip .btn{
	float: left;
    height: 27px;
    margin-left: 10px;
    font-size: 14px;
    line-height: 27px;
    /* display: inline-block; */
    border-radius: 2px;/*定义 圆角边框*/
    background: #F7F7F7;
    text-align: center;
    cursor: pointer;	/*鼠标光标*/
    border: 1px solid #DDD;
    padding: 4px 13px 5px;
    color: #666;
    background-color: #f7f7f7;
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
			data: {"erjiId":erjiId,"m":0,"n":12},
			dataType:"json",
			success : function(result) {
				var count  = result.count;
				alert(count);
				var sx = result.sv;
				var prod = result.prodVos;
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
				
				for(var i = 0; i < prod.length; i++){
					var p = prod[i];
					var pic  =p.myPicture[0].tupianName;
					var jg = p.jiage;
					var name = p.chanpinName+" "+p.skuName;
					/* var name="ceshi"; */
					 /* alert("pic:"+pic+" jg:"+jg+" name:"+name); */
					
					var c ='<div>'
								+'<div><a href=""><img src= "'+pic+'" /></a></div>'
								+'<div>¥'+jg+'</div>'
								+'<div><a href="">'+name+'</a></div>'
								+'<div>'
										+'<i class="icon-user"></i>'
										+'<input type="button" value="添加购物车" onClick="location.href='+"#"+'"/>'
								+'</div>'
							+'</div>';
					$("#div_centre").append(c);
				}
				
			}
		});
	});
</script>
</head>
	
	<div class="div_all">
		<div class="div_spml" id="div_spml">
			<div>
				<span id="div_spml_span" ></span>
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
		<div class="div_centre" id="div_centre">
			<!--  <div>
				<div><a href=""><img src= "http://localhost:8080/lzt03/upload/imgs/20190212/1549936241409_419.jpg" width="220" height="300" /></a></div>
				<div>¥6000</div>
				<div><a href="">联想470系列游戏本A 幻夜黑 移动联通电信4G</a></div>
				<div>
					<i class="icon-user"></i>
					<input type="button" value="添加购物车" onClick="location.href='#'"/>
				</div>
			</div>  -->
		</div>
		
		<div class="div_page">
			<span>
				<a href="">
					<i><</i>
					<em>上一页</em>
				</a>
				<a href="">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">55555</a>
				<a href="">
					<em>下一页</em>
					<i>></i>
				</a>
			</span>
			<span class="p-skip">
				<em>共<b>222</b>页&nbsp;&nbsp;到第</em>
				<input class="input-txt" value="1"/>
				<em>页</em>
				<a class="btn" href="">确定</a>
			</span>
		</div>
	</div>
<body>
</body>
</html>