<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Bootstrap 101 Template</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<style>
.row {
	/* background-color: red; */
	margin-bottom: 10px;
}
</style>
<script type="text/javascript">
		$(function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/shijuan/prodShiJuan",
				dataType:"json",
				success : function(data) { 
					document.getElementById('javaTitle').innerText="java软件工程师笔试题("+data.num+"期)";
					document.getElementById('xingMing').innerText="姓名:"+data.ksrName+"";
					var xzlist =data.xzList;
					var wdlist =data.wdList;
					var dtlist =data.dtList;
					var xzStr = "";
					var wdStr = "";
					var dtStr = "";
					for(var i=0;i<xzlist.length;i++){
						var xz = xzlist[i];
						var a = i+1;
						var xzStr1 ='<div class="row">'+
										'<div class="col-md-12">'+
									'<h5>'+a+'：'+xz.questContent+'</h5>'+
								'</div>'+
							'</div>'+
							'<div class="row">'+
								'<div class="col-md-12">'+
									'<div class="checkbox">'+
										'<label><input type="checkbox"  name="xz'+xz.questId+'" value="A">A:'+xz.optionA+'</label>'+
									'</div>'+
									'<div class="checkbox">'+
										'<label><input type="checkbox" name="xz'+xz.questId+'" value="B">B:'+xz.optionB+'</label>'+
									'</div>'+
									'<div class="checkbox">'+
										'<label><input type="checkbox" name="xz'+xz.questId+'" value="C">C:'+xz.optionC+'</label>'+
									'</div>'+
									'<div class="checkbox">'+
										'<label><input type="checkbox" name="xz'+xz.questId+'" value="D">D:'+xz.optionD+'</label>'+
									'</div>'+
								'</div>'+
							'</div>';
							xzStr =xzStr+xzStr1;
					}
					$("#row_1").after(xzStr);
					
					var dtStr = "";
					for(var i=0;i<wdlist.length;i++){
						var wd = wdlist[i];
						var a = i+1;
						var wdStr1 = '<div class="row">'+
										'<div class="col-md-12">'+
											'<h5>'+a+'：'+wd.questContent+'</h5>'+
										'</div>'+
									  '</div>'+
									  '<div class="row">'+
										'<div class="col-md-6">'+
											'<textarea class="form-control"  name="wd'+wd.questId+'" rows="3" style="min-width: 90%"></textarea>'+
									    '</div>'+
									  '</div>';
						wdStr =wdStr+wdStr1;
					}
					$("#row_2").after(wdStr);
					
					for(var i=0;i<dtlist.length;i++){
						var dt = dtlist[i];
						var a = i+1;
						var dtStr1 ='<div class="row">'+
										'<div class="col-md-12">'+
											'<h5>'+a+'：'+dt.questContent+'</h5>'+
										'</div>'+
									'</div>'+
									 '<div class="row">'+
										'<div class="col-md-6">'+
											'<textarea class="form-control"  name="dt'+dt.questId+'" rows="3" style="min-width: 90%"></textarea>'+
									    '</div>'+
									  '</div>';
						dtStr =dtStr+dtStr1;
					}
					$("#row_3").after(dtStr);
				}
			});		
		});
		
		 function sjtj(){
			 var params = $("#examSub").serialize(); 
			 alert(params);
			/*  $.ajax({
				type:"post",
				url:"/lzt03/spu/selectProd",
				data: params,
				dataType:"json",
				success : function(data) {
				
			}); */
			
		}
</script>
</head>
<body>
	<div class="container-fluid">
		<form id="examSub" method="post" > 
			<div class="row" style="margin-top: 20px">
				<div class="col-md-12">
					<p class="text-center">
						<font id="javaTitle" size="5" face="微软雅黑" class="text-center"></font>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<P align=right>
						<font size="7" face="微软雅黑" style="color: red; font-style: italic">70分&nbsp&nbsp</font>
					</P>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<h4 id="xingMing"></h4>
					</div>
				</div>
			</div>
			<div class="row" id="row_1">
				<div class="col-md-12">
					<h4>一：选择题 (选择题 3分*10 注释：单选&多选 固定每题3分)</h4>
				</div>
			</div>
			
	
			<div class="row" id="row_2">
				<div class="col-md-12">
					<h4>二: 问答题 (8分*5 固定每题8分)</h4>
				</div>
			</div>
			
			<div class="row" id="row_3">
				<div class="col-md-12">
					<h4>三: 大题 (数据库题，编程题，逻辑题等拔高题 共30分)</h4>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<button type="button" class="btn btn-info active" onclick="sjtj();">提交答案</button> 
				</div>
			</div>
		</form>
	</div>

</body>
</html>