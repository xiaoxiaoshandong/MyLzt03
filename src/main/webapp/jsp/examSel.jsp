<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
	<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
	 	$(".container-fluid").css("display",""); 
		$.ajax({
			type : "post",
			url:"/lzt03/shijuan/selByKsrSjNum",
			datatype : "json",
			success : function(data) {
				for(var i=0;i<data.length;i++){
					var d = data[i];
					var str ='<div class="sj_div">'+
								 '<a href="/lzt03/shijuan/selBysjId?sjId='+d.sjId+'">第'+d.ksrSjNum+'期</a>'+
							  '</div>';
					$("#west").append(str);
				}
				
			}
		});
	});
</script>
<style type="text/css">
.sj_div{
	padding: 5px 20px;
	}
.row {
	margin-bottom: 10px;
}
.col-md1{
	width: 10%;
}
</style>
</head>
<body class="easyui-layout">
	 <div data-options="region:'west',split:true" style="width:150px;" id="west"></div>

	<div data-options="region:'center'" style="padding:5px;background:#eee;" id="center">
		 <div class="container-fluid">
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
						<font size="7" face="微软雅黑" style="color: red; font-style: italic" id="score">${sjv[0].ksrTotal}分</font>
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
					<h4>一:选择题 (选择题 3分*10 注释：单选&多选 固定每题3分)</h4>
				</div>
			</div>
			
			<c:forEach items="${sjv}" begin="0" end="9" var="item" varStatus="status">
				<div class="row" >
					<div class="col-md-12"><h5>${status.index+1}:${item.questContent}</h5></div>
				</div>
				<div class="row" >
					<div class="col-md-12">
						<div class="checkbox">A:${item.optionA}</div>
						<div class="checkbox">B:${item.optionB}</div>
						<div class="checkbox">C:${item.optionC}</div>
						<div class="checkbox">D:${item.optionD}</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2" style="background-color: #00FF99;margin-left: 2%;height:30px;line-height:30px;">
						<h6>正确答案:${item.ansContent}</h6>
					</div>
					<div class="col-md-2" style="background-color:red;margin-left: 1px;height:30px;line-height:30px;">
						<h6>你的答案:${item.ksrContent}</h6>
					</div>
				</div>
			
			</c:forEach>	
			
			<div class="row" id="row_2">
				<div class="col-md-12">
					<h4>二: 问答题 (8分*5 固定每题8分)</h4>
				</div>
			</div>
			
			<c:forEach items="${sjv}" begin="10" end="14" var="item" varStatus="status">
				<div class="row">
					<div class="col-md-12">
						<h5>${status.index-9}:${item.questContent}</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<textarea class="form-control"  name="wdContent" rows="3" style="min-width: 90%" >${item.ksrContent}</textarea>
					</div>
				</div>
			</c:forEach> 
			
			<div class="row" id="row_3">
				<div class="col-md-12">
					<h4>三: 大题 (数据库题，编程题，逻辑题等拔高题 共30分)</h4>
				</div>
			</div>
			
			<c:forEach items="${sjv}" begin="15" end="15" var="item" varStatus="status">
				<div class="row">
					<div class="col-md-12">
						<h5>${status.index-14}:${item.questContent}</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<textarea class="form-control"  name="wdContent" rows="3" style="min-width: 90%" >${item.ksrContent}</textarea>
					</div>
				</div>
			</c:forEach> 
		</div>
	</div> 
	
</body>
</html>