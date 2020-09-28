<%--suppress ALL --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <srcipt type="text/javascript" src="https://cdn.bootcss.com/moment.js/2.21.0/moment.js"></srcipt>
    <style>
        .aClass {
            color: red;

        }

        .bClass {
            color: green;
        }

        .cClass {
            font-size: 30px;
        }

        .dClass {
            font-size: 10px;
        }
    </style>
</head>
<body>
<div id="test1">
    <%--<input v-model="msg" >
    <p>{{msg}}</p>--%>
    <%--<p v-html="msg">aa</p>
    <p v-test="msg"></p>--%>
    性：<input v-model="xing"><br>
    名：<input v-model="ming"><br>
    姓名：<input v-model="firstName">

    <p class="cClass" :class="a">测试字符串</p>
    <p :class="{cClass:isA,dClass:isB}">测试对象</p>
    <p :style="{color:col,fontSize:fs + 'px' }">测试style</p>
    <p v-if="ok">成功</p>
    <p v-else>失败</p>
    <p v-show="show">show成功</p>
    <p v-show="!show">show失败</p>
    <button @click="update">按钮</button>
    <button @click="ok=!ok">ok按钮</button>
    <br>
    <button @click="show=!show">show钮</button>
    <br><br>

    <ul>
        <li v-for="(person,index) in persons">
            {{person.name}}---{{person.age}}---{{index}}---
            <button @click="delectP(index)">删除</button>
            <button @click="updateP(index,{name:'田七',age:14})">修改</button>
            <button @click="add(index,{name:'六把',age:11})">新增</button>
        </li>
    </ul>
    <br><br>
    <input type="text" v-model="selectName">
    <ul>
        <li v-for="(person,index) in filePerson">
            {{person.name}}---{{person.age}}---{{index}}---
            <button @click="delectP(index)">删除</button>
            <button @click="updateP(index,{name:'田七',age:14})">修改</button>
        </li>
    </ul>
    <button @click="order(1)">升序</button>
    <button @click="order(2)">降序</button>
    <button @click="order(0)">原序</button>
    <h2>绑定监听</h2>
    <br>
    <button @click="test1">test1</button>
    <button @click="test2('aa',$event)">test2</button>
    <h2>事件修饰符</h2>
    <div style="width: 200px;height: 200px;background-color: red" @click="test3">
        <div style="width: 100px;height: 100px; background-color: green" @click.stop="test4"></div>
    </div>
    <a href="http://www.baidu.com" @click.prevent="test5">去百度</a>

    <form action="/xxx" @submit.prevent="handleSubmit">
        <span>用户名</span>
        <input type="text" v-model="username"><br>
        <span>密码</span>
        <input type="text" v-model="password"><br>
        <span>性别</span>
        <input type="radio" v-model="sex" value="女">
        <label>女</label>
        <input type="radio" v-model="sex" value="男">
        <label>男</label><br>

        <span>爱好</span>
        <input type="checkbox" v-model="likes" value="foot">
        <label>足球</label>
        <input type="checkbox" v-model="likes" value="basket">
        <label>篮球</label>
        <input type="checkbox" v-model="likes" value="pingpang">
        <label>乒乓球</label><br>

        <span>城市</span>
        <select v-model="cityId">
            <option value="" >未选择</option>
            <%--<option :name="bj" v-model="city">北京</option>
            <option :name="sh" v-model="city">上海</option>
            <option :name="gz" v-model="city">广州</option>--%>
            <option :value="ct.id" v-for="(ct,index) in city" :onkey="index">{{ct.name}}</option>
        </select><br>
        <span>介绍</span><br>
        <textarea rows="10" v-model="show"></textarea><br>
        <input type="submit" value="注册">
    </form>

</div>

<div id="test02">
    <br>
    <button @click="distroyVM">destroy vm</button>
    <p v-show="isShow">尚硅谷IT教育</p>
    <%--<p>{{date | dateString}}</p>--%>
</div>
<br>
<div id="test03">
    <p v-upper-text ="shuju"></p>
    <p v-lower-text ="shuju"></p>
</div>
</body>
<script type="text/javascript">
    // 自定义过滤器
   /* Vue.filter("dateString",function(value){
        return moment(value).format("YYYY-MM-DD HH:mm:ss");
    });*/
   // 自定义指令
   Vue.directive('upper-text',function(el,binding){
       console.log(binding)
         el.textContent = binding.value.toUpperCase()
    });
   new Vue({
       el:test03,
       data:{
           shuju:"NBA i love"
       },
       directives:{
          "lower-text":function (el,binding) {
               el.textContent = binding.value.toLowerCase()
           }
       }
   });
    var vm02 = new Vue({
        el:test02,
        data:{
            isShow:true,
            date:new Date()
        },
        beforeMount(){
            //初始化显示之后
            this.intervalId = setInterval(function(){
                console.log("..............")
                vm02.isShow = !vm02.isShow
            },1000);
        },
        beforeDestroy(){
            clearInterval(this.intervalId );
        },
        methods:{
            distroyVM:function () {
                vm02.$destroy()
            },

        }
    });
    var vm = new Vue({
        el: "#test1",
        data: {
            /*msg:'<a href="http://www.baidu.com">百度</a>'*/
            xing: "李",
            ming: "振涛",
            a: "aClass",
            isA: true,
            isB: false,
            col: "red",
            fs: 50,
            ok: false,
            show: false,
            selectName: "",
            orderTye: "0",//0:原序 1：升序  2：降序
            persons: [{name: "张三", age: 18},
                {name: "李四", age: 17},
                {name: "王五", age: 16},
                {name: "赵六", age: 19}],
            username: "",
            password: "",
            sex: "",
            likes: "",
            city: [{id:1,name:"北京"},{id:2,name:"上海"},{id:3,name:"广州"}],
            show: "",
            cityId:""
        },
        computed: {
            firstName: {
                get: function () {
                    return this.xing + " " + this.ming
                },
                set: function (value) {
                    const names = value.split(" ")
                    this.xing = names[0]
                    this.ming = names[1]
                }
            },
            filePerson() {
                const {selectName, persons, orderTye} = this
                let fPerson
                fPerson = persons.filter(p => p.name.indexOf(selectName) >= 0)
                if (orderTye != 0) {
                    fPerson.sort(function (a1, a2) {
                        if (orderTye == 1) {
                            return a1.age - a2.age;
                        } else if (orderTye == 2) {
                            return a2.age - a1.age;
                        }
                    })
                }
                return fPerson
            }
        },
        methods: {
            update() {
                this.a = "bClass"
                this.isA = false
                this.isB = true
                this.col = "green"
                this.fs = 10
            },
            delectP(index) {
                this.persons.splice(index, 1);
            },
            updateP(index, newP) {
                this.persons.splice(index, 1, newP);
            },
            add(index, newP) {
                this.persons.splice(index, 0, newP);
            },
            order(value) {
                this.orderTye = value;
            },
            test1() {
                alert(event.target.innerHTML)
            },
            test2(value, event) {
                alert(value + "  " + event.target.innerHTML)
            },
            test3() {
                alert("大正方形")
            },
            test4() {
                alert("小正方形")
            },
            test5() {
                alert("不去")
            },
            handleSubmit() {
                alert(this.username + " " + this.password + " " + this.sex + " " + this.cityId + " " + this.show+" "+this.likes);
            }
        }

        /* watch:{
                xing: function(value){
                     this.firstName=value+this.ming;
                },
               ming:function(value1){
                    this.firstName=this.xing+value1;
               }
            }*/
    });
</script>
</html>
