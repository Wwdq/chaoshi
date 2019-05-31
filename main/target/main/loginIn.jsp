<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/4/16
  Time: 20:59
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
    <script src="js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="js/jquery.reveal.js" type="text/javascript"></script>
    <script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="js/common_js.js" type="text/javascript"></script>
    <script src="js/footer.js" type="text/javascript"></script>
    <script src="layer/layer.js"  type="text/javascript"></script>
    <title>用户注册</title>
</head>

<body>
<div class="Reg_log_style">
    <div class="logo"><a href="Home.html"><img src="images/logo1.png" /></a></div>
    <div class="regist_style">

        <form id="myform" class="sign_area" autocomplete="off">
            <div class="title_name"><span>注册</span></div>
            <div class="regist_m_1">
                <div class="add_regist">
                    <ul>
                        <li class="frame_style"><label class="user_icon"></label><input name="" type="text"  id="username"  name="username" /> <i></i></li>
                        <span style="color:#F00" id="usernamespan"></span>
                        <li class="frame_style"><label class="password_icon"></label><input name="tbPassword" type="password"   id="password" name="password"  class="ywz_zhuce_kuangwenzi1 text_Password"/><i class="tx_password"></i></li>
                        <div class="ywz_zhuce_xiaoxiaobao">
                            <div class="ywz_zhuce_huixian" id="pwdLevel_1">弱 </div>
                            <div class="ywz_zhuce_huixian" id="pwdLevel_2">中 </div>
                            <div class="ywz_zhuce_huixian" id="pwdLevel_3">强 </div>
                        </div>
                        <li class="frame_style"><label class="password_icon"></label><input name="password-check" type="password"   name="password1"  id="password-check" placeholder="确认密码"  /></li>
                          <span id="passwordspan"   style="color:#F00"></span>
                    </ul>
                    <div class="auto_login clearfix">
                        <p class="clearfix">

                            <input id="autoLoginCheck" type="hidden">
                            <span id="agreement_tips" class="auto_tips" style=""></span>
                        </p>

                    </div>
                    <div class="center clearfix" ><a class="btn_pink" id="loginNow" href="javascript:void(0)">立即注册</a></div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="btmbg">
    <div class="btm">
        <p align="center">Copyright ©2019 All Rights Reserved.</p>

    </div>
</div>
<script>
    $("#username").blur(function(){
        var username=$("#username").val();
        if(username!=null){
            $.ajax({
                type: "POST",
                url: "hasUser",
                data: {
                    "username": username
                },
                success: function (result) {
                    if(result.result){
                        $("#usernamespan").html("");

                    }else
                        $("#usernamespan").html("用户名已经存在")
                }
            })
        }

        })
    $("#loginNow").click(function () {
        var usernamespan=$("#usernamespan").html();
        if(usernamespan!=""){
            layer.msg("用户名存在 请重新输入", {time:1000, icon:5, shift:6}, function () {
            });
            return;
        }
        var  passwordspan=$("#passwordspan").html();
        if(passwordspan!=""){
            layer.msg("两次密码不匹配  请检查", {time:1000, icon:5, shift:6}, function () {
            });
            return;
        }
        var username=$("#username").val();
        var password=$("#password").val();
        if(password==""){
            layer.msg("密码不能为空！", {time:1000, icon:5, shift:6}, function () {
            });
            return;
        }
        $.ajax({
            type: "POST",
            url: "loginNow",
            data: {
                "username": username,
                "password": password
            },
            success:function(result){
                window.location.href = "index.jsp";
            }
        })

    })
    $("#password-check").blur(function(){
          var password=$("#password").val();
          var password1=$("#password-check").val();
          if(password!=password1)
              $("#passwordspan").html("两次密码不同 请重新输入");
           else
              $("#passwordspan").html("");
    })



</script>
</body>
</html>
