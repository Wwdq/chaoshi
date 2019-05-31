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
                        <li class="hd_menu_tit list_name" data-addclass="hd_menu_hover"><a href="#" class="hd_menu">客户服务</a>
                            <div class="hd_menu_list">
                                <ul>
                                    <li><a href="help.html">常见问题</a></li>
                                    <li><a href="#">在线退换货</a></li>
                                    <li><a href="#">在线投诉</a></li>
                                    <li><a href="#">配送范围</a></li>
                                </ul>
                            </div>
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
            <p class="Words"><a href="Product_Detailed.html">虾仁</a><a href="Product_Detailed.html">三文鱼</a><a href="Product_Detailed.html">菠萝</a><a href="Product_Detailed.html">西红柿</a><a href="Product_Detailed.html">橙子</a><a href="Product_Detailed.html">苹果</a></p>
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
                    <div class="user_title">用户中心</div>
                    <div class="user_Head">
                        <div class="user_portrait">
                            <a href="User.html" title="修改头像" class="btn_link"></a> <img src="${APP_PATH}/images/people.png">
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
                        <div class="title_Section"><span>修改地址</span></div>
                        <ul class="p_modify">
                            <form href="${APP_PATH}/user/doUpdate" method="get">
                            <li><label>修改信息：</label></li>
                            <li><label>手机号</label><input   id="phone" name="phone" type="text"  value="${address.phone}" class="text_Password"/></li>
                            <li><label>姓名</label><input id="name" name="name" type="text"  value="${address.name}" class="text_Password"/></li>
                            <li><label>邮编</label><input  id="zip"  name="zip" type="text"  value="${address.zip}" class="text_Password"/></li>
                            <li><label>详细地址</label><input   id="addr" name="addr" type="text"  value="${address.addr}" class="text_Password"/></li>
                            <li><input onclick="updateAddr()" name="submit"  class="bnt_blue_1" style="border:none;" value="确认修改"></li>
                            <li><input  onclick="shuaxing(${param.id})" name="submit"   class="bnt_blue_1" style="border:none;" value="重置"></li>
                            </form>


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
        window.location.href="${APP_PATH}/user/msg"
    }
    function shuaxing(id) {
        window.location.href = "${APP_PATH}/user/updateAddr?id=" + id;

    }
    function updateAddr() {
        var name = $("#name").val();
        var phone = $("#phone").val();
        var addr = $("#addr").val();
        var zip = $("#zip").val();
        var id = "${address.id}";
        $.ajax({
            url:"${APP_PATH}/user/doUpdate",
            type:"POST",
            data: {
                "phone":phone,
                "name":name,
                "zip":zip,
                "id":id,
                "addr":addr
            },
            success:function (result) {
                if(result.result){
                    layer.msg("修改地址成功 正在跳回上一页！", {time:2000, icon:4, shift:6}, function () {
                        window.location.href = "${APP_PATH}/user/addr";
                    });
                }

            }


        })

    }
</script>
</body>
</html>

