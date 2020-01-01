<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/angularJS/angular.min.js"></script>
<style>
input.ng-invalid {
	background-color: lightblue;
}
</style>
</head>
<body>
	<div ng-app="myApp" ng-controller="personCtrl">
		<select ng-init="selectedName = names[0]" 
			ng-options="x for x in names">
		</select>
	</div>
</body>
<script type="text/javascript">
	var app = angular.module('myApp', []);
	app.controller('personCtrl', function($scope) {
		$scope.names = [ "Google", "Runoob", "Taobao" ];
	});
</script>
</html>
