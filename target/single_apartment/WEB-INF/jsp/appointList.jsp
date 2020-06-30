<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>roomList</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">
    <link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
    <script src="js/layui.js" charset="utf-8"></script>
</head>
<body>
<blockquote class="layui-elem-quote">
    <h2>预约列表</h2>
</blockquote>

<table class="layui-hide" id="appoint"  lay-filter="list"></table>
<div id="page"></div>

<script type="text/html" id="barDemo">
    <a id="pass" class="layui-btn layui-btn-xs" lay-event="pass">通过</a>
    <a id="nopass" class="layui-btn layui-btn-xs layui-btn-xs" lay-event="nopass">不通过</a>
</script>


<%--<script type="text/html" id="toolbarSearch">--%>
<%--    --%>
<%--</script>--%>

<script>

    layui.use(['form','util','table', 'layer','laypage','laydate'], function(){
        var form = layui.form
            ,table = layui.table
            ,layer = layui.layer //弹层
            ,laydate = layui.laydate //日期时间选择器
            ,laypage = layui.laypage; //分页
        var tableIns;

        tableIns =  table.render({
            elem: '#appoint'
            ,id: 'testReload'
            ,url:'getAppointList'
            // ,toolbar: '#toolbarSearch' //开启头部工具栏，并为其绑定左侧模板
            ,limit:10//要传向后台的每页显示条数
            ,cols: [[
                {fixed: 'left', width:120, align:'center', title: '房号', templet: function(d){
                        return d.room.roomNumber}}
                ,{width:150, align:'center', title: '类型', templet: function(d){
                        if(d.room.roomType.typeid == 1){
                            return "独立单间";
                        } else if(d.room.roomType.typeid == 2){
                            return "一房一厅";
                        } else {
                            return "两房一厅";
                        } }}
                ,{width:150, align:'center', title: '面积/㎡', templet: function(d){
                        return d.room.roomType.roomArea}}
                ,{width:150, align:'center', title: '押金/元', templet: function(d){
                        return d.room.roomType.roomDeposit}}
                ,{width: 150, align:'center', title: '租金/元每月', templet: function(d){
                        return d.room.roomType.roomRent}}
                ,{width: 150,field:'paymentType', align:'center', title: '交租类型', templet: function(d){
                        if(d.paymentType == 1){
                            return "每月一付";
                        } else if(d.paymentType == 6){
                            return "半年一付";
                        } else {
                            return "一年一付";
                        } }}
                ,{width: 150,field:'checkinLength', align:'center', title: '租用时长/月'}
                ,{width: 180,field:'checkinTime', align:'center', title: '预约时间',templet:'<div>{{layui.util.toDateString(d.checkinTime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                ,{fixed: 'right', minWidth: 120, align:'center', title: '审核', toolbar: '#barDemo'}
            ]]
            ,page:true
            // ,height: 500
        });

        //监听行工具事件
        table.on('tool(list)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'pass'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "passAppoint", //提交的网址
                    data: {roomNumber:data.room.roomNumber,
                            passType:0}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function (res) {//成功返回之后调用的函数
                        if (res == 1) {
                            layer.confirm("预约已通过",function(){
                                window.location = "appointList";
                            })
                        } else{
                            layer.alert("通过操作失败")
                        }
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("操作失败")
                    }
                });
            } else if(layEvent === 'nopass'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "passAppoint", //提交的网址
                    data: {roomNumber:data.room.roomNumber,
                        passType:1}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function (res) {//成功返回之后调用的函数
                        if (res == 1) {
                            layer.confirm("预约不通过",function(){
                                window.location = "appointList";
                            })
                        } else{
                            layer.alert("操作失败")
                        }
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("操作失败")
                    }
                });
            }
        });
    });
</script>

</body>
</html>