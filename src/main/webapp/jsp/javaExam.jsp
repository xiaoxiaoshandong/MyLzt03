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
	margin-bottom: 10px;
}
.col-md1{
	width: 10%;
}
</style>
<script type="text/javascript">
		$(function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/shijuan/prodShiJuan",
				dataType:"json",
				success : function(data) { 
					if(data.key==1){
						alert("题库内题目过少，生成试卷失败！");
						return ;
					}
					if(data.key==0){
						alert("用户未登录，生成试卷失败！");
						return ;
					}
					document.getElementById('javaTitle').innerText="java软件工程师笔试题("+data.num+"期)";
					document.getElementById('xingMing').innerText="姓名:"+data.ksrName+"";
					document.getElementById('shiJuanId').value=data.sjId;
					var xzlist =data.xzList;
					var wdlist =data.wdList;
					var dtlist =data.dtList;
					var xzStr = "";
					var wdStr = "";
					var dtStr = "";
					for(var i=0;i<xzlist.length;i++){
						var xz = xzlist[i];
						var a = i+1;
						var xzStr1 ='<div class="row" >'+
										'<div class="col-md-12">'+
											'<h5>'+a+'：'+xz.questContent+'</h5>'+
										'</div>'+
									'</div>'+
									'<div class="row" id="'+xz.questId+'">'+
										'<input type="hidden" name="xzQuestId'+a+'" value="'+xz.questId+'" />'+
										'<div class="col-md-12">'+
											'<div class="checkbox">'+
												'<label><input type="checkbox"  name="xzContent'+a+'" value="A">A:'+xz.optionA+'</label>'+
											'</div>'+
											'<div class="checkbox">'+
												'<label><input type="checkbox" name="xzContent'+a+'" value="B">B:'+xz.optionB+'</label>'+
											'</div>'+
											'<div class="checkbox">'+
												'<label><input type="checkbox" name="xzContent'+a+'" value="C">C:'+xz.optionC+'</label>'+
											'</div>'+
											'<div class="checkbox">'+
												'<label><input type="checkbox" name="xzContent'+a+'" value="D">D:'+xz.optionD+'</label>'+
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
									  '<input type="hidden" name="wdQuestId'+a+'" value="'+wd.questId+'" />'+
										'<div class="col-md-6">'+
											'<textarea class="form-control"  name="wdContent'+a+'" rows="3" style="min-width: 90%"></textarea>'+
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
									 '<input type="hidden" name="dtQuestId'+a+'" value="'+dt.questId+'" />'+
										'<div class="col-md-6">'+
											'<textarea class="form-control"  name="dtContent'+a+'" rows="3" style="min-width: 90%"></textarea>'+
									    '</div>'+
									  '</div>';
						dtStr =dtStr+dtStr1;
					}
					$("#row_3").after(dtStr); 
				}
			});		
		});
		
		 function sjtj(){
			var sjId = document.getElementById('shiJuanId').value;
			var params = $("#examSub").serialize(); 
			params = params +"&"+"sjId="+sjId+"";
			    $.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/ksrdaan/submitDaAn",
				data: params,
				dataType:"json",
				success : function(data) {
					if(data == null){
						alert("已经提交过试卷，请勿再次提交！");
						return;
					}
					document.getElementById('score').innerText = data.score+"分";
					var list= data.list;
					for(var i=0;i<list.length;i++){
						var fvs = list[i];
						var questId = fvs.questId;
						var ksrContent = fvs.ksrContent;
						var ansContent = fvs.ansContent;
						var str ='<div class="row" id=row'+i+'>'+
									'<div class="col-md-1" style="background-color: #00FF99;margin-left: 2%;height:30px;line-height:30px;">'+
										'<h6 id="'+i+'_1"></h6>'+
									'</div>'+
									'<div class="col-md-1" style="background-color:red;margin-left: 1px;height:30px;line-height:30px;">'+
										'<h6 id="'+i+'_2"></h6>'+
									'</div>'+
								  '</div>';
								  if($("#row"+i+"").length==0){
									  $("#"+questId+"").after(str);
										$("#"+i+"_1").text("正确答案:"+ansContent);
										$("#"+i+"_2").text("你的答案:"+ksrContent);
								  }
					
						
					}
				} 
			}); 
			
		}
		  function sxtj(){
			 window.location.reload();
		 }
</script>
</head>
<body>
	<div class="container-fluid">
		<input type="hidden" id="shiJuanId" />
		<form id="examSub" method="post" > 
			<div class="row" style="margin-top: 20px">
				<div class="col-md-12">
					<p class="text-center">
						<font id="javaTitle" size="5" face="微软雅黑" class="text-center"></font>
					</p>
				</div>
			</div>
			<div class="row" >
				<div class="col-md-12">
					<P align=right>
						<font size="7" face="微软雅黑" style="color: red; font-style: italic" id="score"></font>
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
				<div class="col-md-1">
					<button type="button" class="btn btn-info active" onclick="sjtj();">提交答案</button> 
				</div>
				<div class="col-md-1">
					<button type="button" class="btn btn-info active" onclick="sxtj();">刷新题目</button> 
				</div>
			</div>
		</form>
	</div>

</body>
</html>