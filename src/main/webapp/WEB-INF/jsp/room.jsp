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

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-inline">
                <input type="text" id="roomNumber" name="roomNumber"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房间类型</label>
            <div class="layui-input-inline">
                <select id="typeId" name="typeId" lay-filter="leiixing">
                    <option value=""></option>
                    <option value="1" selected="">独立单间</option>
                    <option value="2">一房一厅</option>
                    <option value="3">两房一厅</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间面积</label>
            <div class="layui-input-inline">
                <select id="roomArea" name="roomArea" lay-filter="minaji">
                    <option value=""></option>
                    <option value="72" selected="">9×8 ㎡</option>
                    <option value="100">10×10 ㎡</option>
                    <option value="144">12×12 ㎡</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间楼层</label>
            <div class="layui-input-inline">
                <select id="roomFloor" name="roomFloor" lay-filter="minaji">
                    <option value=""></option>
                    <option value="1楼" selected="">1 楼</option>
                    <option value="2楼">2 楼</option>
                    <option value="3楼">3 楼</option>
                    <option value="4楼">4 楼</option>
                    <option value="5楼">5 楼</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
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
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">水表起始数</label>
            <div class="layui-input-inline">
                <input type="text" id="waterStart" name="waterStart"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电表起始数</label>
            <div class="layui-input-inline">
                <input type="text" id="electricStart" name="electricStart"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea id="remark" name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <input  type="hidden" id="roomStatus" name="roomStatus"  lay-verify="required" autocomplete="off" class="layui-input">
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
        $("#typeId option[value='"+ typeId+"']").attr("selected",true);
        $("#roomArea option[value='"+ roomArea+"']").attr("selected",true);
        $("#roomFloor option[value='"+ roomFloor+"']").attr("selected",true);
        $("#roomDeposit").attr("value",roomDeposit+" 元");
        $("#roomRent").attr("value",roomRent+" 元");
        $("#waterStart").attr("value",waterStart);
        $("#electricStart").attr("value",electricStart);
        $("#remark").attr("value",remark);
        $("#roomStatus").attr("value",roomStatus);
    });

    var callbackdata = function () {
        var data = {
            roomNumber: $("#roomNumber").val(),
            typeId:$("#typeId").val(),
            roomArea:$("#roomArea").val(),
            roomFloor: $("#roomFloor").val(),
            roomDeposit: $("#roomDeposit").val(),
            roomRent: $("#roomRent").val(),
            waterStart: $("#waterStart").val(),
            electricStart: $("#electricStart").val(),
            remark: $("#remark").val(),
            roomStatus:$("#roomStatus").val()
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
