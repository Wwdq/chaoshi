<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/4/16
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <link href="fonts/iconfont.css"  rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/Orders.css" rel="stylesheet" type="text/css" />
    <link href="css/purebox-metro.css" rel="stylesheet" id="skin">
    <script src="js/jquery-2.2.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.reveal.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="layer/layer.js"  type="text/javascript"></script>
    <title>用户登录</title>
</head>

<body>
<div class="Reg_log_style">
    <div class="logo"><a href="Home.html"><img src="images/logo1.png" /></a></div>
    <div class="login_style">
        <form id="myform" class="sign_area" autocomplete="off" href="login">
            <div class="title_name"><span>登录</span></div>
            <div class="login_m_1">
                <div class="add_login">
                    <ul>
                        <li class="frame_style"><label class="user_icon"></label><input name="username" type="text"  id="username"/><i></i></li>
                        <li class="frame_style"><label class="password_icon"></label><input name="password" type="password"   id="password"/><i></i></li>
                    </ul>


                    <div class="center clearfix" ><a href="javascript:void(0)" class="btn_pink"  id="btn_signin" onclick="doLogin()">立即登录</a></div>
                </div>
            </div>
        </form>
        <!--其他登录方式-->

    </div>
</div>
</div>
<div class="btmbg">
    <div class="btm">
        <p align="center">Copyright ©2019 All Rights Reserved.</p>

    </div>
</div>

<script>
    function doLogin() {
        var username = $("#username").val();
        if ( username == "" ) {
            layer.msg("用户名不能为空", {time:1000, icon:5, shift:6}, function () {
            });
            return;
        }

        var password = $("#password").val();
        if ( password == "" ) {
            layer.msg("密码不能为空", {time:1000, icon:5, shift:6}, function () {
            });
            return;
        }
        var loadingIndex=null;
        $.ajax({
            type : "POST",
            url  : "doLogin",
            data : {
                "username" : username,
                "password"  : password
            },
            beforeSend : function(){
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result) {
                layer.close(loadingIndex);
                if (result.result) {
                    window.location.href = "loginIn";
                } else {
                    layer.msg(result.msg, {time:1000, icon:5, shift:6}, function () {
                    });
                }
            }
        });
    }
</script>
</body>
</html>