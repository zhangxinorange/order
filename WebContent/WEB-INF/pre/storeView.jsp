<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>货品详情</title>
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
    <div class="f_tit">货品详情</div>
    <div class="bianji"><a href="${path }/store/edit?id=${record.id}">编辑</a></div>
</div>
<div class="kuang">
    <div class="tiao1">
        <div class="tiao_l"><span>货品名称</span></div>
        <div class="tiao_r"><span>${record.r_name}</span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>单位</span></div>
        <div class="tiao_r"><span>${record.r_unit}</span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
        <div class="tiao_l"><span>当前库存</span></div>
        <div class="tiao_r"><span>${record.r_num}</span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>最低库存</span></div>
        <div class="tiao_r"><span>${record.r_minnum}</span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>最高库存</span></div>
        <div class="tiao_r"><span>${record.r_maxnum}</span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
        <div class="tiao_l"><span>负责人</span></div>
        <div class="tiao_r"><span>${record.r_operate}</span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
        <div class="tiao_l"><span>备注</span></div>
        <div class="tiao_r"><span>${record.remark}</span></div>
    </div>
    <div class="hui"></div>
    <ul class="zengshan">
    	<li><a href="${path }/store/del?id=${record.id}"><img src="${path}/static/kcsj/images/shan.png" /><br />删除</a></li>
        <li><a href="${path }/storedetail/add?r_id=${record.id}"><img src="${path}/static/kcsj/images/zeng.png" /><br />新增明细</a></li>
    </ul>
    <div class="hui"></div>
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
