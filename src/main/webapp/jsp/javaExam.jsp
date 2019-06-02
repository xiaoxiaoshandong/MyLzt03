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
</head>
<body>
	<div class="container-fluid">
		<form id="examSub" method="post" > 
			<div class="row" style="margin-top: 20px">
				<div class="col-md-12">
					<p class="text-center">
						<font size="5" face="微软雅黑" class="text-center">java软件工程师笔试题</font>
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
						<h4>姓名：XXX</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h4>一：选择题 (选择题 3分*10 注释：单选&多选 固定每题3分)</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h5>1：第一个问题？</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="checkbox">
						<label><input type="checkbox" value="">A:答案1</label>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" value="">B:答案2</label>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" value="">C:答案3</label>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" value="">D:答案4</label>
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-md-12">
					<h4>二: 问答题 (8分*5 固定每题8分)</h4>
				</div>
			</div>
	
			<div class="row">
				<div class="col-md-12">
					<h5>1：第一个问答问题？</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<textarea class="form-control" id="deblock_udid" name="deblock_udid"
						rows="3" style="min-width: 90%"></textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<h4>三: 大题 (数据库题，编程题，逻辑题等拔高题 共30分)</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h5>1：第一个大题问题？</h5>
				</div>
			</div>
		</form>
	</div>

</body>
</html>