<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">
</head>
<body>
<blockquote class="layui-elem-quote">
    <h2>支出表单</h2>
</blockquote>
<blockquote class="layui-elem-quote">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单号</label>
                <div class="layui-input-inline">
                    <input type="text" id="expNum" name="expNum" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="expendStart" name="expendStart" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">--</div>
                <div class="layui-input-inline">
                    <input type="text" id="expendEnd" name="expendEnd" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <button class="layui-btn" data-type="reload">搜索</button>
                    <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">支出类型</label>
                <div class="layui-input-inline">
                    <select id="expendType" name="expendType" lay-filter="leixing">
                        <option value=""  selected=""></option>
                        <option value="装修">装修</option>
                        <option value="维修">维修</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">房间号</label>
                <div class="layui-input-inline">
                    <input type="text" id="roomNumber" name="roomNumber" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </div>
</blockquote>

<table class="layui-hide" id="admin"  lay-filter="list"></table>
<div id="page"></div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
</script>

<script src="js/layui.js" charset="utf-8"></script>

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
            ,url:'expenditure/search'
            // ,toolbar: '#toolbarSearch' //开启头部工具栏，并为其绑定左侧模板
            ,limit:10//要传向后台的每页显示条数
            ,cols: [[
                {fixed: 'left',field:'expNum', width:120, align:'center', title: '支出单号'}
                ,{width:120, align:'center', title: '房间号', templet: function(d){return d.room.roomNumber;}}
                ,{field:'expendType',width:120, align:'center', title: '支出类型'}
                ,{field:'materialCharge',width:120, align:'center', title: '材料费用/元'}
                ,{field:'employeeCharge',width:120, align:'center', title: '人工费用/元'}
                ,{field:'totalCharge',width:120, align:'center', title: '总费用/元'}
                ,{field:'payDate',width:180, align:'center', title: '支出时间',templet:'<div>{{layui.util.toDateString(d.payDate, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                ,{field:'operator',width:100, align:'center', title: '经办人'}
                ,{field:'expendContent',width:200, align:'center', title: '支出内容'}
                ,{fixed: 'right', minWidth: 180, align:'center', title: '操作', toolbar: '#barDemo'}
            ]]
            ,page:true
        });

        //日期时间选择器
        laydate.render({
            elem: '#expendStart'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#expendEnd'
            ,type: 'datetime'
        });

        var $ = layui.$, active = {
            reload: function(){
                var adminAccount = $('#adminAccount');
                var adminName = $('#adminName');
                var roomNumber = $('#roomNumber');
                var expNum = $('#expNum');
                var expendStart = $('#expendStart');
                var expendEnd = $('#expendEnd');
                var expendType = $('#expendType');

                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        adminAccount: adminAccount.val()
                        ,adminName: adminName.val()
                        ,roomNumber: roomNumber.val()
                        ,expNum: expNum.val()
                        ,expendStart: expendStart.val()
                        ,expendEnd: expendEnd.val()
                        ,expendType: expendType.val()
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
            window.location = "expendList"
        })

        //监听行工具事件
        table.on('tool(list)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getOrder", //提交的网址
                    data: {expNum:data.expNum}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function () {//成功返回之后调用的函数
                        layer.open({
                            type: 2
                            ,title: '查看支出订单'
                            ,area: ['480px', '600px']
                            ,offset: '10px'
                            ,shade: 0
                            ,maxmin: true
                            ,content: 'expendInfo'
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
                        layer.alert("找不到该支出表单")
                    }
                });
            }
        });

        form.on('submit(search)',function(data){
            var type = $(this).data('type');
            active[type]?active[type].call(this):'';
            alert(JSON.stringify(data));
        })
    });
</script>

</body>
</html>