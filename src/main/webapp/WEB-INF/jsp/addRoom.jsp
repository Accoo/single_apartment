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
    <h2>添加房间</h2>
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
                <select id="roomDeposit" name="roomDeposit" lay-filter="yajin">
                    <option value=""></option>
                    <option value="80" selected="">80 元</option>
                    <option value="120">120 元</option>
                    <option value="200">200 元</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">租金</label>
            <div class="layui-input-inline">
                <select id="roomRent" name="roomRent" lay-filter="zujin">
                    <option value=""></option>
                    <option value="1500" selected="">1500 元/月</option>
                    <option value="2000">2000 元/月</option>
                    <option value="2800">2800 元/月</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">水表起始数</label>
            <div class="layui-input-inline">
                <input type="text" name="waterStart"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电表起始数</label>
            <div class="layui-input-inline">
                <input type="text" name="electricStart"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="add">确认添加</button>
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
        var form = layui.form,
            layedit = layui.layedit;

        //自定义验证规则
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {
            $.ajax({
                type: "GET",    //提交数据的类型 POST GET
                url: "addRoomAction",  //提交的网址
                data: data.field,   //返回数据的格式
                datatype: JSON,
                success: function (res) {   //成功返回之后调用的函数
                    if (res == 1) {
                        layer.confirm("添加成功",function () {
                            setTimeout('window.location.reload()',500);//刷新当前页面
                        })
                    } else {
                        layer.alert("房间名已存在！请重新添加")
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