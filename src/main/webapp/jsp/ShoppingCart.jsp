<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#div{
      width: 400px;
      height: 400px;
      background-color: yellow;
      display: flex;
}
#div div{
      width: 100px;
      height: 100px;
      background-color: blue;
      color: white;
      font-size: 30px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
</head>
<body>
		
		<div id="div">
            <div class="div1">1</div>
            <div class="div2">2</div>
            <div class="div3">3</div>
            <div class="div4">4</div>
        </div>
</body>
</html>