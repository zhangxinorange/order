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
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加商品类型</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>商品类型信息</span></div>
    <form action="${ctx }/goodsType/saveGoodsType" id="form1" method="post">
    <ul class="forminfo">
    <li><label>商品类型名称</label><input name="tname" id="tname" type="text" class="dfinput" />
    <input name="status" id="status" type="hidden" value="0" class="dfinput" /></li>
    <li><label>&nbsp;</label><input id="format" type="button" class="btn" value="确认保存"/>
    <input id="reset" type="button" class="btn" value="返回"/></li>
    </ul>
    </form>
    
    </div>
</body>
<script language="javascript">
	$(function(){
		$("#format").click(function(){
			if($("#tname").val()=="")
			{
				alert("商品类型名称不能为空");
				return;
			}
			$("#form1").submit();
			
		});
		$("#reset").click(function(){
			window.location.href="${ctx}/goodsType/gtList";
		});
	});
</script>
</html>
