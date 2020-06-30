<%@ page import="com.gdou.model.Expenditure" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    Expenditure expenditure = (Expenditure) request.getSession().getAttribute("expenditure");
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
                <label class="layui-form-label">支出单号</label>
                <div class="layui-input-inline">
                    <input type="text" id="expNum" name="expNum" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">房间号</label>
                <div class="layui-input-inline">
                    <input type="text" id="roomNumber" name="roomNumber" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">支出类型</label>
                <div class="layui-input-inline">
                    <input type="text" id="expendType" name="expendType" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">材料费用/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="materialCharge" name="materialCharge" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">人工费用/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="employeeCharge" name="employeeCharge" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">总费用/元</label>
                <div class="layui-input-inline">
                    <input type="text" id="totalCharge" name="totalCharge" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">支出时间</label>
                <div class="layui-input-inline">
                    <input type="text" id="payDate" name="payDate" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">经办人</label>
                <div class="layui-input-inline">
                    <input type="text" id="operator" name="operator" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">支出内容</label>
                <div class="layui-input-inline">
                    <input type="textarea" id="expendContent" name="expendContent"  disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input" />
                </div>
            </div>
        </div>
    </div>
</form>

<script>

    function toDate(date) {
        var time = new Date(date).toJSON();
        return new Date(+new Date(time) + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '')
    }
    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;
        //   获取账户信息
        $(function(){
            var expNum = '<%=expenditure.getExpNum()%>';
            var roomNumber = '<%=expenditure.getRoom().getRoomNumber()%>';
            var expendType = '<%=expenditure.getExpendType()%>';
            var materialCharge = '<%=expenditure.getMaterialCharge()%>';
            var employeeCharge = '<%=expenditure.getEmployeeCharge()%>';
            var totalCharge = '<%=expenditure.getTotalCharge()%>';
            var payDate = '<%=expenditure.getPayDate()%>';
            var operator = '<%=expenditure.getOperator()%>';
            var expendContent = '<%=expenditure.getExpendContent()%>';
            // 改变内容
            $("#roomNumber").attr("value",roomNumber);
            $("#expNum").attr("value",expNum);
            $("#expendType").attr("value",expendType);
            $("#materialCharge").attr("value",materialCharge+" 元");
            $("#employeeCharge").attr("value",employeeCharge+" 元");
            $("#totalCharge").attr("value",totalCharge+" 元");
            $("#payDate").attr("value",toDate(payDate));
            $("#operator").attr("value",operator);
            $("#expendContent").attr("value",expendContent);
        });
    });
</script>
</body>
</html>
