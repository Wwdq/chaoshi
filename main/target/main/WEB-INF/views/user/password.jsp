<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/22
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${APP_PATH}/css/common.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/fonts/iconfont.css"  rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/css/style.css" rel="stylesheet" type="text/css" />
    <script src="${APP_PATH}/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/common_js.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/footer.js" type="text/javascript"></script>
    <script src="${APP_PATH}/layer/layer.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/my.js" type="text/javascript"></script>
    <title>修改密码</title>
</head>

<body>
<!--顶部样式-->
<div id="header_top">
    <div id="top">
        <div class="Inside_pages">
            <div class="Collection">下午好，欢迎光临生鲜网！<em></em><a href="#">收藏我们</a></div>
            <div class="hd_top_manu clearfix">
                <ul class="clearfix">
                    <ul class="clearfix">
                        <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<c:if test="${empty user}"><a href="login.jsp" class="red"> [请登录]</c:if>
                            <c:if test="${not empty user}">${user.name}</c:if></a>  <c:if test="${empty user}"> <a href="loginIn.jsp" class="red">[免费注册]</a></li></c:if>
                        <c:if test="${not empty user}"> <a href="${APP_PATH}/loginOut" class="red">[退出]</a></li></c:if>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="${APP_PATH}/order/userOrder">我的订单</a></li>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="${APP_PATH}/cart/main">购物车</a> </li>
                        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="${APP_PATH}/user/msg">我的信息</a></li>

                        </li>
                    <!--
                           <li class="hd_menu_tit phone_c" data-addclass="hd_menu_hover"><a href="#" class="hd_menu "><em class="iconfont icon-shouji"></em>手机版</a>
                            <div class="hd_menu_list erweima">
                               <ul>
                                <img src="images/erweima.png"  width="100px" height="100"/>
                               </ul>
                            </div>
                           </li>
                    -->
                </ul>
            </div>
        </div>
    </div>
    <!--顶部样式1-->
    <div id="header"  class="header page_style">
        <div class="logo"><a href="Home.html"><img src="${APP_PATH}/images/logo1.png" alt="生鲜网" /></a></div>
        <!--结束图层-->
        <div class="Search">
            <p><input id="key" name="" type="text"  class="text"/><input  id="find" name="" type="submit" value="搜 索"  class="Search_btn"/></p>
        </div>
        <!--购物车样式-->

    </div>
    <!--菜单导航样式-->
    <div id="Menu" class="clearfix">
        <div class="index_style clearfix">
            <div id="allSortOuterbox" class="display">
                <div class="t_menu_img"></div>
                <!--菜单-->
                <div class="Navigation" id="Navigation">
                    <ul class="Navigation_name">
                        <li><a href="${APP_PATH}/index.jsp">首页</a></li>
                        <li><a href="${APP_PATH}/goods/index?type=0">全部产品</a></li>
                        <li><a href="${APP_PATH}/goods/index?type=1">进口产品</a></li>
                        <li><a href="${APP_PATH}/goods/index?type=2">水果</a></li>
                        <li><a href="${APP_PATH}/goods/index?type=3">蔬菜</a></li>
                        <li><a href="${APP_PATH}/goods/index?type=4">海鲜</a></li>
                        <li><a href="${APP_PATH}/goods/index?type=5">家禽</a></li>
                        <li><a href="${APP_PATH}/goods/index?flag=1">限时特价</a><em class="hot_icon"></em></li>
                    </ul>
                </div>
                <script>$("#Navigation").slide({titCell:".Navigation_name li"});</script>
                <!-- <a href="#" class="link_bg"><img src="images/link_bg_03.png" /></a>-->
            </div>
        </div>
    </div>
<!--修改密码-->
<div class="user_style clearfix">
    <div class="user_center">
        <!--左侧菜单栏-->
        <div class="left_style">
            <div class="menu_style">
                <div class="user_title">密码修改</div>
                <div class="user_Head">
                    <div class="user_portrait">
                        <a    class="btn_link"></a> <img src="${APP_PATH}/images/people.png">
                        <div class="background_img"></div>
                    </div>

                </div>
                <div class="sideMen">
                    <!--菜单列表图层-->
                    <dl class="accountSideOption1">
                        <dt class="transaction_manage"><em class="icon_2"></em>用户中心</dt>
                        <dd>
                            <ul>
                                <li> <a  onclick="goMsg()"> 用户信息</a></li>
                                <li> <a  onclick="goPassword()"> 密码修改</a></li>
                                <li> <a  onclick="goAddr()"> 地址信息</a></li>

                            </ul>
                        </dd>
                    </dl>
                </div>
                <script>jQuery(".sideMen").slide({titCell:"dt", targetCell:"dd",trigger:"click",defaultIndex:0,effect:"slideDown",delayTime:300,returnDefault:true});</script>
            </div>
        </div>
        <!--右侧样式-->
        <div class="right_style">
            <div class="info_content">
                <!--修改密码样式-->
                <div class="change_Password">
                    <div class="title_Section"><span>修改密码</span></div>
                    <ul class="p_modify">
                        <div class="Note">暂只支持原密码修改，不支持邮箱电话验证密码修改</div>
                        <li><label>原密码</label><input id="passwordNow" name="" type="Password"  class="text_Password"/><span style="color: red;" id="checkSpan1"></span></li>
                        <li class="new_password">
                            <label>新密码</label>

                                <div class="ywz_zhuce_kuangzi"><input id="password1" name="tbPassword" type="password"  class="ywz_zhuce_kuangwenzi1 text_Password"></div>



                        </li>
                        <li><label>确认密码</label><input id="password2" name="" type="Password"  class="text_Password"/><span style="color: red;" id="checkSpan2"></span></li>
                        <li><input id="updatePassword" name="submit" type="submit" class="bnt_blue_1" style="border:none;" value="确认修改"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="slogen">
    <div class="index_style">

    </div>
</div>
<!--底部图层-->

<div class="footerbox clearfix">


</div>
<!--右侧菜单栏购物车样式-->

    <script>
        function goAddr() {
            window.location.href="${APP_PATH}/user/addr"
        }
        function goPassword() {
            window.location.href="${APP_PATH}/user/password"
        }
        function goMsg(){
            window.location.href = "${APP_PATH}/user/msg";
        }

        $("#find").click(function () {
            var key=$("#key").val();

            window.location.href="${APP_PATH}/goods/find?key="+key;
        })
        $("#passwordNow").blur(function () {
            var password=$("#passwordNow").val();
            $.ajax({
                url: "${APP_PATH}/user/checkPassword",
                type:"POST",
                data:{"password": password},
                success:function (result) {
                    $("#checkSpan1").html("");
                    if(result.result){
                        return;
                    }else{
                        $("#checkSpan1").html("当前密码不正确 请检查");
                    }

                }
            })
        })
        $("#password2").blur(function () {
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            if(password1!=password2){
                $("#checkSpan2").html("两次密码不一样 请检查")
            }else{
                $("#checkSpan2").html("");
            }
        })
        $("#updatePassword").click(function () {
            var checkspan1=$("#checkSpan1").html();
            if(checkspan1!=""){
                layer.msg("原密码错误 请重新输入", {time:1000, icon:5, shift:6}, function () {
                });
                return;
            }
            var  checkspan2=$("#checkSpan2").html();
            if(checkspan2!=""){
                layer.msg("两次密码不匹配  请检查", {time:1000, icon:5, shift:6}, function () {
                });
                return;
            }
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            var password = $("#passwordNow").val();

            if(password2!=password1){
                layer.msg("两次密码不匹配  请检查", {time:1000, icon:5, shift:6}, function () {
                });
                return;
            }
            if(password1==""){
                layer.msg("修改的密码不能为空！", {time:1000, icon:5, shift:6}, function () {
                });
                return;

            }
            if(password1==""){
                layer.msg("请输入原密码", {time:1000, icon:5, shift:6}, function () {
                });
                return;

            }
            $.ajax({
                url:"${APP_PATH}/user/updatePassword",
                type:"POST",
                data:{"password":password1},
                success:function (result) {
                    if(result.result){
                        layer.msg("修改密码成功 请重新登录", {time:2000, icon:4, shift:6}, function () {
                            window.location.href = "${APP_PATH}/login.jsp";
                        });
                    }

                }
            })


                    })
    </script>
</body>
</html>

