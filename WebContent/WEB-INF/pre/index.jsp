<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" forua="true" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="format-detection" content="telephone=no" />
<title>龙采库存管理</title>
<link href="${path}/static/kcsj/css/css.css" rel="stylesheet" type="text/css" />
<link href="${path}/static/kcsj/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
<script src="${path}/static/kcsj/js/jquery-1.10.2.min.js"></script>
<script src="${path}/static/kcsj/js/jquery.circliful.min.js"></script>


</head>
<body>
<div class="syt">
<form action="${path }/store" method="post">
	<div class="top">
         <div class="top1"><a href="登录.html"><img src="${path}/static/kcsj/images/user.png"></a></div>
         <div class="top2"><input type="text" name="r_name" class="syssk" placeholder="请输入货品名称或关键字" />
         	<div ><input type="submit" value="" class="sy_ssbut"></div>
         </div>

    </div>
    </form>
	<div class="cir" id="myStat" data-dimension="180" data-text="${allNum }" data-info="库存总量" data-width="30" data-fontsize="38" data-total="999" data-part="${allNum }"  data-fgcolor="#fff" data-bgcolor="#74f9c0"></div>
    <script>
	$( document ).ready(function() {
			$('#myStat').circliful();
		});
	</script>
</div>
 <div class="zhuangtai">
    	<ul>
        	<li><a href="#"><span>${jiyaNum }</span><br/>积压数量</a></li>
            <li style="border:none"><a href="#"><span>${duanqueNum }</span><br/>短缺数量</a></li>
        </ul>
    </div>
<div class="sy_biao">
	<ul>
    	<li class="sy_biao_li1"><a href="${path}/index/storeList"><img src="${path}/static/kcsj/images/ruku.png"><br />入库</a></li>
        <li class="sy_biao_li2"><a href="${path }/index/store"><img src="${path}/static/kcsj/images/add.png"><br />添加货品</a></li>
        <li class="sy_biao_li1"><a href="${path}/index/storeList"><img src="${path}/static/kcsj/images/chuku.png"><br />出库</a></li>
    </ul>
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
