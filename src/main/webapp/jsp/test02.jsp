<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 引入样式 -->
    <script src="${pageContext.request.contextPath}/static/common/jquery-1.7.2.js"></script>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="${pageContext.request.contextPath}/static/element-ui/index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element-ui/index.css">
    <script src="${pageContext.request.contextPath}/static/echarts/4.7.0/echarts.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/my_style/myStyle.css">
    <script type="text/javascript">

    </script>
</head>
<body>
<div id="app">
    <el-row :gutter="20">
        <el-col :gutter="24">
            <div class="bg-purple">
                <div class="el-icon-s-grid grid-content my-ztleft  bg-purple" >数据列表</div>
            </div>
        </el-col>
    </el-row>
    <el-row :gutter="20">
        <el-col :span="5">
            <div class="bg-purple">
                <el-row :gutter="20">
                    <el-col :span="10"> 猪圈名称</el-col>
                    <el-col :span="14">
                        <el-input v-model="input" placeholder="请输入内容"></el-input>
                    </el-col>
                </el-row>
            </div>
        </el-col>
        <el-col :span="8">猪舍管理人</el-col>
        <el-col :span="8">猪圈类型</el-col>
    </el-row>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        methods: {

        },
        data() {
            return {
                input: ''
            }
        }
    });
</script>
</html>