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
                        <option value="1">已出租</option>
                        <option value="2">已预约</option>
                        <option value="3">欠租</option>
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
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a id="moveinto" class="layui-btn layui-btn-xs" lay-event="moveinto">入住登记</a>
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="roomerInfo">租客信息</a>
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
                ,{width:200, align:'center', title: '类型', templet: function(d){
                        if(d.roomType.typeid == 1){
                            return "独立单间";
                        } else if(d.roomType.typeid == 2){
                            return "一房一厅";
                        } else {
                            return "两房一厅";
                        } }}
                ,{width:180, align:'center', title: '面积/㎡', templet: function(d){
                        return d.roomType.roomArea}}
                ,{width:180, align:'center', title: '押金/元', templet: function(d){
                        return d.roomType.roomDeposit}}
                ,{width: 180, align:'center', title: '租金/元每月', templet: function(d){
                        return d.roomType.roomRent}}
                ,{field:'roomStatus', width:180, align:'center', title: '状态', templet: function(d){
                        if(d.roomStatus == 0){
                            return "<span>未出租</span>";
                        } else if(d.roomStatus == 1){
                            return "<span style='color: #07d136;'>已出租</span>"
                        } else if(d.roomStatus == 2){
                            return "<span style='color: #ffa80a;'>已预约</span>";
                        } else if(d.roomStatus == 3){
                            return "<span style='color: #FF5722;'>欠租</span>";
                        } }}
                ,{fixed: 'right', minWidth: 180, align:'center', title: '操作', toolbar: '#barDemo'}
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
            window.location = "roomList"
        });

        //监听行工具事件
        table.on('tool(list)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getRoom", //提交的网址
                    data: {roomNumber:data.roomNumber}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function () {//成功返回之后调用的函数
                        layer.open({
                            type: 2
                            ,title: '修改房间信息'
                            ,area: ['500px', '650px']
                            ,offset: '10px'
                            ,shade: 0
                            ,maxmin: true
                            ,content: 'room'
                            ,btn: ['确认修改', '全部关闭']
                            ,yes: function(index){
                                //当点击‘确定’按钮的时候，获取弹出层返回的值
                                var data = window["layui-layer-iframe" + index].callbackdata();
                                $.ajax({
                                    type: "GET",
                                    url: "editRoom",
                                    data: data,
                                    datatype: JSON,
                                    success: function (res) {
                                        layer.closeAll();
                                        if (res == 1) {
                                            layer.confirm("修改成功！！！",function(){
                                                window.location = "roomList";
                                            });
                                        } else {
                                            layer.alert("修改失败！请检查修改内容格式");
                                        }
                                    },
                                    //调用出错执行的函数
                                    error: function () {
                                        layer.closeAll();
                                        layer.alert("操作失败")
                                    }
                                });
                                return false;
                            }
                            ,btn2: function(){
                                layer.closeAll();
                            }

                            ,zIndex: layer.zIndex //重点1
                            ,success: function(layero){
                                layer.setTop(layero); //重点2
                            }
                        });
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("找不到该房间")
                    }
                });
            } else if(layEvent === 'del'){
                layer.confirm("确认删除吗？", function(index){
                    // //向服务端发送删除指令
                    $.ajax({
                        type: "GET",        //提交数据的类型 POST GET
                        url: "deleteRoom", //提交的网址
                        data: {roomNumber:data.roomNumber}, //提交的数据
                        datatype: JSON,     //返回数据的格式
                        success: function () {//成功返回之后调用的函数
                            layer.alert("删除成功")
                        },
                        error: function () {    //调用出错执行的函数
                            layer.alert("删除失败")
                        }
                    });
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    // return false;
                });
            } else if(layEvent === 'detail'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getRoom", //提交的网址
                    data: {roomNumber:data.roomNumber}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function () {//成功返回之后调用的函数
                        layer.open({
                            type: 2
                            ,title: '查看房间信息'
                            ,area: ['480px', '600px']
                            ,offset: '10px'
                            ,shade: 0
                            ,maxmin: true
                            ,content: 'roomInfo'
                            ,btn: [ '全部关闭']
                            ,yes: function(){
                                layer.closeAll();
                            }
                            ,zIndex: layer.zIndex
                            ,success: function(layero){
                                layer.setTop(layero);
                            }
                        });
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("找不到该房间")
                    }
                });
            } else if(layEvent === 'moveinto'){
                // //向服务端发送删除指令
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getRoomStatus", //提交的网址
                    data: {roomNumber:data.roomNumber,
                            adminName:adminName}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function (res) {//成功返回之后调用的函数
                        if (res == 1) {
                            window.location = "checkin";
                        } else{
                            layer.alert("该房间已出租，请另选其他房间")
                        }
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("操作失败")
                    }
                });
            } else if(layEvent === 'roomerInfo'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getCheckin", //提交的网址
                    data: {roomNumber:data.roomNumber}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function () {//成功返回之后调用的函数
                        layer.open({
                            type: 2
                            ,title: '查看房客信息'
                            ,area: ['480px', '550px']
                            ,offset: '10px'
                            ,shade: 0
                            ,maxmin: true
                            ,content: 'roomerInfo'
                            ,btn: ['换房','交租','退房', '全部关闭']
                            ,yes: function(){
                                layer.closeAll();
                                layer.open({
                                    type: 2
                                    ,title: '交换房间信息填写'
                                    ,area: ['480px', '200px']
                                    ,shade: 0
                                    ,maxmin: true
                                    ,content: 'exchangeRoom'
                                    ,btn: ['确认交换', '全部关闭']
                                    ,yes: function(index){
                                        var data = window["layui-layer-iframe" + index].callbackdata();
                                        layer.closeAll();
                                        layer.confirm("是否确认交换房间?",function () {
                                            $.ajax({
                                                type: "GET",        //提交数据的类型 POST GET
                                                url: "exchangeRomAction", //提交的网址
                                                data: data, //提交的数据
                                                datatype: JSON,     //返回数据的格式
                                                success: function (res) {//成功返回之后调用的函数
                                                    if (res == 1) {
                                                        layer.confirm("房间已交换成功",function () {
                                                            window.location = "roomList";
                                                        })
                                                    } else{
                                                        layer.alert("该房间不存在")
                                                    }
                                                },
                                                error: function () {    //调用出错执行的函数
                                                    layer.alert("操作失败")
                                                }
                                            });
                                        })
                                    }
                                    ,zIndex: layer.zIndex
                                    ,success: function(layero){
                                        layer.setTop(layero);
                                    }
                                });
                            }
                            //交租
                            ,btn2: function () {
                                layer.closeAll();
                                $.ajax({
                                    type: "GET",        //提交数据的类型 POST GET
                                    url: "getWater", //提交的网址
                                    data: {roomNumber:data.roomNumber,
                                        checkoutType: 0}, //提交的数据
                                    datatype: JSON,     //返回数据的格式
                                    success: function (res) {//成功返回之后调用的函数
                                        if (res == 1) {
                                            layer.open({
                                                type: 2
                                                ,title: '电表水表信息'
                                                ,area: ['480px', '450px']
                                                ,shade: 0
                                                ,maxmin: true
                                                ,content: 'waterElectric'
                                                ,btn: ['确认','关闭']
                                                ,yes: function(index){
                                                    var data = window["layui-layer-iframe" + index].callbackdata();
                                                    $.ajax({
                                                        type: "GET",        //提交数据的类型 POST GET
                                                        url: "getCheckout", //提交的网址
                                                        data: data, //提交的数据
                                                        datatype: JSON,     //返回数据的格式
                                                        success: function (res) {//成功返回之后调用的函数
                                                            if (res == 1) {
                                                                layer.closeAll();
                                                                layer.open({
                                                                    type: 2
                                                                    ,title: '确认交租'
                                                                    ,area: ['480px', '600px']
                                                                    ,offset: '10px'
                                                                    ,shade: 0
                                                                    ,maxmin: true
                                                                    ,content: 'checkout'
                                                                    ,btn: [ '确认交租','全部关闭']
                                                                    ,yes: function(index){
                                                                        var data = window["layui-layer-iframe" + index].callbackdata1();
                                                                        $.ajax({
                                                                            type: "GET",    //提交数据的类型 POST GET
                                                                            url: "checkoutAction",  //提交的网址
                                                                            data: data,   //返回数据的格式
                                                                            datatype: JSON,
                                                                            async: false,
                                                                            success: function (res) {   //成功返回之后调用的函数
                                                                                if (res == 1) {
                                                                                    layer.closeAll();
                                                                                    layer.confirm("交租成功",function () {
                                                                                        window.location = "roomList";
                                                                                    })
                                                                                } else {
                                                                                    layer.alert("交租失败")
                                                                                }
                                                                            },
                                                                            error: function () {    //调用出错执行的函数
                                                                                layer.alert("操作失败")
                                                                            }
                                                                        });
                                                                    }
                                                                    ,btn2: function () {
                                                                        layer.closeAll();
                                                                    }
                                                                    ,zIndex: layer.zIndex
                                                                    ,success: function(layero){
                                                                        layer.setTop(layero);
                                                                    }
                                                                });
                                                            } else{
                                                                layer.alert("结算出错")
                                                            }
                                                        },
                                                        error: function () {    //调用出错执行的函数
                                                            layer.alert("操作失败")
                                                        }
                                                    });
                                                }
                                                ,btn2: function(index){
                                                    layer.close(index);
                                                }
                                                ,zIndex: layer.zIndex
                                                ,success: function(layero){
                                                    layer.setTop(layero);
                                                }
                                            });
                                        } else{
                                            layer.alert("该房间已被预订或租用，请另选其他房间")
                                        }
                                    },
                                    error: function () {    //调用出错执行的函数
                                        layer.alert("操作失败")
                                    }
                                });
                            }
                            //退房
                            ,btn3: function(){
                                layer.closeAll();
                                $.ajax({
                                    type: "GET",        //提交数据的类型 POST GET
                                    url: "getWater", //提交的网址
                                    data: {roomNumber:data.roomNumber,
                                            checkoutType: 1}, //提交的数据
                                    datatype: JSON,     //返回数据的格式
                                    success: function (res) {//成功返回之后调用的函数
                                        if (res == 1) {
                                            layer.open({
                                                type: 2
                                                ,title: '电表水表信息'
                                                ,area: ['480px', '400px']
                                                ,shade: 0
                                                ,maxmin: true
                                                ,content: 'waterElectric'
                                                ,btn: ['确认','关闭']
                                                ,yes: function(index){
                                                    var data = window["layui-layer-iframe" + index].callbackdata();
                                                    $.ajax({
                                                        type: "GET",        //提交数据的类型 POST GET
                                                        url: "getCheckout", //提交的网址
                                                        data: data, //提交的数据
                                                        datatype: JSON,     //返回数据的格式
                                                        success: function (res) {//成功返回之后调用的函数
                                                            if (res == 1) {
                                                                layer.closeAll();
                                                                layer.open({
                                                                    type: 2
                                                                    ,title: '确认退房'
                                                                    ,area: ['480px', '600px']
                                                                    ,offset: '10px'
                                                                    ,shade: 0
                                                                    ,maxmin: true
                                                                    ,content: 'checkout'
                                                                    ,btn: [ '付款退房','全部关闭']
                                                                    ,yes: function(index){
                                                                        var data = window["layui-layer-iframe" + index].callbackdata1();
                                                                        $.ajax({
                                                                            type: "GET",    //提交数据的类型 POST GET
                                                                            url: "checkoutAction",  //提交的网址
                                                                            data: data,   //返回数据的格式
                                                                            datatype: JSON,
                                                                            async: false,
                                                                            success: function (res) {   //成功返回之后调用的函数
                                                                                if (res == 1) {
                                                                                    layer.closeAll();
                                                                                    layer.confirm("退房成功",function () {
                                                                                        window.location = "roomList";
                                                                                    })
                                                                                } else {
                                                                                    layer.alert("退房失败")
                                                                                }
                                                                            },
                                                                            error: function () {    //调用出错执行的函数
                                                                                layer.alert("操作失败")
                                                                            }
                                                                        });
                                                                    }
                                                                    ,btn2: function () {
                                                                        layer.closeAll();
                                                                    }
                                                                    ,zIndex: layer.zIndex
                                                                    ,success: function(layero){
                                                                        layer.setTop(layero);
                                                                    }
                                                                });
                                                            } else{
                                                                layer.alert("结算出错")
                                                            }
                                                        },
                                                        error: function () {    //调用出错执行的函数
                                                            layer.alert("操作失败")
                                                        }
                                                    });
                                                }
                                                ,btn2: function(index){
                                                    layer.close(index);
                                                }
                                                ,zIndex: layer.zIndex
                                                ,success: function(layero){
                                                    layer.setTop(layero);
                                                }
                                            });
                                        } else{
                                            layer.alert("该房间已被预订或租用，请另选其他房间")
                                        }
                                    },
                                    error: function () {    //调用出错执行的函数
                                        layer.alert("操作失败")
                                    }
                                });
                            }
                            ,btn4: function(){
                                layer.closeAll();
                            }
                            ,zIndex: layer.zIndex
                            ,success: function(layero){
                                layer.setTop(layero);
                            }
                        });
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("该房间还未出租，没有租客查看")
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