<%@ page import="com.gdou.model.Room" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    Room room = (Room) request.getSession().getAttribute("room");
%>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
</fieldset>
<form class="layui-form" action="" lay-filter="example">
    <div style="text-align: center;">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-inline">
                <input type="text" id="roomNumber" name="roomNumber" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间类型</label>
            <div class="layui-input-inline">
                <input type="text" id="typeId" name="typeId" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间面积</label>
            <div class="layui-input-inline">
                <input type="text" id="roomArea" name="roomArea" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间楼层</label>
            <div class="layui-input-inline">
                <input type="text" id="roomFloor" name="roomFloor" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">押金</label>
            <div class="layui-input-inline">
                <input type="text" id="roomDeposit" name="roomDeposit" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">租金</label>
            <div class="layui-input-inline">
                <input type="text" id="roomRent" name="roomRent" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">水表起始数</label>
            <div class="layui-input-inline">
                <input type="text" id="waterStart" name="waterStart" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电表起始数</label>
            <div class="layui-input-inline">
                <input type="text" id="electricStart" name="electricStart" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <text id="remark" name="remark" placeholder="请输入内容" class="layui-text"></text>
            </div>
        </div>
    </div>
    </div>
    <input  type="hidden" id="roomStatus" name="roomStatus" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
</form>

<script>
    //   获取账户信息
    $(function(){
        var roomNumber = '<%=room.getRoomNumber()%>';
        var typeId = '<%=room.getRoomType().getTypeid()%>';
        var roomArea = '<%=room.getRoomType().getRoomArea()%>';
        var roomFloor = '<%=room.getRoomFloor()%>';
        var roomDeposit = '<%=room.getRoomType().getRoomDeposit()%>';
        var roomRent = '<%=room.getRoomType().getRoomRent()%>';
        var waterStart = '<%=room.getWaterStart()%>';
        var electricStart = '<%=room.getElectricStart()%>';
        var remark = '<%=room.getRemark()%>';
        var roomStatus = '<%=room.getRoomStatus()%>';
        // 改变内容
        $("#roomNumber").attr("value",roomNumber);
        if (typeId == 1) {
            $("#typeId").attr("value","独立单间");
        } else if (typeId == 2) {
            $("#typeId").attr("value","一房一厅");
        } else if (typeId == 3) {
            $("#typeId").attr("value","两房一厅");
        }
        $("#roomArea").attr("value",roomArea+" ㎡");
        $("#roomFloor").attr("value",roomFloor);
        $("#roomDeposit").attr("value",roomDeposit+" 元");
        $("#roomRent").attr("value",roomRent+" 元");
        $("#waterStart").attr("value",waterStart);
        $("#electricStart").attr("value",electricStart);
        $("#remark").attr("value",remark);
        $("#roomStatus").attr("value",roomStatus);
    });

    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
    });
</script>
</body>
</html>
