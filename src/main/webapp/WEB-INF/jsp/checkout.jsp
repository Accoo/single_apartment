<%@ page import="com.gdou.model.RoomCheckin" %>
<%@ page import="com.gdou.model.RoomCheckout" %>
<%@ page import="com.gdou.model.Room" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    RoomCheckin checkin = (RoomCheckin) request.getSession().getAttribute("checkin");
    RoomCheckout checkout = (RoomCheckout) request.getSession().getAttribute("checkout");
    Room room = (Room) request.getSession().getAttribute("room");
    String payrentTimes = (String) request.getSession().getAttribute("payrentTimes");
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
                    <input type="text" id="roomNumber" name="roomNumber" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">房客姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="roomerName" name="roomerName" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">租用类型</label>
                <div class="layui-input-inline">
                    <input type="text" id="paymentType" name="paymentType" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">租用时长</label>
                <div class="layui-input-inline">
                    <input type="text" id="checkinLength" name="checkinLength" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">已交租/个月</label>
                <div class="layui-input-inline">
                    <input type="text" id="paymentStatus" name="paymentStatus" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline" id="payTimes">
                <label class="layui-form-label">现交租/个月</label>
                <div class="layui-input-inline">
                    <input type="text" id="payrentTimes" name="payrentTimes" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">应交水费/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="waterMoney" name="waterMoney" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">应交电费/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="electricMoney" name="electricMoney" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline" id="deposit">
                <label class="layui-form-label">应退押金/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="checkoutDeposit" name="checkoutDeposit" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">应交房租/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="hireMoney" name="hireMoney" disabled="disabled"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">总共应付/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="checkoutMoey" name="checkoutMoey" disabled="disabled" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </div>
    <input  type="hidden" id="lodgerId" name="lodgerId" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
    <input  type="hidden" id="waterStart" name="waterStart" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
    <input  type="hidden" id="electricStart" name="electricStart" visibility="hidden"  lay-verify="required" autocomplete="off" class="layui-input">
</form>

<script>
    //   获取账户信息
    $(function(){
        var roomNumber = '<%=checkin.getRoom().getRoomNumber()%>';
        var roomerName = '<%=checkin.getLodger().getRoomerName()%>';
        var paymentType = '<%=checkin.getPaymentType()%>';
        var checkinLength = '<%=checkin.getCheckinLength()%>';
        var paymentStatus = '<%=checkin.getPaymentStatus()%>';
        var waterMoney = '<%=checkout.getWaterMoney()%>';
        var electricMoney = '<%=checkout.getElectricMoney()%>';
        var checkoutDeposit = '<%=checkout.getCheckoutDeposit()%>';
        var hireMoney = '<%=checkout.getHireMoney()%>';
        var checkoutMoey = '<%=checkout.getCheckoutMoey()%>';
        var lodgerId = '<%=checkin.getLodger().getId()%>';
        var waterStart = '<%=room.getWaterStart()%>';
        var electricStart = '<%=room.getElectricStart()%>';
        var payrentTimes = '<%=payrentTimes%>';
        // 改变内容
        $("#roomNumber").attr("value",roomNumber);
        $("#roomerName").attr("value",roomerName);
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
        $("#paymentStatus").attr("value",paymentStatus*paymentType);
        $("#waterMoney").attr("value",waterMoney);
        $("#electricMoney").attr("value",electricMoney);
        $("#checkoutDeposit").attr("value",checkoutDeposit);
        $("#hireMoney").attr("value",hireMoney);
        $("#checkoutMoey").attr("value",checkoutMoey);
        $("#waterStart").attr("value",waterStart);
        $("#electricStart").attr("value",electricStart);
        $("#lodgerId").attr("value",lodgerId);
        $("#payrentTimes").attr("value",payrentTimes*paymentType);

        if (payrentTimes == 0) {
            document.getElementById("payTimes").style.display='none';
        } else {
            document.getElementById("deposit").style.display='none';
        }
    });

    var callbackdata1 = function () {
        var data = {
            roomNumber: $("#roomNumber").val(),
            lodgerId:$("#lodgerId").val(),
            waterMoney:$("#waterMoney").val(),
            electricMoney:$("#electricMoney").val(),
            checkoutDeposit:$("#checkoutDeposit").val(),
            hireMoney:$("#hireMoney").val(),
            checkoutMoey:$("#checkoutMoey").val(),
            waterStart:$("#waterStart").val(),
            electricStart:$("#electricStart").val(),
            payrentTimes:$("#payrentTimes").val()
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
