<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/19
  Time: 18:14
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
    <script src="${APP_PATH}/js/common_js.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/footer.js" type="text/javascript"></script>
    <script src="${APP_PATH}/layer/layer.js" type="text/javascript"></script>
    <title>购物车</title>
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
            <p><input  id="key" name="" type="text"  class="text"/><input  id="find" name="" type="submit" value="搜 索"  class="Search_btn"/></p>
        </div>

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
<!--购物车样式-->
<div class="Inside_pages clearfix">
    <div class="shop_carts">
        <div class="Process"><img src="${APP_PATH}/images/Process_img_01.png" alt="" /></div>
        <div class="Shopping_list">
            <div class="title_name">
                <ul>
                    <li class="checkbox"></li>
                    <li class="name">商品名称</li>
                    <li class="scj">原价</li>
                    <li class="bdj">特卖价</li>
                    <li class="sl">购买数量</li>
                    <li class="xj">小计</li>
                    <li class="cz">操作</li>
                </ul>
            </div>
            <div class="shopping">
                <form  method="post" action="">
                    <table class="table_list">
                <c:forEach items="${itemList}" var="item">
                      <tr class="tr">
                          <td class="checkbox"><input onclick="doSum()" name="checkitems" type="checkbox" value="totalPrice_${item.id}" /></td>
                            <td class="name">
                                <div class="img"><a href="#"><img src="${APP_PATH}/products/${item.src}/small/1.jpg" alt="" /></a></div>
                                <div class="p_name"><a href="#">${item.name}</a></div>
                            </td>
                            <td class="scj sp"><span id="Original_Price_1">￥${item.price}</span></td>
                            <td class="bgj sp" ><span id="price_item_${item.id}"><c:if test="${item.disPrice==0}">￥${item.price}</c:if><c:if test="${item.disPrice!=0}">￥${item.disPrice}</c:if></span></td>
                            <td class="sl">
                                <div class="Numbers">
                                    <a onClick="down(${item.id})" href="javascript:void(0)" class="jian">-</a>
                                    <input type="text" name="qty_item_${item.id}" value="${item.count}" id="qty_item_${item.id}" onkeyup="setAmount.modify('#qty_item_${item.id}')" class="number_text">
                                    <a onclick="up(${item.id})" href="javascript:void(0)" class="jia">+</a>
                                </div>
                            </td>
                            <td class="xj" ><span id="totalPrice_${item.id}"><c:if test="${item.disPrice==0}">￥${item.count*item.price}</c:if><c:if test="${item.disPrice!=0}">￥${item.count*item.disPrice}</c:if></span> </td>
                            <td class="cz">
                                <p><a onclick="deleteCart(${item.id})" href="#">删除</a></p>

                            </td>
                        </tr>
                </c:forEach>
                    </table>
                    <div class="sp_Operation clearfix">

                        <!--结算-->
                        <div class="toolbar_right">
                            <ul class="Price_Info">
                                <li class="p_Total"><label class="text">商品总价：</label><span class="price sumPrice" id="total_price">￥0.0</span></li>

                            </ul>
                            <div class="btn"><a class="cartsubmit" onclick="goOrders()"  ></a><a class="continueFind" href="${APP_PATH}/goods/index?type=0"></a></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


    </div>
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
<script>
    $(function () {
         doSum();
    })
    function doSum() {
        var l= $("input:checkbox:checked");
        var total=0.0;

        $.each(l,function (i,val) {
            var now = "#"+$(val).val();

            total=Number($(now).html().substring(1))+Number(total);

        })
        $("#total_price").html("￥" + total.toFixed(1));

    }
function down(id) {
    var  count=$("#qty_item_"+id).val();
    var price=Number($("#price_item_"+id).html().substring(1));

    if(Number(count)==1){
        deleteCart(id);
        return ;
    }
    $("#qty_item_"+id).val(count - 1);
    count=count-1;
    doSinge(price, id,count);
    $.ajax({
        url:"${APP_PATH}/cart/subCart",
        type:"POST",
        data:{"id":id}


    })
    doSum();



}
    function goOrders() {
        var l= $("input:checkbox:checked");
        var total=0.0;
        var url="${APP_PATH}/order/main?";

        if(l.length==0){
            layer.msg("请选择你要购买的东西！", {time:1000, icon:5, shift:6}, function () {

            });
            return;
        }
        var url1="${APP_PATH}/order/checkNumber?";
        $.each(l,function (i,val) {
            var now = "#"+$(val).val();
            var id=$(val).val().substring(11);
            url = url + "id=" + id + "&";
            url1 = url1 + "id=" + id + "&";
            total=Number($(now).html().substring(1))+Number(total);

        });
        $.ajax({
            url: url1,
            type:"POST",

            success:function (result) {
                if(result.result) {
                    url = url + "total=" + total;
                    window.location.href = url;
                }else {
                    layer.msg(result.msg, {time:1000, icon:5, shift:6}, function () {

                    });
                }

            }
        })




    }
function doSinge(price,id,count) {
    $("#totalPrice_"+id).html("￥"+(Number(count)*price).toFixed(1));
}
 function up(id) {
      var count=$("#qty_item_"+id).val();
     var price=Number($("#price_item_"+id).html().substring(1));
     $("#qty_item_"+id).val(Number(count) +1);
     count=Number(count)+1;
     doSinge(price, id,count);
     $.ajax({
         url:"${APP_PATH}/cart/addCart",
         type:"POST",
         data:{"id":id,"number":1}


     })
  doSum();
 }
    $("#find").click(function () {
        var key=$("#key").val();

        window.location.href="${APP_PATH}/goods/find?key="+key;
    })
 function  deleteCart(id) {
     layer.confirm("确认删除商品么？",  {icon: 3, title:'提示'}, function(cindex){
         layer.close(cindex);
         window.location.href="${APP_PATH}/cart/delCart?id="+id;
     }, function(cindex){
         layer.close(cindex);
     });


 }

</script>
</body>
</html>

