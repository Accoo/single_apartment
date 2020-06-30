<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="css/layui.css"  media="all">
</head>
<body>

<table class="layui-hide" id="test"></table>


<script src="js/layui.js" charset="utf-8"></script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'adminList'
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'adminAccount', width:80, title: '账号'}
                ,{field:'adminSex', width:80, title: '性别', sort: true}
                ,{field:'adminName', width:80, title: '姓名'}
                ,{field:'adminId', minWidth: 150, title: '身份证'}
                ,{field:'adminRole', width:80, title: '角色', sort: true}
                ,{field:'adminPhone', width:80, title: '电话号码'}
                ,{field:'registerTime', width:80, title: '注册时间'}
                ,{field:'loginStatus', width:80, title: '登录状态'}
                ,{field:'loginTime', width:100, title: '最近登录'}
                ,{field:'logoutTime', width:100, title: '最近登出'}
                ,{field:'remark', width:80, title: '备注'}
            ]]
            ,page: true
        });
    });
</script>

</body>
</html>
