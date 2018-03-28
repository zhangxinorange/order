<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>库存明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" forua="true" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="format-detection" content="telephone=no" />
<link href="${path}/static/kcsj/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="ftop">
	<div class="back"><a href="javascript:history.go(-1)"><img src="${path}/static/kcsj/images/back.png" /></a></div>
    <div class="f_tit">库存明细</div>
    <div class="bianji"><a href="${path }/index/storeList?c_id=${indexUser.id}">添加</a></div>
</div>
<div class="kuang">
    <div class="kc_list">
    <c:forEach items="${datas.data }" var="d">
    	<ul>
        	<li class="kc_list_li1">
            	<div class="zi1">${d.r_name }</div>
                <div class="zi2">入库：${d.s_num }</div>
                <div class="zi5">日期：<fmt:formatDate
type="date"
value="${d.order_date }"
dateStyle="default"
/></div>
            </li>
            <li class="kc_list_li2">
           	<a href="#"><img width="40rem" /><br/></a>
           </li>
            <li class="kc_list_li2">
            	<a href="${path }/storedetail/del?id=${d.id}"><img src="${path}/static/kcsj/images/shanchu.png" width="40rem" /><br />删除</a>
            </li>
        </ul>
     </c:forEach>
    
       
    </div>
</div>
<div class="down">
	<ul>
		<li class="do1"><a href="${path}/"><img src="${path}/static/kcsj/images/d1.png"  /><br />首页</a></li>
		<li class="do1"><a href="${path}/index/storeList"><img src="${path}/static/kcsj/images/d2.png" /><br />货品</a></li>
		<li class="do1"><a href="${path}/storedetail?c_id=${indexUser.id}"><img src="${path}/static/kcsj/images/d3.png" /><br />明细</a></li>
        <li class="do1"><a href="统计.html"><img src="${path}/static/kcsj/images/d4.png" /><br />统计</a></li>
		<li class="do1"><a href="${path}/index/userinfo"><img src="${path}/static/kcsj/images/d5.png" /><br />我的</a></li>
	</ul>
</div>
</body>
</html>
