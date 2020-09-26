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

    <%--<!-- 引入样式 -->--%>
    <%--<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
    <%--<!-- 引入组件库 -->--%>
    <%--<script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/my_style/myStyle.css">
    <style>

    </style>
    <script type="text/javascript">
        function pigZhuNumAdd(){
            window.location.href="pigZhuNumAdd.jsp";
        };

        function pigZhuNumUpdate(){
            window.location.href="pigZhuNumUpdate.jsp";
        };
    </script>


</head>
<body>
<div id="app">
    <el-row :gutter="20">
        <el-col :span="24" class="">
            <div class="bg-purple">
                <div class="el-icon-s-grid grid-content my-ztleft  bg-purple " >数据列表</div>
            </div>
        </el-col>
    </el-row>

    <el-row :gutter="20">
        <el-col :span="6">
            <template>
                <div class="block">
                    <el-date-picker
                            v-model="value1"
                            type="date"
                            placeholder="起始日期">
                    </el-date-picker>
                </div>
            </template>
        </el-col>
        <el-col :span="6">
            <template>
                <div class="block">
                    <el-date-picker
                            v-model="value2"
                            type="date"
                            placeholder="结束日期">
                    </el-date-picker>
                </div>
            </template>
        </el-col>
        <el-col :span="3.5">
            <el-dropdown split-button type="primary">
                猪舍选择
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>A猪舍</el-dropdown-item>
                    <el-dropdown-item>B猪舍</el-dropdown-item>
                    <el-dropdown-item>C猪舍</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
            <%--<el-dropdown size="medium" split-button type="primary">--%>
        </el-col>
        <el-col :span="2.5">
            <el-dropdown split-button type="primary">
                类型
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>猪栏更换</el-dropdown-item>
                    <el-dropdown-item>猪动态</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </el-col>
        <el-col :span="2">
            <el-button type="primary">查询</el-button>
        </el-col>
    </el-row>

    <el-row :gutter="20">
        <el-col :span="24">
            <div class="grid-content bg-purple">
                <template>
                    <el-table
                            :data="tableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="猪栏唯一标识"
                                width="150"
                                align="center"
                        >
                        </el-table-column>
                        <el-table-column
                                prop="date"
                                label="猪栏名称"
                                width="150"
                                align="center"
                        >
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="变更数量"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="修改类型"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="city"
                                label="创建时间"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="更新时间"
                                width=150">
                        </el-table-column>
                        <el-table-column
                                prop="zip"
                                label="操作"
                                width="200">
                            <template slot-scope="scope">
                                <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
                                <el-button type="text" size="small" onclick="pigZhuNumUpdate()">编辑</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-col>
    </el-row>
    <el-row :gutter="20">
        <el-col :span="12">
            <div class="grid-content"></div>
        </el-col>
        <el-col :span="12">
            <div class="grid-content">
                <div class="block">
                    <%--<span class="demonstration">完整功能</span>--%>
                    <el-pagination
                            @size-change="handleSizeChange"
                            @current-change="handleCurrentChange"
                            :current-page="currentPage4"
                            :page-sizes="[100, 200, 300, 400]"
                            :page-size="100"
                            layout="total, sizes, prev, pager, next, jumper"
                            :total="400">
                    </el-pagination>
                </div>
            </div>
        </el-col>
    </el-row>
</div>
</body>
<script>
    new Vue({
        el: '#app',
        methods: {
            handleClick(row) {
                console.log(row);
            },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                console.log(`当前页: ${val}`);
            }
        },
        data() {
            return {
                //列表
                tableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 弄',
                    zip: 200333
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1517 弄',
                    zip: 200333
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1519 弄',
                    zip: 200333
                }, {
                    date: '2016-05-03',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1516 弄',
                    zip: 200333
                }],
                currentPage1: 5,
                currentPage2: 5,
                currentPage3: 5,
                currentPage4: 4,
                //日期
                pickerOptions: {
                    disabledDate(time) {
                        return time.getTime() > Date.now();
                    },
                    shortcuts: [{
                    }]
                },
                value1: '',
                value2: ''
            };
        }
    })

</script>
</html>