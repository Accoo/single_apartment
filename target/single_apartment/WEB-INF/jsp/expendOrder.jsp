<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/layui.css"  media="all">
</head>
<body>

<blockquote class="layui-elem-quote">
    <h2>支出表单填写</h2>
</blockquote>

<form class="layui-form" action="" lay-filter="example">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">房间号</label>
            <div class="layui-input-inline">
                <input type="text" name="roomNumber"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">支出类型</label>
            <div class="layui-input-inline">
                <select id="expendType" name="expendType" lay-filter="leiixing">
                    <option value=""></option>
                    <option value="装修" selected="">装修</option>
                    <option value="维修">维修</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">材料费用/元</label>
            <div class="layui-input-inline">
                <input type="text" name="materialCharge"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">人工费用/元</label>
            <div class="layui-input-inline">
                <input type="text" name="employeeCharge"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">支出内容</label>
        <div class="layui-input-inline" style="width:500px">
            <textarea id="expendContent" name="expendContent" lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="addOrder">确认提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
    <input type="hidden" id="adminName" name="adminName"  lay-verify="required" autocomplete="off" class="layui-input">
</form>

<script src="js/layui.js" charset="utf-8"></script>
<script>
    //获取上一页面传入参数
    function getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }
    // 调用参数
    var adminName = getQueryString("adminName");
    $("#adminName").attr("value",adminName);

    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form;

        //监听提交
        form.on('submit(addOrder)', function (data) {
            $.ajax({
                type: "GET",    //提交数据的类型 POST GET
                url: "addOrder",  //提交的网址
                data: data.field,   //返回数据的格式
                datatype: JSON,
                success: function (res) {   //成功返回之后调用的函数
                    if (res == 1) {
                        layer.confirm("提交成功",function () {
                            setTimeout('window.location.reload()',500);//刷新当前页面
                        })
                    } else {
                        layer.alert("房间不存在！请重新填写")
                    }
                },
                error: function () {    //调用出错执行的函数
                    layer.alert("操作失败")
                }
            });
            return false;
        })
    });
</script>
</body>
</html>