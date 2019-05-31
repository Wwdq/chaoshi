<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/21
  Time: 20:58
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


    <title>用户订单</title>
</head>

<body>
<!--顶部样式-->
<div id="header_top">
    <div id="top">
        <div class="Inside_pages">
            <div class="Collection">下午好，欢迎光临生鲜网！<em></em><a href="#">收藏我们</a></div>
            <div class="hd_top_manu clearfix">
                <ul class="clearfix">
                    <li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<c:if test="${empty user}"><a href="${APP_PATH}/login.jsp" class="red"> [请登录]</c:if>
                        <c:if test="${not empty user}">${user.name}</c:if></a>  <c:if test="${empty user}"> <a href="${APP_PATH}/loginIn.jsp" class="red">[免费注册]</a></li></c:if>
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
            <p><input  id="key" name="" type="text"  class="text"/><input id="find" name="" type="submit" value="搜 索"  class="Search_btn"/></p>
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
<!--用户中心样式-->
<div class="user_style clearfix">
    <div class="user_center">
        <!--左侧菜单栏-->
        <div class="left_style">
            <div class="menu_style">
                <div class="user_title">订单中心</div>
                <div class="user_Head">
                    <div class="user_portrait">
                           <img src="${APP_PATH}/images/people.png">
                        <div class="background_img"></div>
                    </div>

                </div>
                <div class="sideMen">
                    <!--菜单列表图层-->
                    <dl class="accountSideOption1">
                        <dt class="transaction_manage"><em class="icon_1"></em>订单中心</dt>
                        <dd>
                            <ul>
                                <li> <a id="status0" href="${APP_PATH}/order/select?status=0"> 全部订单</a></li>
                                <li> <a id="status2" href="${APP_PATH}/order/select?status=2">待付款</a></li>
                                <li> <a id="status1" href="${APP_PATH}/order/select?status=1"> 待发货</a></li>
                                <li> <a id="status4" href="${APP_PATH}/order/select?status=4"> 待收货</a></li>
                                <li> <a id="status5" href="${APP_PATH}/order/select?status=5"> 已完成</a></li>

                            </ul>
                        </dd>
                    </dl>


                </div>

            </div>
        </div>
        <!--右侧样式-->
        <div class="right_style">
            <div class="info_content">
                <div class="title_Section"><span>订单管理</span></div>

                <div class="Order_form_list">
                    <table>
                        <thead>
                        <tr><td class="list_name_title0">商品</td>
                            <td class="list_name_title1">单价(元)</td>
                            <td class="list_name_title2">数量</td>
                            <td class="list_name_title4">实付款(元)</td>
                            <td class="list_name_title5">状态信息</td>
                            <td class="list_name_title6">操作</td>
                        </tr>
                        </thead>

           <c:forEach items="${orders}" var="order">
                        <tbody>
                        <tr class="Order_info"><td colspan="6" class="Order_form_time">下单时间：${order.createtime}   <em></em></td></tr>
                        <tr>
                            <td colspan="3">
                                <table class="Order_product_style">
                                    <c:forEach items="${order.orderItems}" var="now">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="product_name clearfix">
                                                <a href="${APP_PATH}/goods/show?id=${now.goodid}" class="product_img"><img src="${APP_PATH}/products/${now.src}/small/1.jpg" width="80px" height="80px"></a>
                                                <a  href="#">${now.name}</a>
<%--                                                <p class="specification">礼盒装20个/盒</p>--%>
                                            </div>
                                        </td>
                                        <td>${now.price}</td>
                                        <td>${now.count}</td>
                                    </tr>
                                    </tbody>
                                    </c:forEach>

                                </table>
                            </td>
                            <td class="split_line">${order.money}</td>
                            <td class="split_line"><c:if test="${order.status==1}">付款成功 待卖家发货</c:if>
                                <c:if test="${order.status==2}">待付款 &nbsp;<a href="#" style="color: blue"  onclick="doStatus(${order.id},2)">去付款</a></c:if>
                                <c:if test="${order.status==3}">已发货，请耐心等待快递</c:if>
                                <c:if test="${order.status==4}">已签收&nbsp; <a href="#" style="color: green" onclick="doStatus(${order.id},4)">确认收货</a></c:if>
                                <c:if test="${order.status==5}">订单完成</c:if>
                                <c:if test="${order.status==6}">订单失效</c:if>


                            </td>
                            <td class="operating">
<%--                                <a href="#">查看详细</a>--%>
                               <c:if test="${order.status==6||order.status==5}"><a  style="color: red" onclick="deleteOrder(${order.id})"  href="#">删除</a></c:if>
                            </td>
                        </tr>
                        </tbody>
           </c:forEach>

                    </table>
                </div>

            </div>

            <!---->
        </div>
    </div>
</div>

<!--底部图层-->

<div class="footerbox clearfix">

    <div class="text_link">
        <p align="center">
        <p align="center">Copyright ©2019 All Rights Reserved.</p>
    </div>
</div>
<!--右侧菜单栏购物车样式-->
    <script>
        $(function () {
            var id="${param.status}";
            if(id!="") {
                id = Number(id);
                $("#status" + id).css("color","red");
            }

        })

        $("#find").click(function () {
            var key=$("#key").val();

            window.location.href="${APP_PATH}/goods/find?key="+key;
        })

        function deleteOrder(id) {
            layer.confirm("确认删除么",  {icon: 3, title:'提示'}, function(cindex){
                layer.close(cindex);
                $.ajax({
                    url:"${APP_PATH}/order/delete?id="+id,
                    type:"POST",
                    success:function (result) {
                        if(result.result){
                            layer.msg("删除成功", {time:1000, icon:4, shift:6}, function () {
                                window.location.href = "${APP_PATH}/order/userOrder";
                            });
                        }
                    }

                })
            }, function(cindex){
                layer.close(cindex);
            });

        }
        function doStatus(id,status) {
            var s=status==2?"确认付款么！":"确认收货？";
            var s1=status==2?"付款成功":"确认收货成功";

            layer.confirm(s,  {icon: 3, title:'提示'}, function(cindex){
                layer.close(cindex);
                $.ajax({
                    url: "${APP_PATH}/order/doStatus?id=" + id + "&status=" + status,
                    type:"POST",
                    success:function (result) {
                        if(result.result){
                            layer.msg(s1, {time:4000, icon:4, shift:6}, function () {
                                window.location.href = "${APP_PATH}/order/userOrder";
                            });
                        }
                    }

                })
            }, function(cindex){
                layer.close(cindex);
            });


        }
    </script>

</body>
</html>

