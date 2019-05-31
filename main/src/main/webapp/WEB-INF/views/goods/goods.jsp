<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/3
  Time: 14:37
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
    <link href="${APP_PATH}/css/purebox-metro.css" rel="stylesheet" id="skin">
    <script src="${APP_PATH}/js/jquery.min.1.8.2.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/common_js.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/footer.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/lrtk.js" type="text/javascript"></script>
    <script src="${APP_PATH}/layer/layer.js"  type="text/javascript"></script>
    <title>产品列表</title>
</head>
<script type="text/javascript" charset="UTF-8">
    <!--
    //点击效果start
    function infonav_more_down(index)
    {
        var inHeight = ($("div[class='p_f_name infonav_hidden']").eq(index).find('p').length)*30;//先设置了P的高度，然后计算所有P的高度
        if(inHeight > 60){
            $("div[class='p_f_name infonav_hidden']").eq(index).animate({height:inHeight});
            $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"><a class="more"  onclick="infonav_more_up('+index+');return false;" href="javascript:">收起<em class="pulldown"></em></a></p>');
        }else{
            return false;
        }
    }
    function infonav_more_up(index)
    {
        var infonav_height = 85;
        $("div[class='p_f_name infonav_hidden']").eq(index).animate({height:infonav_height});
        $(".infonav_more").eq(index).replaceWith('<p class="infonav_more"> <a class="more" onclick="infonav_more_down('+index+');return false;" href="javascript:">更多<em class="pullup"></em></a></p>');
    }

    function onclick(event) {
        info_more_down();
        return false;
    }
    //点击效果end
    //-->
</script>
<body>
<!--顶部样式-->
<div id="header_top">
    <div id="top">
        <div class="Inside_pages">
            <div class="Collection">下午好，欢迎光临生鲜网！<em></em><a href="#">收藏我们</a></div>
            <div class="hd_top_manu clearfix">
                <ul class="clearfix">
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
            <p><input id="key" name="" type="text"  class="text"/><input name=""  id="find" type="submit" value="搜 索"  class="Search_btn"/></p>
        </div>
        <!--购物车样式-->

    </div>
    <!--菜单导航样式-->
    <div id="Menu" class="clearfix">
        <div class="index_style clearfix">
            <div id="allSortOuterbox" class="display">
                <div class="t_menu_img"></div>

            </div>
            <script>$("#allSortOuterbox").slide({ titCell:".Menu_list li",mainCell:".menv_Detail",	});</script>
            <!--菜单导航样式-->
            <div id="Menu" class="clearfix">
                <div class="index_style clearfix">
                    <div id="allSortOuterbox" class="display">
                        <div class="${APP_PATH}/t_menu_img"></div>
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
<!--产品列表样式-->
<div class="Inside_pages clearfix">





    <!--样式-->
    <div  class="scrollsidebar side_green clearfix" id="scrollsidebar">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <!--左侧样式-->
        <div class="page_left_style side_content"  >


            <div class=" side_list">

                <!--销售排行-->
                <div class="pro_ranking">
                    <div class="title_name"><em></em>销量排行</div>
                    <div class="ranking_list">
                        <ul id="tabRank">
                            <c:forEach items="${topTen}" var="now" varStatus="key">
                            <li class="t_p">
                                <em class="icon_ranking">${key.count}</em>
                                <dt><h3><a href="${APP_PATH}/goods/show?id=${now.id}">${now.name}</a></h3></dt>
                                <dd class="clearfix">
                                    <a href="${APP_PATH}/goods/show?id=${now.id}"><img src="${APP_PATH}/products/${now.src}/small/1.jpg" width="90" height="90" /></a>
                                    <span class="Price">￥${now.price}</span>
                                </dd>
                            </li>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
                <script type="text/javascript">
                    jQuery("#tabRank li").hover(function(){ jQuery(this).addClass("on").siblings().removeClass("on")},function(){ });
                    jQuery("#tabRank").slide({ titCell:"dt h3",autoPlay:false,effect:"left",delayTime:300 });
                </script>
            </div>
        </div>
        <script type="text/javascript">
            $(function() {
                $("#scrollsidebar").fix({
                    float : 'left',
                    //minStatue : true,
                    skin : 'green',
                    durationTime : 600
                });
            });
        </script>
        <!--列表样式属性-->
        <div class="page_right_style">
            <div id="Sorted" >
                <div class="Sorted">

                    <!--产品搜索-->
                    <div class="products_search">
                        <input name="" type="text" class="search_text" value="请输入你要搜索的产品" onfocus="this.value=''" onblur="if(!value){value=defaultValue;}"><input name="" type="submit" value="" class="search_btn">
                    </div>
                    <!--页数-->

                </div>
            </div>
            <!--产品列表样式-->
            <div class="p_list  clearfix">
                <ul>
                    <c:forEach items="${goods}"  var="now" >
                        <li class="gl-item">
                            <c:if test="${now.discount==1}">
                            <em class="icon_special tejia"></em>
                            </c:if>
                            <div class="Borders">
                                <div  ><a href="${APP_PATH}/goods/show?id=${now.id}"><img src="${APP_PATH}/products/${now.src}/mid/1.jpg" style="width:220px;height:220px"></a></div>
                                <div class="Price"><b>${now.price}</b></div>
                                <div class="name"><a href="#">${now.name}</a></div>
                                <div class="p-operate">
                                    <a onclick="addCart(${now.id})" class="p-o-btn shop_cart"><em></em>加入购物车</a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
                <div class="Paging">
                    <div class="Pagination">
                        <c:if test="${page.pageNo>1}">
                            <c:if test="${page.ff!=1}">
                                <a href="${APP_PATH}/goods/index?pageNo=${page.pageNo-1}&type=${page.type}<c:if test="${page.flag==1}">&flag=1</c:if>" class="pn-prev disabled">&lt;上一页</a>
                            </c:if>
                            <c:if test="${page.ff==1}">
                                <a href="${APP_PATH}/goods/find?pageNo=${page.pageNo-1}&key=${param.key}" class="pn-prev disabled">&lt;上一页</a>
                            </c:if>
                        </c:if>
                         <c:forEach begin="1" end="${page.count}" varStatus="s">
                             <c:if test="${page.pageNo!=s.count}">
                                 <c:if test="${page.ff!=1}">
                                      <a href="${APP_PATH}/goods/index?pageNo=${s.count}&type=${page.type}<c:if test="${page.flag==1}">&flag=1</c:if>">${s.count}</a>
                                 </c:if>
                                 <c:if test="${page.ff==1}">
                                     <a href="${APP_PATH}/goods/find?pageNo=${s.count}&key=${param.key}">${s.count}</a>
                                 </c:if>
                             </c:if>
                             <c:if test="${page.pageNo==s.count}">
                                 <a href="#" class="on">${s.count}</a>
                             </c:if>
                         </c:forEach>
                        <c:if test="${page.pageNo!=page.count}">
                            <c:if test="${empty param.key}">
                                 <a href="${APP_PATH}/goods/index?pageNo=${page.pageNo+1}&type=${page.type}<c:if test="${page.flag==1}">&flag=1</c:if>">下一页&gt;</a>
                            </c:if>
                            <c:if test="${ not empty param.key}">
                                <a href="${APP_PATH}/goods/find?pageNo=${page.pageNo+1}&key=${param.key}" >&lt;下一页</a>
                            </c:if>
                        </c:if>


                    </div>
                </div>
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

    <div class="text_link">
        <p align="center">
        <p align="center">Copyright ©2019 All Rights Reserved.</p>
    </div>
</div>
<script>
    function addCart(id) {
        $.ajax({
            url:"${APP_PATH}/cart/addCart?id="+id,
            type:"POST",
            data:{
                "number":1
            } ,
            success:function (result) {
                if(result.result){
                    layer.msg("加入购物车成功！", {time:2000, icon:4, shift:6}, function () {

                    });
                }else{
                    window.location.href="${APP_PATH}/login.jsp"
                }

            }

        })

    }
    $("#find").click(function () {
        var key=$("#key").val();

        window.location.href="${APP_PATH}/goods/find?key="+key;
    })
    </script>

</body>
</html>
