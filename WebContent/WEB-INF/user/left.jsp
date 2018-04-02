<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单管理系统</title>
<link href="${ctx }/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx }/static/js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
function changeLi()
{
	$("#wode").attr("css","active");
	$("#addLi").removeClass("active");
	$("#addls").removeClass("active");
}
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>订单管理</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="${ctx }/static/images/leftico01.png" /></span>订单管理
    </div>
    	<ul class="menuson">
        <li id="wode" class="active"><cite></cite><a href="${ctx }/order/orderList" target="rightFrame">我的订单</a><i></i></li>
        <li id="addLi"><cite></cite><a href="${ctx }/order/addOrder" target="rightFrame">添加订单</a><i></i></li>
        <li id="addls"><cite></cite><a href="${ctx }/order/dOrderList" target="rightFrame">订单回收站</a><i></i></li>
        <%-- <li><cite></cite><a href="imgtable.html" target="rightFrame">删除订单</a><i></i></li>
        <li><cite></cite><a href="form.html" target="rightFrame">恢复订单</a><i></i></li> --%>
        </ul>    
    </dd>
        
    
    
    </dl>
</body>
</html>
