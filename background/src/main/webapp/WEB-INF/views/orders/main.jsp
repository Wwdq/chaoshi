<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/5/10
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/4/17
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${PATH}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#"> 订单一览</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${user.username} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li class="divider"></li>
                            <li><a href="${PATH}/doOut"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>

            </ul>

        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <jsp:include page="/WEB-INF/views/user/common.jsp"/>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <!-- Single button -->
                    <div class="col-lg-6">

                    </div><!-- /.col-lg-6 -->

                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th   width="20">#</th>
                                <th >订单创建时间</th>
                                <th  >总价格</th>

                                <th>姓名</th>
                                <th>地址</th>
                                <th>电话</th>
                                       <th width="100">商品名</th>
                                       <th width="70">单价</th>
                                        <th width="70">数量</th>






                              <th >订单状态</th>
                                <th    width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orders}" var="now" varStatus="count">
                                <tr rowspan="2">
                                    <td>${count.count}</td>
                                    <td>${now.createtime}</td>
                                    <td>${now.money}</td>
                                    <td>${now.name}</td>
                                    <td>${now.address}</td>
                                    <td>${now.phone}</td>
                                    <td colspan="3">
                                          <table class="table table-bordered  ">

                                         <c:forEach items="${now.orderItems}" var="item">

                                         <tr >
                                            <td width="100">${item.name}</td>
                                            <td width="70">${item.price}</td>
                                            <td width="70">${item.count}</td>
                                         </tr>

                                         </c:forEach>
                                          </table>
                                    </td>
                            <td><c:if test="${now.status==5}">已完成</c:if>
                                <c:if test="${now.status==1}">未发货</c:if>
                                <c:if test="${now.status==2}">待付款</c:if>
                                <c:if test="${now.status==3}">送货中</c:if>
                                <c:if test="${now.status==4}">未确认收货</c:if>
                                <c:if test="${now.status==6}">过期</c:if>
                            </td>

                                    <td>
                                        <c:if test="${now.status==1}">
                                        <button type="button" onclick="toMai(${now.id})" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>
                                        </c:if>
                                        <c:if test="${now.status==3}">
                                        <button type="button"  onclick="toMai1(${now.id})" class="btn btn-primary btn-xs"><i    class=" glyphicon glyphicon-pencil"></i></button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr >
                                <c:if test="${ empty param.key}">
                                    <td colspan="11" align="center">
                                        <ul class="pagination">
                                            <c:if test="${param.pageNo>1}">
                                                <li class="disabled"><a href="${PATH}/orders/main?pageNo=${param.pageNo-1}<c:if test="${not empty param.flag}">&flag=${param.flag}</c:if>">上一页</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${pageMax}" varStatus="now">
                                                <c:if test="${pageNo==now.count}">
                                                    <li class="active"><a href="#">${now.count}</a></li>
                                                </c:if>
                                                <c:if test="${pageNo!=now.count}">
                                                    <li ><a href="${PATH}/orders/main?pageNo=${now.count}<c:if test="${not empty param.flag}">&flag=${param.flag}</c:if>">${now.count}</a></li>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${param.pageNo<pageMax}">
                                                <li><a href="${PATH}/orders/main?pageNo=${param.pageNo+1}<c:if test="${not empty param.flag}">&flag=${param.flag} </c:if>">下一页</a></li>
                                            </c:if>

                                        </ul>
                                    </td>
                                </c:if>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${PATH}/script/docs.min.js"></script>
<script src="${PATH}/layer/layer.js"></script>

<script >
    function update(id){
        window.location.href="${PATH}/goods/update?id="+id;
    }
    function toMai(id){
        layer.confirm("确认改变状态为已发货么",  {icon: 3, title:'确认发货'}, function(cindex){
            window.location.href="${PATH}/orders/status?id="+id+"&status=1";
            layer.close(cindex);
        }, function(cindex){
            layer.close(cindex);
        });
    }
    function toMai1(id){
        layer.confirm("确认送达么？",  {icon: 3, title:'确认送达'}, function(cindex){
            window.location.href="${PATH}/orders/status?id="+id+"&status=3";
            layer.close(cindex);
        }, function(cindex){
            layer.close(cindex);
        });
    }

    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });
    function goSelect() {
        var key = $("#key").val();
        window.location.href="${PATH}/goods/main?key=" +key;
    }
</script>

</body>
</html>

