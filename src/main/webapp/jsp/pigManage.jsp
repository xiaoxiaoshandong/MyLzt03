<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/23
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script
            src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"
            charset="utf-8"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
    <script type="text/javascript">
        function pigZhuSheManage() {
            var content = '<iframe src="${pageContext.request.contextPath}/jsp/pigZhuSheManage.jsp" height="100%"  width="100%" '
                + ' frameborder="1"  scrolling="0" ></iframe>';
            //添加一个新的选项卡
            $("#mytabs").tabs('add', {
                title : '猪舍管理',
                content : content,
                closable : true
            });
        };

        function pigZhuLanManage() {
            var content = '<iframe src="${pageContext.request.contextPath}/jsp/pigZhuLanManage.jsp" height="100%"  width="100%" '
                + ' frameborder="1"  scrolling="0" ></iframe>';
            //添加一个新的选项卡
            $("#mytabs").tabs('add', {
                title : '猪栏管理',
                content : content,
                closable : true
            });
        };

        function pigTouRuManage() {
            var content = '<iframe src="${pageContext.request.contextPath}/jsp/pigTouRuManage.jsp" height="100%"  width="100%" '
                + ' frameborder="1"  scrolling="0" ></iframe>';
            //添加一个新的选项卡
            $("#mytabs").tabs('add', {
                title : '投入管理',
                content : content,
                closable : true
            });
        };

        function pigSelShow() {
            var content = '<iframe src="${pageContext.request.contextPath}/jsp/pigSelShow.jsp" height="100%"  width="100%" '
                + ' frameborder="1"  scrolling="0" ></iframe>';
            //添加一个新的选项卡
            $("#mytabs").tabs('add', {
                title : '查询展示',
                content : content,
                closable : true
            });
        };

        function pigKeShiHuaShow(){
            window.location = "pigKeShiHuaShow.jsp";
        }

    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'west',title:'West',split:true"
     style="width: 150px;">
    <ul id="tt" class="easyui-tree">
        <li>
            <span>肥猪满圈管理项目</span>
            <ul>
                <li>
                    <span>后台管理</span>
                    <ul>
                        <li><a onclick="pigZhuSheManage();">猪舍管理</a></li>
                        <li><a onclick="pigZhuLanManage();">猪栏管理</a></li>
                        <li><a onclick="pigTouRuManage();">投入管理</a></li>
                    </ul>
                </li>
                <li><a onclick="pigSelShow();">查询展示</a></li>
                <li><a onclick="pigKeShiHuaShow();">可视化展示</a></li>
            </ul>
        </li>
    </ul>

</div>
<div data-options="region:'center',title:'center title'"
     style="padding: 5px; background: #eee;">
    <div id="mytabs" class="easyui-tabs" data-options="fit:true"></div>
</div>
</body>
</html>
