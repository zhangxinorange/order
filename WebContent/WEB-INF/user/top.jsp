﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
});
function gotoOut()
{
	if(confirm("确认退出吗？"))
	{
		parent.location.href="${ctx}/index/out";
	}
}
</script>


</head>

<body style="background:url(${ctx }/static/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="${ctx }/index" target="_parent"><img src="${ctx }/static/images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
    <!-- <li><a href="${ctx }/static/default.html" target="rightFrame" class="selected"><img src="${ctx }/static/images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="imgtable.html" target="rightFrame"><img src="images/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="images/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="tools.html"  target="rightFrame"><img src="images/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li> -->
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="${ctx }/static/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="javascript:gotoOut();"  target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${person.personname }</span>
    </div>    
    
    </div>
</body>
</html>
