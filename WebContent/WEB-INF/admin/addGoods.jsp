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
<script type="text/javascript" src="${ctx }/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jquery.idTabs.min.js"></script>
<link href="${ctx }/static/css/select.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加商品</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>商品信息</span></div>
    <form action="${ctx }/goods/saveGoods" id="form1" method="post">
    <ul class="forminfo">
    <li><label>商品类型</label> <div class="vocation">
    		<select class="select3" name="goodtype" id="goodtype">
				   <c:forEach var="type" items="${tList }">
        				<option value="${type.tid }" >${type.tname }</option>
        			</c:forEach>
				   </select>
    </div>
    <input name="status" id="status" type="hidden" value="0" class="dfinput" /></li>
    
    <li><label>商品名称</label><input name="goodsname" id="goodsname" type="text" class="dfinput" /></li>
    
    <li><label>&nbsp;</label><input id="format" type="button" class="btn" value="确认保存"/>
    <input id="reset" type="button" class="btn" value="返回"/></li>
    </ul>
    </form>
    
    </div>
</body>
<script language="javascript">
	$(function(){
		$("#format").click(function(){
			if($("#goodname").val()=="")
			{
				alert("商品名称不能为空");
				return;
			}
			
			if($("#goodtype").val()=="")
			{
				alert("商品类型名称不能为空");
				return;
			}
			$("#form1").submit();
			
		});
		$("#reset").click(function(){
			window.location.href="${ctx}/goods/gList";
		});
		
		
		$(".select1").uedSelect({
			width : 345			  
		});
		$(".select2").uedSelect({
			width : 167  
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</html>
