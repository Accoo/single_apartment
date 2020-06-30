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
    <h2>房间列表</h2>
</blockquote>
<blockquote class="layui-elem-quote">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">房号</label>
                <div class="layui-input-inline">
                    <input type="text" id="roomNumber" name="roomNumber" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-inline">
                    <select id="typeId" name="typeId" lay-filter="leixing">
                        <option value="" selected=""></option>
                        <option value="1">独立单间</option>
                        <option value="2">一房一厅</option>
                        <option value="3">两房一厅</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline">
                    <select id="roomStatus" name="roomStatus" lay-filter="juese">
                        <option value="" selected=""></option>
                        <option value="0">未出租</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <button class="layui-btn" data-type="reload">搜索</button>
                    <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>
    </div>
</blockquote>

<table class="layui-hide" id="admin"  lay-filter="list"></table>
<div id="page"></div>

<script type="text/html" id="barDemo">
    <a id="appoint" class="layui-btn layui-btn-xs" lay-event="appoint">预约</a>
</script>


<%--<script type="text/html" id="toolbarSearch">--%>
<%--    --%>
<%--</script>--%>
<script id="createTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.songReleseTime);//songRelesrTime需要自定义的列的字段名
    return date.Format("yyyy-MM-dd");
    }}
</script>

<script>
    //获取上一页面传入参数
    function getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }
    // 调用参数
    var adminName = getQueryString("adminName");

    layui.use(['form','util','table', 'layer','laypage','laydate'], function(){
        var form = layui.form
            ,table = layui.table
            ,layer = layui.layer //弹层
            ,laydate = layui.laydate //日期时间选择器
            ,laypage = layui.laypage; //分页
        var tableIns;

        tableIns =  table.render({
            elem: '#admin'
            ,id: 'testReload'
            ,url:'room/search'
            // ,toolbar: '#toolbarSearch' //开启头部工具栏，并为其绑定左侧模板
            ,limit:10//要传向后台的每页显示条数
            ,cols: [[
                {fixed: 'left',field:'roomId', width:80, align:'center', title: 'ID'}
                ,{fixed: 'left',field:'roomNumber', width:120, align:'center', title: '房号'}
                ,{width:150, align:'center', title: '类型', templet: function(d){
                        if(d.roomType.typeid == 1){
                            return "独立单间";
                        } else if(d.roomType.typeid == 2){
                            return "一房一厅";
                        } else {
                            return "两房一厅";
                        } }}
                ,{width:150, align:'center', title: '面积/㎡', templet: function(d){
                        return d.roomType.roomArea}}
                ,{width:150, align:'center', title: '押金/元', templet: function(d){
                        return d.roomType.roomDeposit}}
                ,{width: 150, align:'center', title: '租金/元每月', templet: function(d){
                        return d.roomType.roomRent}}
                ,{width: 180,field:'roomLocation', align:'center', title: '地址'}
                ,{width: 150,field:'roomFloor', align:'center', title: '楼层'}
                ,{field:'roomStatus', width:180, align:'center', title: '状态', templet: function(d){
                        if(d.roomStatus == 0){
                            return "<span>未出租</span>";
                        } else if(d.roomStatus == 1 || d.roomStatus == 3){
                            return "<span style='color: #07d136;'>已出租</span>"
                        } else if(d.roomStatus == 2){
                            return "<span style='color: #ffa80a;'>已预约</span>";
                        } }}
                ,{fixed: 'right', minWidth: 120, align:'center', title: '操作', toolbar: '#barDemo'}
            ]]
            ,page:true
            // ,height: 500
        });

        var $ = layui.$, active = {
            reload: function(){
                var roomNumber = $('#roomNumber');
                var typeId = $('#typeId');
                var roomStatus = $('#roomStatus');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        roomNumber: roomNumber.val()
                        ,typeId: typeId.val()
                        ,roomStatus: roomStatus.val()
                    }
                }, 'data');
            }
        };

        //搜索按钮
        $('.layui-form .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //重置按钮
        $('#reset').on('click', function(){
            window.location = "imitateAppoint"
        });

        //监听行工具事件
        table.on('tool(list)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'appoint'){
                // //向服务端发送删除指令
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getRoomStatus", //提交的网址
                    data: {roomNumber:data.roomNumber,
                        adminName:adminName}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function (res) {//成功返回之后调用的函数
                        if (res == 1) {
                            window.location = "imitate";
                        } else{
                            layer.alert("该房间已出租，请另选其他房间")
                        }
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("操作失败")
                    }
                });
            }
        });

        form.on('submit(search)',function(data){
            var type = $(this).data('type');
            active[type]?active[type].call(this):'';
        })
    });
</script>

</body>
</html>