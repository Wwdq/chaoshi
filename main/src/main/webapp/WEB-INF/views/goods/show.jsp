<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/7
  Time: 15:51
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
    <script src="${APP_PATH}/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/common_js.js" type="text/javascript"></script>
    <script src="${APP_PATH}/js/footer.js" type="text/javascript"></script>
    <!--图片放大效果-->
    <script src="${APP_PATH}/js/jqzoom.js" type="text/javascript"></script>
    <script src="${APP_PATH}/layer/layer.js"  type="text/javascript"></script>
    <title>产品详细页</title>
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
            <p><input id="key" name="" type="text"  class="text"/><input id="find" name="" type="submit" value="搜 索"  class="Search_btn"/></p>
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
<!--产品详细页样式-->
<div class="clearfix Inside_pages">
    <div class="Location_link">
        <em></em><a href="#">${good.type}</a>  &gt;   <a href="#">${good.name}</a>
    </div>
    <!--产品详细介绍样式-->
    <div class="clearfix" id="goodsInfo">
        <!--产品图片放大-->
        <div class="mod_picfold clearfix">
            <div class="clearfix" id="detail_main_img">
                <div class="layout_wrap preview">
                    <div id="vertical" class="bigImg">
                        <img id="mid" src="${APP_PATH}/products/${good.src}/mid/1.jpg" width="400" height="400" alt="" id="midimg" />
                        <div id="winSelector"></div>
                    </div>
                    <div class="smallImg">
                        <div class="scrollbutton smallImgUp disabled">&lt;</div>
                        <div id="imageMenu">
                            <ul>
                                <li><img onclick="midImg(1)" id="img1"src="${APP_PATH}/products/${good.src}/small/1.jpg" width="68" height="68" alt=""/></li>
                                <li><img onclick="midImg(2)"id="img2"src="${APP_PATH}/products/${good.src}/small/2.jpg" width="68" height="68" alt=""/></li>
                                <li><img onclick="midImg(3)"id="img3" src="${APP_PATH}/products/${good.src}/small/3.jpg" width="68" height="68" alt=""/></li>
                            </ul>
                        </div>
                        <div class="scrollbutton smallImgDown">&gt;</div>
                    </div><!--smallImg end-->
                    <div id="bigView" style="display:none;"><div><img width="800" height="800" alt="" /></div></div>
                </div>
            </div>
            <div class="Sharing">

                <!--收藏-->
            </div>
        </div>
        <!--产品信息-->
        <div class="property">
            <form action="javascript:addToCart(97)" name="ECS_FORMBUY" id="ECS_FORMBUY">
                <h2>${good.name}</h2>
                <div class="goods_info">◆${good.dep}◆</div>
                <div class="productD clearfix">
                    <div class="productDL">
                       <c:if test="${good.discount==1}"><dl><dt>售&nbsp;&nbsp;&nbsp;&nbsp;价：</dt><dd>   <span id="ECS_SHOPPRICE"><i>￥</i>${good.disPrice}</span><del>原价：￥${good.price}</del></dd> </dl></c:if>
                        <c:if test="${good.discount!=1}"><dl><dt>售&nbsp;&nbsp;&nbsp;&nbsp;价：</dt><dd>   <span id="ECS_SHOPPRICE"><i>￥</i>${good.price}</span></dd> </dl></c:if>
                        <dl><dt>总 重 量：</dt><dd>${good.weight}千克</dd> </dl>

                        <dl><dt>上架时间：</dt><dd>${good.createtime}</dd></dl>

                    </div>
                </div>
                <div class="buyinfo" id="detail_buyinfo">
                    <dl>
                        <dt>数量</dt>
                        <dd>
                            <div class="choose-amount left">
                                <a class="btn-reduce" href="javascript:;" onclick="doCount(-1)">-</a>
                                <a class="btn-add" href="javascript:;" onclick="doCount(1)">+</a>
                                <input id="number1" class="text" id="buy-num" value="1" onkeyup="setAmount.modify('#buy-num');">
                            </div>
                            <div class="P_Quantity">剩余：${good.count}</div>
                        </dd>
                        <dd>
                            <div class="wrap_btn"> <a  onclick="addCart(${param.id})" class="wrap_btn1" title="加入购物车"></a>
                        </dd>
                    </dl>
                </div>
                <div class="Guarantee clearfix">
                        <dd> <div class="payment" id="payment">
                        </div>
                        </dd>
                    </dl>
                </div>
            </form>
        </div>
        <!--推荐-->
        <div class="p_right_info">


        </div>
    </div>
    <!--样式-->
    <div class="clearfix">
        <div class="left_style">

        </div>
        <!--介绍信息样式-->
        <div class="right_style">
            <div class="inDetail_boxOut ">
                <div class="inDetail_box">
                    <div class="fixed_out ">
                        <ul class="inLeft_btn fixed_bar">
                            <li class="active"><a id="property-id" href="#shangpsx" class="current">商品展示</a></li>

                        </ul>

                    </div>
                </div>
            </div>
            <div id="shangpjs" class="info_style" style="text-align:center"><img src="${APP_PATH}/products/${good.src}/1.png" /></div>
            <div class="productContent" id="status2">
                <div class="commentBox" style="display:none;">
                    <form action="javascript:;" onsubmit="submitComment(this)" method="post" name="commentForm" id="commentForm">
                        <h3>商品评分</h3>
                        <div id="star">
                            <ul>
                                <li><span onclick="dorank(1)"></span>
                                    <p>1分</p>
                                    <p>非常不满意</p>
                                </li>
                                <li><span onclick="dorank(2)"></span>
                                    <p>2分</p>
                                    <p>不满意</p>
                                </li>
                                <li><span onclick="dorank(3)"></span>
                                    <p>3分</p>
                                    <p>一般</p>
                                </li>
                                <li><span onclick="dorank(4)"></span>
                                    <p>4分</p>
                                    <p>满意</p>
                                </li>
                                <li><span onclick="dorank(5)"></span>
                                    <p>5分</p>
                                    <p>非常满意</p>
                                </li>
                            </ul>
                            <input type="hidden" name="rank" id="rank" value="1">
                            <input type="hidden" name="cmt_type" value="">
                            <input type="hidden" name="id" value="78">
                            <input type="hidden" name="email" id="email" value="null@mial.com">
                        </div>
                        <h4>评论内容</h4>
                        <div class="bd">
                            <textarea name="content" id="content" class="textarea_long" onkeyup="checkLength(this);"></textarea>
                            <p class="g">
                                <label>&nbsp; </label>
                                <input type="submit" value="发表" class="btn_common">
                                <span t="word_calc" class="word"><b id="sy">0</b>/1000</span> </p>
                        </div>
                    </form>
                </div>
                <div id="ECS_COMMENT"> <div class="Comment">

                    <div class="CommentText" id="goodsdetail_comments_list" style="display:block">
                        <ul class="clearfix">
                        </ul>

                    </div>
                </div>

                </div>
                <script type="text/javascript">
                    $('.CommentTab ul').find('li').click(function(){
                        $('.CommentTab ul').find('li').removeClass('active');
                        $('.CommentText').css({display:'none'});
                        $(this).addClass('active');
                        $('.CommentText').eq($(this).index()).css({display:'block'});
                    });
                </script>
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

<%--            加入购物车--%>
            <script>

                function doCount(id) {
                    var val = $("#number1").val();
                    $("#number1").val(Number(val) + id);

                }
                function addCart(id) {
                    var val=$("#number1").val();
                    val=Number(val);
                    $.ajax({
                       url:"${APP_PATH}/cart/addCart?id="+id,
                       type:"POST",
                       data:{
                           "number":val
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
            </script>
<%--            图片切换--%>
            <script>
                function midImg(id) {
                    $("#mid").attr("src","${APP_PATH}/products/${good.src}/mid/"+id+".jpg");
                }
                $("#find").click(function () {
                    var key=$("#key").val();

                    window.location.href="${APP_PATH}/goods/find?key="+key;
                })
            </script>

</body>
</html>
