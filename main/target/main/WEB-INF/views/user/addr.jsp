<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/22
  Time: 16:24
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
    <link href="${APP_PATH}/css/sumoselect.css" rel="stylesheet"  type="text/css"/>
    <link href="${APP_PATH}/css/purebox-metro.css" rel="stylesheet" id="skin">
    <script src="${APP_PATH}/js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.sumoselect.js"></script>
    <script src="${APP_PATH}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/common_js.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/footer.js" type="text/javascript"></script>
    <script src="${APP_PATH}/layer/layer.js" type="text/javascript"></script>
    <title>收货地址管理</title>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3 });
        window.test = $('.testsel').SumoSelect({okCancelInMulti:true });
    });
</script>
<!--[if IE]>

<![endif]-->
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
    <!--顶部样式1-->
    <div id="header"  class="header page_style">
        <div class="logo"><a href="Home.html"><img src="${APP_PATH}/images/logo1.png" alt="生鲜网" /></a></div>
        <!--结束图层-->
        <div class="Search">
            <p><input id="key" name="" type="text"  class="text"/><input  id="find" name="" type="submit" value="搜 索"  class="Search_btn"/></p>
        </div>


    </div>
    <!--菜单导航样式-->
    <div id="Menu" class="clearfix">
        <div class="index_style clearfix">
            <div id="allSortOuterbox" class="display">
                <div class="t_menu_img"></div>

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
            </div>

        </div>
    </div>
</div>
<!--用户中心样式-->
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
                <!--地址管理样式-->
                <div class="adderss_style">
                    <div class="title_Section"><span>收货地址管理</span></div>
                    <c:forEach items="${addrList}" var="now">
                    <div class="adderss_list">
                        <!--地址列表-->
                        <div class="Address_List clearfix">
                            <!--地址类表-->
                            <ul class="Address_info">
                                <div class="address_title">
                                <a href="${APP_PATH}/user/updateAddr?id=${now.id}" class="modify iconfont icon-fankui btn btn-primary" title="修改信息" data-toggle="modal" id="purebox"></a>
                                地址信息
                                <a onclick="doDelete(${now.id})" style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除</a>
                                </div>
                                <li>姓名：${now.name}</li>
                                <li>详细地址：${now.addr}</li>
                                <li>手机号：${now.phone}</li>
                                <li>邮编：${now.zip}</li>

                            </ul>

                        </div>
                    </div>
                    </c:forEach>
                    <form>
                        <div class="Add_Addresss">
                            <div class="title_name"><i></i>添加地址</div>
                            <table>
                                <tbody>
                                <tr>
                                    <td class="label_name">新的地址：</td><td> </td>

                                </tr>
                                <tr><td class="label_name">详细地址</td><td><input id="addr" name="" type="text" class="Add-text"><i>（必填）</i></td>

                                <tr>
                                    <td class="label_name">收件人姓名</td><td><input id="name" name="" type="text" class="Add-text"><i>（必填）</i></td>

                                </tr>
                                <tr>
                                    <td class="label_name">邮&nbsp;&nbsp;编</td><td><input id="zip" name="" type="text" class="Add-text"><i>（选填）</i></td>

                                </tr>
                                <tr>
                                    <td class="label_name">电话或者手机</td><td><input id="phone" name="" type="text" class="Add-text"><i>（必填）</i></td></tr>
                                <tr><td class="label_name"></td><td></td><td class="label_name"></td><td></td>
                                </tr>
                                </tbody></table>
                            <div class="address_Note"><span>注：</span>只能添加5个收货地址信息。请乎用假名填写地址，如造成损失由收货人自己承担。</div>
                            <div class="btn"><input name="1" onclick="doInsert()" value="添加地址" class="Add_btn"></div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="slogen">

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
    function doDelete(id) {
        layer.confirm("确认删除地址么？",  {icon: 3, title:'提示'}, function(cindex){
            layer.close(cindex);
            $.ajax({
                url:"${APP_PATH}/user/deleteAddr?id="+id,
                type:"GET",
                success:function (result) {
                    if(result.result){
                        layer.msg("删除成功！！", {time:2000, icon:4, shift:6}, function () {
                            window.location.href = "${APP_PATH}/user/addr";
                        });
                    }

                }
            })

        }, function(cindex){
            layer.close(cindex);
        });
    }
    function  doInsert() {
        var name = $("#name").val();
        var phone = $("#phone").val();
        var zip = $("#zip").val();
        var addr = $("#addr").val();
        if(phone==""){
            layer.msg("手机号不能为空！！", {time:1000, icon:5, shift:6}, function () {

            });
            return;
        }
        if(name==""){
            layer.msg("名字不能为空！！", {time:1000, icon:5, shift:6}, function () {

            });
            return;
        }
        if(addr==""){
            layer.msg("地址不能为空！！", {time:1000, icon:5, shift:6}, function () {

            });
            return;
        }
        $.ajax({url:"${APP_PATH}/user/insertAddr",
                type:"POST",
               data:{
                "phone":phone,
                   "addr":addr,
                   "name":name,
                   "zip": zip
               },
               success:function (result) {
            if(result.result){
                layer.msg("添加成功！！", {time:2000, icon:4, shift:6}, function () {
                    window.location.href = "${APP_PATH}/user/addr";
                });
            }

               }
                })


    }
</script>
</body>
</html>

