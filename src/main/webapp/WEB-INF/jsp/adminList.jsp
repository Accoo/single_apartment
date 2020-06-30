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
        <h2>管理员列表</h2>
    </blockquote>
    <blockquote class="layui-elem-quote">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-inline">
                    <input type="text" id="adminAccount" name="adminAccount" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="adminName" name="adminName" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">注册</label>
                <div class="layui-input-inline">
                    <input type="text" id="registerStart" name="registerStart" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">--</div>
                <div class="layui-input-inline">
                    <input type="text" id="registerEnd" name="registerEnd" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <button class="layui-btn" data-type="reload">搜索</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <select id="adminRole" name="adminRole" lay-filter="juese">
                        <option value="" selected=""></option>
                        <option value="1">普通管理员</option>
                        <option value="2">超级管理员</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select style="width: 200px;height: 50px" id="adminSex" name="adminSex" lay-filter="juese">
                        <option value="" selected=""></option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录</label>
                <div class="layui-input-inline">
                    <input type="text" id="loginStart" name="loginStart" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">--</div>
                <div class="layui-input-inline">
                    <input type="tel" id="loginEnd" name="loginEnd" placeholder="yyyy-MM-dd HH:mm:ss"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>
    </div>
    </blockquote>

<table class="layui-hide" id="admin"  lay-filter="list"></table>
<div id="page"></div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            ,url:'admin/search'
            // ,toolbar: '#toolbarSearch' //开启头部工具栏，并为其绑定左侧模板
            ,limit:10//要传向后台的每页显示条数
            ,cols: [[
                {field:'id', width:50, title: 'ID'}
                ,{field:'adminAccount', width:80, title: '账号'}
                ,{field:'adminSex', width:80, title: '性别'}
                ,{field:'adminName', width:100, title: '姓名'}
                ,{field:'adminId',  width: 180, title: '身份证'}
                ,{field:'adminRole', width:150, title: '角色', templet: function(d){if(d.adminRole == 1){return "普通管理员";} return "超级管理员";}}
                ,{field:'adminPhone', width:120, title: '电话号码'}
                ,{field:'registerTime', width:180, title: '注册时间',templet:'<div>{{layui.util.toDateString(d.registerTime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                ,{field:'loginStatus', width:80, title: '状态', templet: function(d){if(d.loginStatus == 1){return "在线";} return "离线";}}
                ,{field:'loginTime', width:180, title: '最近登录',templet:'<div>{{layui.util.toDateString(d.loginTime, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                ,{field:'remark', width:150, title: '备注'}
                ,{fixed: 'right', width: 125, align:'center', title: '操作', toolbar: '#barDemo'}
            ]]
            ,page:true
            ,height: 500
        });

        //日期时间选择器
        laydate.render({
            elem: '#registerStart'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#registerEnd'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#loginStart'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#loginEnd'
            ,type: 'datetime'
        });

        var $ = layui.$, active = {
            reload: function(){
                var adminAccount = $('#adminAccount');
                var adminName = $('#adminName');
                var adminSex = $('#adminSex');
                var adminRole = $('#adminRole');
                var registerStart = $('#registerStart');
                var registerEnd = $('#registerEnd');
                var loginStart = $('#loginStart');
                var loginEnd = $('#loginEnd');

                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        adminAccount: adminAccount.val()
                        ,adminName: adminName.val()
                        ,adminSex: adminSex.val()
                        ,adminRole: adminRole.val()
                        ,registerStart: registerStart.val()
                        ,registerEnd: registerEnd.val()
                        ,loginStart: loginStart.val()
                        ,loginEnd: loginEnd.val()
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
            window.location = "adminList"
        })

        //监听行工具事件
        table.on('tool(list)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
                $.ajax({
                    type: "GET",        //提交数据的类型 POST GET
                    url: "getAdmin", //提交的网址
                    data: {adminAccount:data.adminAccount}, //提交的数据
                    datatype: JSON,     //返回数据的格式
                    success: function () {//成功返回之后调用的函数
                        window.location = "admin";
                    },
                    error: function () {    //调用出错执行的函数
                        layer.alert("找不到此人")
                    }
                });
            } else if(layEvent === 'del'){
                layer.confirm("确认删除吗？", function(index){
                    // //向服务端发送删除指令
                    $.ajax({
                        type: "GET",        //提交数据的类型 POST GET
                        url: "deleteAdmin", //提交的网址
                        data: {id:data.id}, //提交的数据
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
            }
        });

        form.on('submit(search)',function(data){
            var type = $(this).data('type');
            active[type]?active[type].call(this):'';
            alert(JSON.stringify(data));
        })
    });
</script>

<script type="text/html" id="status">
    {{#  if(d.status == 0){ }}
    离线
    {{#  } else if(d.status == 1){ }}
    在线
    {{#  } }}
</script>

</body>
</html>