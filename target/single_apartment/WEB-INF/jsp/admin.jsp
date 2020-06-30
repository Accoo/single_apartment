<%@ page import="com.gdou.model.Administrator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    Administrator administrator = (Administrator) request.getSession().getAttribute("getAdmin");
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

<blockquote class="layui-elem-quote">
    <h2>修改用户信息</h2>
</blockquote>

<form class="layui-form" action="" lay-filter="example">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" id="adminAccount" name="adminAccount" disabled="disabled"  lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" id="adminPassword" name="adminPassword" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" id="adminSex1" name="adminSex" value="男" title="男" checked="">
            <input type="radio" id="adminSex2" name="adminSex" value="女" title="女">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">真实姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="adminName" name="adminName" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证</label>
            <div class="layui-input-inline">
                <input type="text" id="adminId" name="adminId" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-inline">
                <input type="tel" id="adminPhone" name="adminPhone" lay-verify="required|phone"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-inline">
            <select id="adminRole" name="adminRole" lay-filter="juese">
                <option value=""></option>
                <option value="1" selected="">普通管理员</option>
                <option value="2">超级管理员</option>
            </select>
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
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="editAdmin">确认修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    //   获取账户信息
    $(function(){
        var adminAccount = '<%=administrator.getAdminAccount()%>';
        var adminName = '<%=administrator.getAdminName()%>';
        var adminPassword = '<%=administrator.getAdminPassword()%>';
        var adminSex = '<%=administrator.getAdminSex()%>';
        var adminRole = '<%=administrator.getAdminRole()%>';
        var adminId = '<%=administrator.getAdminId()%>';
        var adminPhone = '<%=administrator.getAdminPhone()%>';
        var remark = '<%=administrator.getRemark()%>';
        // 改变内容
        $("#adminAccount").attr("value",adminAccount);
        $("#adminName").attr("value",adminName);
        $("#adminPassword").attr("value",adminPassword);
        if(adminSex == "女"){
            $("#adminSex1").removeAttr("checked");
            $("#adminSex2").attr("checked","checked");
        }
        $("#adminRole option[value='"+ adminRole+"']").attr("selected",true);
        $("#adminId").attr("value",adminId);
        $("#adminPhone").attr("value",adminPhone);
        $("#remark").attr("value",remark);
    });

    layui.use(['form', 'layedit', 'layer'], function() {
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit;

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(editAdmin)', function (data) {
            $.ajax({
                //提交数据的类型 POST GET
                type: "GET",
                //提交的网址
                url: "editAdmin",
                data: data.field,
                //返回数据的格式
                datatype: JSON,
                //请求方式不采用异步
                async: false,
                //成功返回之后调用的函数
                success: function (res) {
                    if (res == 1) {
                        layer.alert("修改成功");
                    } else {
                        layer.alert("修改失败！请检查修改内容格式");
                    }
                },
                //调用出错执行的函数
                error: function () {
                    layer.alert("操作失败")
                }
            })
            return false;
        });

        $(document).on('click',"#back",function(){
            window.location = "adminList";
        });
    });
</script>
</body>
</html>
