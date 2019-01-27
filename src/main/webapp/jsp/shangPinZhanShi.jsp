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
	/* margin-top: -20px;  */
	top:-20px;
}
.div_spml{
	width: 1200px;
	height: 30px;
	margin-left:70px;
	background: #FFDEAD	;
}
.div_all{
	width: 1350px;
	height: 1350px;
}
.div_left{
	width: 300px;
	height: 700px;
	margin-left:70px;
	margin-top:50px;
	background: red;
	float: left;
} 
.div_top{
	width:860px;
	height: 40px;
	margin-top:50px;
	margin-left: 410px;
	line-height:21px;/* 改变DIV内字的位置 */
	background: #e4e4e4;
}
.div_top div{
	margin-left: 10px;
}
.div_test{
	width:1200px;
	line-height:30px;
	background: #FFD700;
	margin-top:10px;
	margin-left: 70px
}
.div_test_1{
	width:100px;
	/* height: 30px; */
	background: #FFB6C1;
	float: left;
	line-height:30px;/* 改变DIV内字的位置 */
	/* margin-top:10px;
	margin-left: 70px */
}
.div_test_2{
	position: relative;
	width:1000px;
	line-height:30px;
	background: #FFA07A;
	float: left;
	/* margin-top:10px;
	margin-left: 70px */
}

</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function (){
		var url = location.search;
		var erjiId = url.substr(8);
		$.ajax({
			type:"get",
			url:"/lzt03/spu/selectProd",
			data: {"erjiId":erjiId},
			dataType:"json",
			success : function(result) {
				var sx = result.sv;
				for(var i = 0; i < sx.length; i++){
					var s= sx[i];
					
				}
			}
		});
	});
</script>
</head>
	
	<div class="div_all">
		<div class="div_spml">div_spml</div>
		<div class="div_test">
			<div class="div_test_1">属性名称</div>
			<div class="div_test_2">
				<ul>
					<li><a href="">属性值1</a></li>
					<li><a href="">属性值2</a></li>
					<li><a href="">属性值3</a></li>
				</ul>
			</div>
		</div>
		<div class="div_test">div2</div>
		<div class="div_test">div3</div>
		
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
		<div class="div_centre">div_centre</div>
		<div class="div_down">div_down</div>
	</div>
<body>
</body>
</html>