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
<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">
    <h3>以下租客已欠租，予以警告</h3>
    <table class="layui-hide" id="rentOwed"  lay-filter="list"></table>
    <div id="page"></div>
</div>

<script>
    layui.use(['form','util','table', 'layer','laypage','laydate'], function(){
        var form = layui.form
            ,table = layui.table
            ,layer = layui.layer //弹层
            ,laydate = layui.laydate //日期时间选择器
            ,laypage = layui.laypage; //分页
        var tableIns;

        tableIns =  table.render({
            elem: '#rentOwed'
            ,id: 'testReload'
            ,url:'getRentOwed'
            ,limit:5//要传向后台的每页显示条数
            ,cols: [[
                {width:120, align:'center', title: '租客', templet: function(d){
                        return d.lodger.roomerName}}
                ,{width:120, align:'center', title: '房间号', templet: function(d){
                        return d.room.roomNumber}}
                ,{width: 150, align:'center', title: '联系方式', templet: function(d){
                        return d.lodger.mobilephone}}
            ]]
            ,page:true
            // ,height: 500
        });
    });
</script>

</body>
</html>