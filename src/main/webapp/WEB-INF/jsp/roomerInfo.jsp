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
            <label class="layui-form-label">房客姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="roomerName" name="roomerName" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="text" id="roomerSex" name="roomerSex" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证</label>
            <div class="layui-input-inline">
                <input type="text" id="roomerId" name="roomerId" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-inline">
                <input type="text" id="mobilephone" name="mobilephone" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">租用类型</label>
            <div class="layui-input-inline">
                <input type="text" id="paymentType" name="paymentType" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">租用时长</label>
            <div class="layui-input-inline">
                <input type="text" id="checkinLength" name="checkinLength" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <text id="checkinRemark" name="checkinRemark" class="layui-text"></text>
            </div>
        </div>
    </div>
    </div>
    <input  type="hidden" id="roomStatus" name="roomStatus" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
    <input  type="hidden" id="paymentStatus" name="paymentStatus" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
</form>

<script>
    //   获取账户信息
    $(function(){
        var roomNumber = '<%=checkin.getRoom().getRoomNumber()%>';
        var typeId = '<%=checkin.getRoom().getRoomType().getTypeid()%>';
        var roomerName = '<%=checkin.getLodger().getRoomerName()%>';
        var roomerSex = '<%=checkin.getLodger().getRoomerSex()%>';
        var roomerId = '<%=checkin.getLodger().getRoomerId()%>';
        var mobilephone = '<%=checkin.getLodger().getMobilephone()%>';
        var paymentType = '<%=checkin.getPaymentType()%>';
        var checkinLength = '<%=checkin.getCheckinLength()%>';
        var checkinRemark = '<%=checkin.getCheckinRemark()%>';
        var roomStatus = '<%=checkin.getRoom().getRoomStatus()%>';
        var paymentStatus = '<%=checkin.getPaymentStatus()%>';
        // 改变内容
        $("#roomNumber").attr("value",roomNumber);
        if (typeId == 1) {
            $("#typeId").attr("value","独立单间");
        } else if (typeId == 2) {
            $("#typeId").attr("value","一房一厅");
        } else if (typeId == 3) {
            $("#typeId").attr("value","两房一厅");
        }
        $("#roomerName").attr("value",roomerName);
        $("#roomerSex").attr("value",roomerSex);
        $("#roomerId").attr("value",roomerId);
        $("#mobilephone").attr("value",mobilephone);
        if (paymentType == 1) {
            $("#paymentType").attr("value","每月一付");
        } else if (paymentType == 6) {
            $("#paymentType").attr("value","半年一付");
        } else if (paymentType == 12) {
            $("#paymentType").attr("value","一年一付");
        }
        if (checkinLength == 1) {
            $("#checkinLength").attr("value","一个月");
        } else if (checkinLength == 6) {
            $("#checkinLength").attr("value","半年");
        } else if (checkinLength == 12) {
            $("#checkinLength").attr("value","一年");
        }
        $("#checkinRemark").attr("value",checkinRemark);
        $("#roomStatus").attr("value",roomStatus);
        $("#paymentStatus").attr("value",paymentStatus);
    });

    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
    });
</script>
</body>
</html>
