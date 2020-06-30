<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>后台登录</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/Adminlogin.css">
</head>
<body>

<div class="login">
    <div class="message">单身公寓-用户登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post">
        <input name="action" value="login" type="hidden">
        <input id="account" name="account" placeholder="用户名" required="" type="text">
        <hr class="hr15">
        <input id="password" name="password" placeholder="密码" required="" type="password">
        <hr class="hr15">
        <input value="登录" style="width:100%;" onclick="checkAccount()" type="button">
        <hr class="hr20">
        <!-- 帮助 <a onClick="alert('请联系管理员')">忘记密码</a> -->
    </form>
</div>
</body>
<script type="text/javascript">
    function checkAccount() {
        $.ajax({
            //提交数据的类型 POST GET
            type: "GET",
            //提交的网址
            url: "loginAction",
            //提交的数据
            data: {account: $("#account").val(), password: $("#password").val()},
            //返回数据的格式
            datatype: JSON,
            //请求方式不采用异步
            async: false,
            //成功返回之后调用的函数
            success: function (administrator) {
                if (administrator != null && administrator != "") {
                    window.location = "index";
                } else {
                    alert("登陆失败，账号或者密码错误!")
                }
            },
            //调用出错执行的函数
            error: function () {
                alert("登录失败")
            }
        })
    }
</script>
</html>
