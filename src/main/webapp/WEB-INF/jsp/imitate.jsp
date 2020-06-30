<%@ page import="com.gdou.model.Room" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    Room room = (Room) request.getSession().getAttribute("room");
    String adminName = (String) request.getSession().getAttribute("adminName");
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
    <legend>预约房间</legend>
</fieldset>
<form class="layui-form" action="" lay-filter="example">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-inline">
                <input type="text" id="roomNumber" disabled="disabled" name="roomNumber" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房间类型</label>
            <div class="layui-input-inline">
                <input type="text" id="typeId" name="typeId" disabled="disabled" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间面积</label>
            <div class="layui-input-inline">
                <input type="text" id="roomArea" name="roomArea" disabled="disabled"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">房间楼层</label>
            <div class="layui-input-inline">
                <input type="text" id="roomFloor" name="roomFloor" disabled="disabled" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房客姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="roomerName" name="roomerName"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="radio" id="adminSex1" name="roomerSex" value="男" title="男" checked="">
                <input type="radio" id="adminSex2" name="roomerSex" value="女" title="女">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">身份证</label>
            <div class="layui-input-inline">
                <input type="text" id="roomerId" name="roomerId"   lay-verify="identity"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-inline">
                <input type="text" id="mobilephone" name="mobilephone"  lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">租用类型</label>
            <div class="layui-input-inline">
                <select id="paymentType" name="paymentType" lay-filter="leixing">
                    <option value="" selected=""></option>
                    <option value="1">每月一付</option>
                    <option value="6">半年一付</option>
                    <option value="12">一年一付</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">租用时长</label>
            <div class="layui-input-inline">
                <select id="checkinLength" name="checkinLength" lay-filter="juese">
                    <option value="" selected=""></option>
                    <option value="1">一个月</option>
                    <option value="6">半年</option>
                    <option value="12">一年</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">押金</label>
            <div class="layui-input-inline">
                <input type="text" id="roomDeposit" name="roomDeposit" disabled="disabled"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">租金</label>
            <div class="layui-input-inline">
                <input type="text" id="roomRent" name="roomRent" disabled="disabled"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">水表起始数</label>
            <div class="layui-input-inline">
                <input type="text" id="waterStart" name="waterStart" disabled="disabled"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电表起始数</label>
            <div class="layui-input-inline">
                <input type="text" id="electricStart" disabled="disabled" name="electricStart" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea id="remark" name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn"id="back">返回</button>
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="appointSub">确认提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    <input type="hidden" id="adminName" name="adminName" autocomplete="off" class="layui-input">
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
        var adminName = '<%=adminName%>';
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
        $("#adminName").attr("value",adminName);
    });

    $(document).on('click',"#back",function(){
        window.location = "roomList";
    });

    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;

        //监听提交
        form.on('submit(appointSub)', function (data) {
            layer.confirm("是否确认进行预约房间？",function () {
                $.ajax({
                    type: "GET",
                    url: "appointAction", //提交的网址
                    data: data.field,
                    datatype: JSON, //返回数据的格式
                    success: function (res) {//成功返回之后调用的函数
                        if (res == 1) {
                            layer.confirm("预约成功！！！",function(){
                                window.location = "roomList";
                            });
                        } else {
                            layer.alert("预约失败！请检查内容格式");
                        }
                    },
                    //调用出错执行的函数
                    error: function () {
                        layer.alert("操作失败")
                    }
                })
            });
            return false;
        })
    });
</script>
</body>
</html>
