<%@ page import="com.gdou.model.RoomCheckin" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    RoomCheckin checkin = (RoomCheckin) request.getSession().getAttribute("checkin");
    String checkoutType = (String) request.getSession().getAttribute("checkoutType");
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
                <label class="layui-form-label">水表/吨</label>
                <div class="layui-input-inline">
                    <input type="text" id="waterNow" name="waterNow"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">每吨水/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="perWater" name="perWater"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">电表/度</label>
                <div class="layui-input-inline">
                    <input type="text" id="electricNow" name="electricNow"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">电度电/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="perElectric" name="perElectric"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" id="payTimes">
            <div class="layui-inline">
                <label class="layui-form-label">交租/付</label>
                <div class="layui-input-inline">
                    <input type="text" id="payrentTimes" name="payrentTimes" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </div>
    <input  type="hidden" id="roomNumber" name="roomNumber"  lay-verify="required" autocomplete="off" class="layui-input">
    <input  type="hidden" id="checkoutType" name="checkoutType"   lay-verify="required" autocomplete="off" class="layui-input">
</form>

<script>
    //   获取账户信息
    $(function(){
        var roomNumber = '<%=checkin.getRoom().getRoomNumber()%>';
        var checkoutType = '<%=checkoutType%>';
        // 改变内容
        $("#roomNumber").attr("value",roomNumber);
        $("#checkoutType").attr("value",checkoutType);

        if (checkoutType == 1) {
            document.getElementById("payTimes").style.display='none';
        }
    });

    var callbackdata = function () {
        var data = {
            roomNumber: $("#roomNumber").val(),
            waterNow:$("#waterNow").val(),
            perWater:$("#perWater").val(),
            electricNow:$("#electricNow").val(),
            perElectric:$("#perElectric").val(),
            checkoutType:$("#checkoutType").val(),
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

