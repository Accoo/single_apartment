<%@ page import="com.gdou.model.Administrator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    Administrator administrator = (Administrator) request.getSession().getAttribute("login");
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="referrer" content="no-referrer"/>
    <title>单身公寓后台管理</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/layui.js"></script>
    <link rel="stylesheet" href="css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">单身公寓后台管理系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item showNotice" id="showNotice">
                <a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://img.jj20.com/up/allimg/tx26/052420203484.jpg" class="layui-nav-img">
                    <lable id="userName"></lable>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <a href="javascript:;" data-id="9" data-title="修改信息" data-url="getOneAdmin"
                       class="site-active" data-type="tabAdd">修改信息</a>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="logoutAction">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧垂直导航区域-->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="0" data-title="后台首页" data-url="test"
                       class="site-active" data-type="tabAdd">后台首页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">租房管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="1" data-title="添加房间" data-url="addRoom"
                               class="site-active" data-type="tabAdd">添加房间</a></dd>
                        <dd><a href="javascript:;" data-id="2" data-title="房间信息" data-url="roomList"
                               class="site-active" data-type="tabAdd">房间信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">支出管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="3" data-title="支出表单" data-url="expendOrder"
                               class="site-active" data-type="tabAdd">支出表单</a></dd>
                        <dd><a href="javascript:;" data-id="4" data-title="支出列表" data-url="expendList"
                               class="site-active" data-type="tabAdd">支出列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" id="appoint" data-id="5" data-title="预约管理" data-url="appointList"
                       class="site-active" data-type="tabAdd">预约管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" data-id="6" data-title="经营分析" data-url="getAnnual"
                       class="site-active" data-type="tabAdd">经营分析</a>
                </li>
                <li id="user" class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-id="7" data-title="注册用户" data-url="register"
                               class="site-active" data-type="tabAdd">注册用户</a></dd>
                        <dd><a href="javascript:;" data-id="8" data-title="用户列表" data-url="adminList"
                               class="site-active" data-type="tabAdd">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" id="imitate" data-id="10" data-title="模拟预约" data-url="imitateAppoint"
                       class="site-active" data-type="tabAdd">模拟预约</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" id="editAdmin" data-id="9" data-title="修改信息" data-url="getOneAdmin"
                       class="site-active" data-type="tabAdd">修改信息</a>
                </li>
            </ul>
        </div>
    </div>

    <!--tab标签-->
    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
        <ul class="layui-tab-title top_tab">
            <li class="layui-this" lay-id="0">后台首页</li>
        </ul>
        <div class="layui-tab-content clildFrame">
            <div class="layui-tab-item layui-show">
                <iframe data-frameid="0" scrolling="auto" frameborder="0" src="test" style="width:100%;height:100%;"></iframe>'
            </div>
        </div>
    </div>

<%--    <div class="layui-footer">--%>
<%--        <!-- 底部固定区域 -->--%>
<%--        © 单身公寓 - 单身的最好选择--%>
<%--    </div>--%>
</div>
<script>
    //    获取管理员账号
    $(function(){
        var admin = '<%=administrator.getAdminName()%>';
        var role = '<%=administrator.getAdminRole()%>';
        $("#userName").html(admin);    // 改变内容

        if (role == 1){
            $("#user").hide();
            $("#appoint").hide();
            $("#imitate").hide();
        }
    });

    layui.use(['element', 'jquery','layer'], function () {
        var element = layui.element;
        var layer = layui.layer;
        var adminName = '<%=administrator.getAdminName()%>';
        var adminAccount = '<%=administrator.getAdminAccount()%>';
        var $ = layui.$;

        //公告层
        function showNotice(){
            layer.open({
                type: 2
                ,title: '欠租警告'
                ,area: ['500px', '430px']
                ,shade: 0.8
                ,id: 'notice' //设定一个id，防止重复弹出
                ,btn: ['关闭']
                ,btnAlign: 'c'
                ,moveType: 1 //拖拽模式，0或者1
                ,content: 'rentOwed'
                ,success: function(layero){
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    btn.on("click",function(){
                        window.sessionStorage.setItem("showNotice","true");
                    });
                    if($(window).width() > 432){  //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
                        btn.on("click",function(){
                            layer.tips('公告躲在了这里', '#showNotice', {
                                tips: 3
                            });
                        })
                    }
                }
            });
        }
        $(".showNotice").on("click",function(){
            showNotice();
        });

        // 0.5秒后模拟点击，实现自动触发公告
        setTimeout(function() {
            var e = document.createEvent("MouseEvents");
            e.initEvent("click", true, true);
            document.getElementById("showNotice").dispatchEvent(e);
        }, 500);

        // 配置tab实践在下面无法获取到菜单元素
        $('.site-active').on('click', function () {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否已经存在
                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                });
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '?adminName=' + encodeURI(encodeURI(adminName)) + '&adminAccount='+adminAccount+'" style="width:100%;height:100%;"></iframe>',
                    id: id //规定好的id
                });
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };

        function FrameWH() {
            var h = $(window).height();
            $("iframe").css("height",h+"px");
        }
    });
</script>
</body>
</html>
