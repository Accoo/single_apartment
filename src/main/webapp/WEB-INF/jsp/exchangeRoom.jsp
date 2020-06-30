<%@ page import="com.gdou.model.RoomCheckin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    RoomCheckin checkin = (RoomCheckin) request.getSession().getAttribute("checkin");
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
                <label class="layui-form-label">交换房间号</label>
                <div class="layui-input-inline">
                    <input type="text" id="exchangeRoomNum" name="exchangeRoomNum"  lay-verify="required" autocomplete="off" class="layui-input">
                    <input  type="hidden" id="roomNumber" name="roomNumber" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    //   获取账户信息
    $(function(){
        var roomNumber = '<%=checkin.getRoom().getRoomNumber()%>';
        // 改变内容
        $("#roomNumber").attr("value",roomNumber);
    });

    var callbackdata = function () {
        var data = {
            roomNumber: $("#roomNumber").val(),
            exchangeRoomNum:$("#exchangeRoomNum").val()
        };
        return data;
    };

    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
    });
</script>
</body>
</html>

