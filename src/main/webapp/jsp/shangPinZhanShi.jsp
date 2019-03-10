<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示</title>
<style>
ul{
	list-style: none;
}
li{
	list-style-type: none;/* 去掉小黑点 */
}
.div_spml{
	width: 1200px;
	height: 30px;
	margin-left:70px;
	background: #FFDEAD	;
	
}
.div_spml li{
	position: relative; 
	margin-left:30px;
	float: left;
	 margin-top: 4px;  
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
.div_top{
	position: relative;
	width:970px;
	height: 40px;
	margin-top:50px;
	margin-left: 300px;
	background: #e4e4e4;
}

.div_top a{
	position: relative;
	width: 70px;
	height: 21px; 
	top:8px;
	float: left; /* 使a标签 宽度和高度生效并浮动 */
	border:1px #26bbdb solid;/* 边框 */
	font-size: 14px;/* 设置字体大小 */
	text-align:center;	
}
.jg_tp {
	position: absolute;
	left:213px;
	top:10px; 
	background-image: url(/lzt03/static/img/shang.jpg);
	width: 10px;
	height: 20px;
	 display: block;
	background-repeat: no-repeat; 
	background-size: 7px 18px; /*定义图片的尺寸*/
}
.div_top div{
	/* position: relative; */
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
.div_test_2 li{
	position: relative; 
	margin-left:30px;
	float: left;
	margin-top: -12px;  
}
.div_centre {
	width: 970px;
	height: 950px;
	background: #FFA07A;
	float: left;
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
}
.div_page a{
	float: left;
    height: 36px;
    line-height: 36px;
    padding: 0 14px;
    margin-right: 5px;
    font-size: 14px;/*设置字体的尺寸。*/
    background-color: #f7f7f7;
    
   	border: 1px solid #ddd; 
}
.div_page a:link{ /*正常，未访问过的链接*/
	color: red;
	}
.div_page a:visited{/*用户已访问过的链接*/
    border: none;
} 
.div_page a:hover{ /*当用户鼠标放在链接上时*/
    box-shadow: 0 1px 1px red;/*添加阴影*/
}
.div_page a:active{ /*链接被点击的那一刻*/
	color:#99dd6b;
}
a {
	text-decoration: none; /*去掉下划线*/
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
.div_left{
	position:relative;
	width: 210px;
	height: 990px;
	margin-left:70px;
	margin-top:50px;
	background: red;
	float: left;
} 
.div_left .mt {
	line-height: 36px;
    padding-left: 10px;
    margin-bottom: 10px;
    background-color: #CCC;
}
.div_left .mt h3{
    font-size: 14px;
    margin: 0px;
}
.div_left span {
	position: absolute;
    right: 10px;
    top: 10px;
    width: 40px;
    height: 20px;
   	font-size:9px;/*设置 字体大小*/
}
.div_left ul{
	width: 210px;
	height: 945px;
	background-color: #f7f7f7;
	padding: 0px;
	margin: 0px;
}
.div_left li{
	width: 210px;
	height: 228px;
	background-color: red;
	padding: 0px;
	margin: 10px 0px 0px 0px;
}
.div_left .left_sp{
	width: 210px;
	height: 228px;
	background: #FFB6C1;
	float: left;
}
.div_left .left_sp_01{
	width: 190px;
	height: 158px;
	background: yellow;
	margin: 0px 10px 0px 10px;
}
.div_left .left_sp_02{
	width: 190px;
	height: 20px;
	background: #dd7e6b;
	margin: 0px 10px 0px 10px;
}
.div_left .left_sp_03{
	width: 190px;
	height: 45px;
	background: #9b6e65;
	margin: 0px 10px 0px 10px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box; /* 本属性+下两个属性功能：文本超出容易两行 文本超出部分省略号代替 */
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
.div_left .left_sp_01 .left_sp_01_img{
	width: 190px;
	height: 158px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		jq_all();
	});
	function jq_all(){
		var  shuxingSIds = getIds();
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
		document.getElementById('div_spml_span').value = erjiId;
		document.getElementById('div_spml_span').innerHTML = name;
		// 存储数据到cookie
		 var c  = encodeURI(name);
		setCookie("erjiName",c,1);
		// 获取查询排序条件
		var orderBy = $("#ob_id").val();
		// 获取排序规则
		var sc = $("#sc_id").val();
		$.ajax({
			type:"get",
			url:"/lzt03/spu/selectProd",
			data: {"erjiId":erjiId,"m":0,"n":12,"orderBy":orderBy,"sc":sc,"shuxingSIds":shuxingSIds},
			dataType:"json",
			success : function(result) {
				/*总页数*/
				var total  = result.total;
				/*商品总个数*/
				var count  = result.count;
				/*属性信息*/
				var sx = result.sv;
				/*商品信息1*/
				var prod = result.prodVos;
				/*属性信息2*/
				var prod1 = result.prodVos1;
				
				document.getElementById("total_page").innerText = total;
				document.getElementById("total_sp").innerText = count;
				/* var d =""; */
				var d = fy_show(total,null); 
				/*属性遍历*/
				for(var i = 0; i < sx.length; i++){
					var s= sx[i];
					var ss=	s.shuxingS;
					var c = '<div class="div_test" id="sx_div_'+i+'">'
						 +'<div class="div_test_1" id="'+s.shuxingId+'" >'+s.shuxingName+'</div>'
						 +'<div class="div_test_2">'
						 +'<ul>'
						 for(var j =0; j<ss.length; j++){
								 var e = ss[j];
								 var d = '<li class="MyLi"><a href="javascript:;" id="a'+e.shuxingSId+'" onClick="hidenDiv(this);">'+e.shuxingSVal+'</a></li>';
								 c+=d;
						 }
						 +'</ul>'
						 +'</div>'
						 +'</div>';
						 
						 $("#div_spml").after(c);
				}
				/*商品遍历*/
				for(var i = 0; i < prod.length; i++){
					var p = prod[i];
					var pic  =p.myPicture[0].tupianName;
					var jg = p.jiage;
					var name = p.chanpinName+" "+p.skuName;
					var skuId = p.skuId;
					/* var name="ceshi"; */
					
					var c ='<div>'
								+'<div><a href="http://localhost:8080/lzt03/spu/selectProdBySkuId?skuId='+skuId+'"><img src= "'+pic+'" /></a></div>'
								+'<div>¥'+jg+'</div>'
								+'<div><a href="http://localhost:8080/lzt03/spu/selectProdBySkuId?skuId='+skuId+'">'+name+'</a></div>'
								+'<div>'
										+'<i class="icon-user"></i>'
										+'<input type="button" value="添加购物车" onClick="location.href='+"#"+'"/>'
								+'</div>'
							+'</div>';
					$("#div_centre").append(c);
				}
				/*左侧商品遍历*/
				for(var i=0;i<prod1.length; i++){
					var p = prod1[i];
					var pic  =p.myPicture[0].tupianName;
					var jg = p.jiage;
					var name = p.chanpinName+" "+p.skuName;
					var skuId = p.skuId;
					var c ='<li>'
								+'<div class="left_sp">'
									+'<div class="left_sp_01">'
										+'<a  href="http://localhost:8080/lzt03/spu/selectProdBySkuId?skuId='+skuId+'"><img class="left_sp_01_img" src="'+pic+'"></a>'
									+'</div>'
									+'<div class="left_sp_02">¥'+jg+'</div>'
									+'<div class="left_sp_03"><a class="left_sp_03_name" href="http://localhost:8080/lzt03/spu/selectProdBySkuId?skuId='+skuId+'">'+name+'</a></div>'
								+'</div>'
							+'</li>';
			$("#div_left_ul").append(c);
				}
			}
		});
	};
	
	/*商品条件查询*/
	function fy_xz(data){
		var  shuxingSIds = getIds();
		var val  = null;
		// 二级商品ID
		var erjiId = document.getElementById('div_spml_span').value;
		// 总页数
		var total = document.getElementById('total_page').innerText;
		//获取 当前页数 
		if( $.isEmptyObject(data) ){
			val =1;
		}else{
			val  = data.text;
		}
		
		/* if(val==null){
			val=1;
		} */
		// 获取 上一次点击的页数
		var lastVal = parseInt(document.getElementById('input-txt').value);
		//判断是否为数字
		var isNum = isNumber(lastVal);
		if(isNum==false){
			alert("请输入数字！");
			return;
		}
		if(val=="<上一页"){
			/* alert("lastVal:"+lastVal+"  total:"+total+" val:"+val); */
			if(lastVal>1 && lastVal<=total){
				val = parseInt(lastVal)-1;
			}else {
				return;
			}
		}else if(val=="下一页>"){
			if(lastVal<total && lastVal>=1){
				val = parseInt(lastVal)+1;
			}else{
				return;
			}
		}else if(val=="确定"){
			if(lastVal<=total && lastVal>=1){
				val = parseInt(lastVal);
			}else{
				alert("输入查询页数有误！");
				return ;
			}
		}
		// 当前页赋值 
		document.getElementById('input-txt').value=val;
		var m = (val-1)*12;
		//分页功能 
		fy_show(total,val);
		
		// 获取查询排序条件
		/* var orderBy = parseInt($("#ob_id").val()); */
		var orderBy = $("#ob_id").val();
		// 获取排序规则
		/* var sc = parseInt($("#sc_id").val()); */
		var sc = $("#sc_id").val();
		$.ajax({
			type:"get",
			data: {"erjiId":erjiId,"m":m,"n":12,"orderBy":orderBy,"sc":sc,"shuxingSIds":shuxingSIds},
			url:"/lzt03/spu/selectProd",
			dataType:"json",
			success : function(result) {
				var prod = result.prodVos;
				/*商品展示区 初始化*/
				$("#div_centre").empty();
				for(var i = 0; i < prod.length; i++){
					var p = prod[i];
					var pic  =p.myPicture[0].tupianName;
					var jg = p.jiage;
					var name = p.chanpinName+" "+p.skuName;
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
	};
	
	/*分页功能*/
	function fy_show(total,sel_page){
		/*
			total <=5         按顺序展示
			total >5 时  
				        sel_page=null 时  	按顺序展示
						sel_page=1时 		 start:0   end:5
				        sel_page=2时 		 start:0   end:5
				        sel_page=total  时   start:total-4  end:total
				        sel_page=total-1 时 start:total-4  end:total
				        sel_page（其他）时  	 start:sel_page-2    end: sel_pag+2

		*/
		document.getElementById('fenYe_one').innerHTML='';
		var d='<a href="javascript:;" onclick="fy_xz(this);"><i><</i><em>上一页</em></a>';
		var  start=0;
		var  end=0;
		if(total<=5){
			for(var i=0;i<total;i++){
				var j = i+1;
				var c=  '<a href="javascript:void(0);"  onclick="fy_xz(this);">'+j+'</a>';
				d = d+c;
			}
		}else{
			if(sel_page==1 || sel_page==2 || sel_page==null){
				start=1;
				end=5;
			}else if(sel_page==total || sel_page==total-1){
				start=parseInt(total)-4;
				end=parseInt(total);
			}else{
				start=parseInt(sel_page)-2;   
				end=parseInt(sel_page)+2;
			}
			for(var i=start;i<=end;i++){
				var c=  '<a href="javascript:void(0);"  onclick="fy_xz(this);">'+i+'</a>';
				d = d+c;
			}
		}
		d=d+'<a href="javascript:;" onclick="fy_xz(this);"><em>下一页</em><i>></i></a>';
		$("#fenYe_one").append(d);
	}; 
	
	//判断是否为数字
	function isNumber(value) {
    var patrn = /^(-)?\d+(\.\d+)?$/;
    if (patrn.exec(value) == null || value == "") {
        return false
    } else {
        return true
    }
}
	function add_paixu(data){
		
		var val = data.text;
		/* alert("val:"+val); */
		if(val=="综合排序"){
			$("#ob_id").value=0;
		}
		if(val=="销量"){
			$("#ob_id").value=1;
		}else if(val== "价格"){
			$("#ob_id").val(2);
			var scId = $("#sc_id").val();
			if(scId=="0"){
				document.getElementById('sc_id').value='1';
				document.getElementById('jg_id').setAttribute('style','background-image:url(/lzt03/static/img/xia.jpg)');
			}else{
				document.getElementById('sc_id').value='0';
				document.getElementById('jg_id').setAttribute('style','background-image:url(/lzt03/static/img/shang.jpg)');
			}
		}else if(val== "评论数"){
			$("#ob_id").value=3;
		}else if(val== "上架时间"){
			$("#ob_id").value=4;
		}
		fy_xz();
	};
	//隐藏属性值 和 div_spml中添加属性值
	function hidenDiv(data){
		var my_id = data.id;
		var c = $("#"+my_id).parents(".div_test").attr("id");// parents():获取所有祖先元素 。
		// 隐藏 被选中的DIV 
		document.getElementById(c).setAttribute('style','display:none;');  
		var id = my_id.substring(1);
		var c ='<li><a href="javascript:;" id="'+id+'" onClick="showDiv(this);">'+data.text+'</a></li>';;
		$("#ul_id").append(c);
		 fy_xz();
	};
	
	// 展示属性 & div_spml中删除属性
	function showDiv(data){
		var my_id = data.id;
		var c = $("#a"+my_id).parents(".div_test").attr("id");// parents():获取所有祖先元素 。
		// 还原 被选中的DIV 
		document.getElementById(c).setAttribute('style','');  
		// 删除 点击的a标签
		$("#"+my_id).parent().remove();
		fy_xz();
		
	};
	
	// 遍历 div_spml中所有的属性值 得到多个ID 组成字符串
	function getIds(){
		var str="";
		var len = $("#ul_id").children().size();
		if(len>0){
			for(var i=0; i<len;i++){
				var id = $("#ul_id").children().eq(i).children("a:first-child").attr("id");
				if(i==0){
					str=id;
				}else{
					str=str+","+id;
				}
			}
		}
		return str;
	}
	
	function setCookie(name, value, day)
	{	
		var expires = day * 24 * 60 * 60 * 1000;
		  var exp = new Date();
		  exp.setTime(exp.getTime() + expires);
		  document.cookie = name + "=" + value + ";expires=" + exp.toUTCString();
	}
</script>
</head>
	
	<div class="div_all">
		<div class="div_spml" id="div_spml">
			<div>
				<input type="hidden" id="div_spml_erjiId"/>
				<span id="div_spml_span" ></span>
			</div>
			<div>
				<span>
					共<span id="total_sp"></span>个商品
				</span>
			</div>
			<div>
				<ul id="ul_id"></ul>
			</div>
		</div>
		<div class="div_left">
				<span>广告</span>
				<div class="mt">
					<h3>商品精选</h3>
				</div>
				<ul id="div_left_ul"></ul>
		</div>
		<div class="div_top" >
			<div>
				<a href="">综合排序</a> 
				<a href="">销量</a>
				<a href="javascript:;" onclick="add_paixu(this);" id="jg_px">价格</a> 
				<a href="">评论数</a>
				<a href="">上架时间</a>
				<i class="jg_tp" id="jg_id"></i>
				<input type="hidden" id="ob_id" value="0"/>
				<input type="hidden" id="sc_id"  value="0" />
			</div>
			
		</div>
		<div class="div_centre" id="div_centre"></div>
		
		<div class="div_page">
			<span id="fenYe_one"></span>
			<span class="p-skip">
				<em>共<b id="total_page"></b>页&nbsp;&nbsp;到第</em>
				<input id="input-txt" class="input-txt"  value="1"/>
				<em>页</em>
				<a class="btn" href="javascript:;" onclick="fy_xz(this);">确定</a>
			</span>
		</div>
	</div>
<body>
</body>
</html>