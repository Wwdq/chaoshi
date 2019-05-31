<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/21
  Time: 15:19
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
    <link href="${APP_PATH}/css/Orders.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/css/show.css" rel="stylesheet" type="text/css" />
    <link href="${APP_PATH}/css/purebox-metro.css" rel="stylesheet" id="skin">
    <script src="${APP_PATH}/js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.sumoselect.min.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/common_js.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/footer.js" type="text/javascript"></script>
    <script src="${APP_PATH}/layer/layer.js" type="text/javascript"></script>
    <title>订单确认页</title>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3 });
        window.test = $('.testsel').SumoSelect({okCancelInMulti:true });
    });
</script>
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

                </ul>
            </div>
        </div>
    </div>
    <!--顶部样式1-->
    <div id="header"  class="header page_style">
        <div class="logo"><a href="Home.html"><img src="${APP_PATH}/images/logo1.png" alt="生鲜网" /></a></div>
        <!--结束图层-->
        <div class="Search">
            <p><input  id="key" name="" type="text"  class="text"/><input  id="find" name="" type="submit" value="搜 索"  class="Search_btn"/></p>
        </div>
        <!--购物车样式-->

    </div>
    <!--菜单导航样式-->
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
<!--确认订单页样式-->
<div class="Inside_pages clearfix" id="Orders">
    <div class="Process"><img src="${APP_PATH}/images/Process_img_02.png" /></div>
    <div class="Orders_style clearfix">
        <!--地址信息样式-->
        <div class="Address_info">
            <div class="title_name">选择收货地址
                <select  onchange="doIt()">
                 <c:forEach items="${addrList}" varStatus="index">
                <option   value="${index.count}">${index.count}</option>
                 </c:forEach>

                </select>
                 <a href="${APP_PATH}/user/addr">去添加新地址</a>
            </div>
            <ul>
                <li><label>收件人姓名：</label><span id="name">${addrList[0].name}</span></li>
                <li><label>收件人地址：</label><span id="addr">${addrList[0].addr}</span></li>
                <li><label>收件人电话：</label><span id="phone">${addrList[0].phone}</span></li>
                <li><label>邮&nbsp;&nbsp;编：</label><span id="zip">${addrList[0].zip}</span></li>
            </ul>
        </div>
    </div>
    <form class="form" method="post">
        <fieldset>
            <!--快递选择-->

            <!--付款方式-->

            <div class="invoice_style">

            </div>
            <!--产品列表-->
            <div class="product_List">
                <table>
                    <thead><tr class="title"><td class="name">商品名称</td><td class="price">商品价格</td><td class="Preferential">优惠价</td><td class="Quantity">购买数量</td><td class="Money">金额</td></tr></thead>
                    <tbody>

                        <c:forEach items="${orderList}" var="item">
                            <tr>
                        <td class="Product_info">
                            <a href="#"><img src="${APP_PATH}/products/${item.src}/small/1.jpg"  width="100px" height="100px"/></a>
                            <a href="#" class="product_name">${item.name}</a>
                        </td>
                        <td><i>￥</i>${item.price}</td>
                        <td><i>￥</i><c:if test="${item.disPrice==0}">${item.price}</c:if><c:if test="${item.disPrice!=0}">${item.disPrice}</c:if></td>
                        <td>${item.count}</td>
                        <td class="Moneys"><i>￥</i><c:if test="${item.disPrice==0}">${item.price*item.count}</c:if><c:if test="${item.disPrice!=0}">${item.disPrice*item.count}</c:if></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>


                <!--价格-->
                <div class="price_style">
                    <div class="right_direction">
                        <ul>

                            <li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span>${total}</span></li>
                        </ul>
                        <div class="btn"><input onclick="doOrders()" name="submit" type="button" value="提交订单" class="submit_btn"/> <input name="" type="button"  onclick="goCart()"  value="返回购物车"  class="return_btn"/></div>

                    </div>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<div class="slogen">
    <div class="index_style">
        <ul class="wrap">
            <li>
                <a href="#"><img src="${APP_PATH}/images/slogen_34.png" data-bd-imgshare-binded="1"></a>
                <b>安全保证</b>
                <span>多重保障机制 认证商城</span>
            </li>
            <li><a href="#"><img src="${APP_PATH}/images/slogen_28.png" data-bd-imgshare-binded="2"></a>
                <b>正品保证</b>
                <span>正品行货 放心选购</span>
            </li>
            <li>
                <a href="#"><img src="${APP_PATH}/images/slogen_30.png" data-bd-imgshare-binded="3"></a>
                <b>七天无理由退换</b>
                <span>七天无理由保障消费权益</span>
            </li>
            <li>
                <a href="#"><img src="${APP_PATH}/images/slogen_31.png" data-bd-imgshare-binded="4"></a>
                <b>天天低价</b>
                <span>价格更低，质量更可靠</span>
            </li>
        </ul>
    </div>
</div>
<!--底部图层-->
<div class="phone_style">
    <div class="index_style">
        <span class="phone_number"><em class="iconfont icon-dianhua"></em>000-0000-000</span><span class="phone_title">客服热线 7X24小时 贴心服务</span>
    </div>
</div>
<div class="footerbox clearfix">
    <div class="clearfix">

    </div>
    <div class="text_link">
        <p align="center">
        <p align="center">Copyright ©2019 All Rights Reserved.</p>
    </div>
</div>
        <%
      String[]arr=request.getParameterValues("id");
        String s0="";
        for(int i=0;i<arr.length;i++){
            s0+="id="+arr[i]+"&";
        }
     String total=request.getParameter("total");
            s0+="total="+total;
    %>
    <script type="text/javascript">
    function checkLength(which) {
        var maxChars = 50; //
        if(which.value.length > maxChars){
            alert("您出入的字数超多限制!");
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0,maxChars);
            return false;
        }else{
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    }
</script>
<script>
    function doIt(){
        var id = $('select  option:selected').val();
        id = Number(id);
        switch (id) {
            case 1:
                var name = "${addrList[0].name}";
                var phone = "${addrList[0].phone}";
                var addr = "${addrList[0].addr}";
                var zip = "${addrList[0].zip}";

                break;
            case 2:
                var name = "${addrList[1].name}";
                var phone = "${addrList[1].phone}";
                var addr = "${addrList[1].addr}";
                var zip = "${addrList[1].zip}";

                break;
            case 3:
                var name = "${addrList[2].name}";
                var phone = "${addrList[2].phone}";
                var addr = "${addrList[2].addr}";
                var zip = "${addrList[2].zip}";

                break;
            case 4:
                var name = "${addrList[3].name}";
                var phone = "${addrList[3].phone}";
                var addr = "${addrList[3].addr}";
                var zip = "${addrList[3].zip}";

                break;
            case 5:
                var name = "${addrList[4].name}";
                var phone = "${addrList[4].phone}";
                var addr = "${addrList[4].addr}";
                var zip = "${addrList[4].zip}";

                break;


        }
        $("#name").html(name);
        $("#phone").html(phone);
        $("#addr").html(addr);
        $("#zip").html(zip);

    }
    $(function(){
        $(':input').labelauty();
    });
    function  goCart() {
        layer.confirm("确认返回购物车么？本次交易还没有完成！",  {icon: 3, title:'提示'}, function(cindex){
            layer.close(cindex);
            window.location.href="${APP_PATH}/cart/main";
        }, function(cindex){
            layer.close(cindex);
        });
    }
    $("#find").click(function () {
        var key=$("#key").val();

        window.location.href="${APP_PATH}/goods/find?key="+key;
    })
    function  doOrders() {
        var name = $("#name").html();
        if(name==""){
            layer.msg("地址不能为空 请添加", {time:1000, icon:5, shift:6}, function () {
            });
            return;
        }
        var addr = $("#addr").html();
        var phone = $("#phone").html();
        var zip = $("#zip").html();
        layer.confirm("确认付款么 ！",  {icon: 3, title:'提示'}, function(cindex){
            layer.close(cindex);
            $.ajax({
                url:"${APP_PATH}/order/insert?" + "<%=s0%>"+"&key=0",
                type:"POST",
                data:{"addr":addr,
                       "phone":phone,
                        "zip":zip,
                          "name":name
                },
                success:function (result) {
                    if(result.result){
                        layer.msg("付款成功 正在返回首页！", {time:4000, icon:4, shift:6}, function () {
                            window.location.href = "${APP_PATH}/index.jsp";
                        });
                    }
                }

            })

        }, function(cindex){
            $.ajax({
                url:"${APP_PATH}/order/insert?" + "<%=s0%>"+"&key=1",
                type:"POST",
                success:function (result) {
                    if(result.result){
                        layer.msg("取消了付款 请在1天内完成付款！", {time:4000, icon:4, shift:6}, function () {
                            window.location.href = "${APP_PATH}/index.jsp";
                        });
                    }
                }

            })
            layer.close(cindex);
        });


    }
</script>
</body>
</html>
