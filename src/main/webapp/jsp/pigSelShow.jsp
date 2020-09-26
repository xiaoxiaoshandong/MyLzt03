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
        function pigZhuLanAdd(){
            window.location.href="pigZhuLanAdd.jsp";
        };

        function pigZhuLanUpdate(){
            window.location.href="pigZhuLanUpdate.jsp";
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
        <el-col :span="4">
            <el-dropdown split-button type="primary">
                猪舍选择
                <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item>A猪舍</el-dropdown-item>
                    <el-dropdown-item>B猪舍</el-dropdown-item>
                    <el-dropdown-item>C猪舍</el-dropdown-item>
                </el-dropdown-menu>
            </el-dropdown>
        </el-col>
        <el-col :span="2">
            <el-button type="primary">查询</el-button>
        </el-col>
    </el-row>
    <el-row :gutter="20">
        <el-col :span="8">
            <div  class=' form-control' id="lrzs" style="height:340px;margin-top: 3%; "></div>
        </el-col>
        <el-col :span="8">
            <div  class=' form-control' id="gszs" style="height:340px;margin-top:3%;"></div>
        </el-col>
        <el-col :span="8">
            <div  class=' form-control'id="trgx" style="height:340px;margin-top:3%;"></div>
        </el-col>
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
            }
        }
    });

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('lrzs'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '利润展示'
        },
        tooltip: {},
        legend: {
            data:['元']
        },
        xAxis: {
            data: ["纯利润","毛利润","投入"]
        },
        yAxis: {
            type: 'value',
            axisTick: {
                inside: true
            },
            scale: true,
            axisLabel: {
                margin: 2,
                formatter: function (value, index) {
                    if ( value < 10000000) {
                        value = value / 10000 + "万";
                    } else if (value >= 10000000) {
                        value = value / 10000000 + "千万";
                    }
                    return value;
                }
            },
        },
        series: [{
            name: '元',
            type: 'bar',
            data: [-30000,10000,40000]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.5)' //rgba设置透明度0.1
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option , true);
    window.addEventListener('resize', function() {
            myChart.resize();
        }
    );

    // 基于准备好的dom，初始化echarts实例
    var gszsChart = echarts.init(document.getElementById('gszs'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '个数比例展示'
        },
        tooltip: {},
        legend: {
            data:['个']
        },
        xAxis: {
            data: ["死亡","出栏","新增仔猪","其他"]
        },
        yAxis: {},
        series: [{
            name: '个',
            type: 'bar',
            data: [5, 15,50,12]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.5)' //rgba设置透明度0.1
    };

    // 使用刚指定的配置项和数据显示图表。
    gszsChart.setOption(option , true);
    window.addEventListener('resize', function() {
            gszsChart.resize();
        }
    );

    // 基于准备好的dom，初始化echarts实例
    var trgxChart = echarts.init(document.getElementById('trgx'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '投入各项展示'
        },
        tooltip: {},
        legend: {
            data:['元']
        },
        xAxis: {
            data: ["饲料投入","人工投入","水投入","电投入","粮食投入","防疫投入","其他投入"],
            axisLabel: {
                interval:0,
                rotate:40
            }
        },
        yAxis: {
            type: 'value',
            axisTick: {
                inside: true
            },
            scale: true,
            axisLabel: {
                margin: 2,
                formatter: function (value, index) {
                    if (value >= 10000 && value < 10000000) {
                        value = value / 10000 + "万";
                    } else if (value >= 10000000) {
                        value = value / 10000000 + "千万";
                    }
                    return value;
                }

            },
        },
        series: [{
            name: '元',
            type: 'bar',
            data: [5000, 15000,50000,12000,12000,44000,66000]
        }],
        backgroundColor:'rgba(128, 128, 128, 0.5)' //rgba设置透明度0.1
    };

    // 使用刚指定的配置项和数据显示图表。
    trgxChart.setOption(option , true);
    window.addEventListener('resize', function() {
            trgxChart.resize();
        }
    );

</script>
</html>