<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.div1{
	width:1350px;
	height:35px;
	background-color: #d9d9d9;
}
.div2{
	margin-top:10px;
	width:1350px;
	height:100px;
	float: left;
}
.div3{
	width:1350px;
	height:500px;
}
.div4{
	margin-top:10px;
	margin-left:60px;
	width:270px;
	height:400px;
	background-color: red;
	 float: left;
}
.div5{
	margin-top:10px;
	margin-left:10px;
	width:950px;
	height:50px;
	float: left; 
}
.div6{
	margin-top:10px;
	margin-left:-1px;
	width:950px;
	height:340px;
	float: left; 
}

.div6 img{
	width:900px;
	height: 338px;
	margin-left: 20px;
}
.div6 ul{
 	width: 900px;
	height: 340px;
	z-index:2;
	left:338px;
	top:215px;
	position:absolute;
	background-color: #F7F7F7;
	
}
.div1 ul{
    	margin-left:1100px;
    }
.div1 ul a{
 	text-decoration : none; /* 去掉a标签下划线*/
}
.div1 ul li{
        float:left;
        margin-right:8px;
        margin-top:7px;
        list-style-type: none;/* 去掉小黑点 */
    }
.div2 ul{
    	margin-left:50px;
    }
.div2 ul li{
		float:left;
        margin-right:8px;
        margin-top:2px;
        list-style-type: none;/* 去掉小黑点 */
    }
.div2 ul input{
    	margin-left:90px;
		width: 500px;
		height: 35px;
		border: 1.5px solid red;
		font-size: 25px;/*插入光标大小*/
    }
.div2 ul li:nth-child(3) button{
    	margin-left:-8px;
		width: 110px;
		height: 40px;
		border: none;
		background-color: red;
    }
.div2 ul li:nth-child(4) button{
    	margin-left:170px;
		width: 150px;
		height: 40px;
		border: none;
		background-color: #EEEEE0;
    }
.div5 ul{
    	margin-left:1px;
    }
.div5 ul li{
        float:left;
        margin-right:18px;
        margin-top:3px;
        list-style-type: none;/* 去掉小黑点 */
       
    }
.div5 ul a{
 	text-decoration : none; /* 去掉a标签下划线*/
}
.div6 ul li{
		list-style-type: none;/* 去掉小黑点 */
		margin-top: 15px;
		
}
.div4 ul li:first-child {
	width:270px;
	height: 50px;
	margin-top:-15px;
	margin-left: -40px;
	background-color:#f50707;
	text-align:center;
	line-height:50px;
	list-style-type: none;/* 去掉小黑点 */
}
.div4 ul li:not(:first-child){
	width: 270px;
	height: 34px;
	list-style-type: none;/* 去掉小黑点 */
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">
		$(function() {
			$("#erJiUl").css({display:"none"});
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/data/class_1.txt",
				datatype : "json",
				success : function(data) {
					var v = JSON.parse(data);
					for (var i = 0; i < data.length; i++) {
								
						var c = "<li value="+v[i].id+" onmouseover='move(this);' onmouseout='out();'>"+v[i].flmch1
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		 				+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;></li>";
						$("#yiJiFenLeiId").append(c);
					}
				}
			});
		});

		function move(data){
			$("#erJiUl").css({display:""});
			var val = data.value;
			$("#erJiUl").empty();
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/data/class_2_" + val
						+ ".txt",
				datatype : "json",
				success : function(data) {
					var v = JSON.parse(data);
					for (var i = 0; i < data.length; i++) {
						var c = "<li value="+v[i].id+" onmouseout='out(event);' ><a href=''onclick='spcx(this);' >" + v[i].flmch2 + "</li>";
						$("#erJiUl").append(c);
	
					}
				}
			});
			
		};
		 function move1(){
				$("#erJiUl").css({display:""});
			};
		 function out(){
			 $("#erJiUl").css({display:"none"});
		};
		/* function spcx(data){
			var params = data.parentNode.value;
			alert("p:"+p);
			$.ajax({
				type : "post",
				url:"/lzt03/spu/selectProd",
				data: params,
				dataType:"json",
				success : function(data) {
					alert("data:"+data);
				};
			});
		}; */
		
</script>
</head>
<body>
	<div class="div0">
		<div class="div1">
			<ul>
				<li><a  href="">我的订单</a></li>
				<li><a href="">用户注册</a></li>
				<li><a href="">请登录</a></li>
			</ul>
		</div>
		<div class="div2">
			<ul>
				<li><img alt="" src="${pageContext.request.contextPath}/static/img/linggouwang.jpg" width="200" height="70"></li>
				<li><input onmousemove=""></input></li>
				<li><button>搜索</button></li>
				<li><button>购物车</button></li>
			</ul>
		</div>
		<div class="div3">
			<div class="div4" id="div4_id">
				<ul id="yiJiFenLeiId">
					<li><span>全部商品分类</span></li>
				</ul>
				<!-- <span>二级分类</span> <select id="select3" onchange="select4();"
					class="sel1">
					<option selected>请选择</option>
				</select> -->
			</div>
			<div class="div5">
				<ul>
					<li><a  href="">服装城</a></li>
					<li><a  href="">美女裙</a></li>
					<li><a  href="">超市</a></li>
					<li><a  href="">全球购</a></li>
					<li><a  href="">闪购</a></li>
					<li><a  href="">团购</a></li>
					<li><a  href="">拍卖</a></li>
					<li><a  href="">金融</a></li>
					<li><a  href="">智能</a></li>
				</ul>
			</div> 
			<div class="div6" id="div6_id" onmouseover='move1();' onmouseout='out();'>
							<ul id="erJiUl" >
							</ul>
							<img src="${pageContext.request.contextPath}/static/img/shipin.jpg" >
			</div>
		</div>
	</div>
</body>
</html>