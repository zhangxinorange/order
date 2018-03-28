<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增明细</title>
<meta http-equiv="Cache-Control" content="no-cache" forua="true" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="format-detection" content="telephone=no" />
<link href="${path}/static/kcsj/css/css.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="${path}/static/kcsj/css/index.css" />
<link rel="stylesheet" type="text/css" href="${path}/static/kcsj/LCalendar/css/LCalendar.css" />

</head>

<body>
<form action="${path }/storedetail/add" method="post">
<div class="ftop">
	<div class="back"><a href="javascript:history.go(-1)"><img src="${path}/static/kcsj/images/back.png" /></a></div>
    <div class="f_tit">新增明细</div>
    <div class="bianji"><input type="submit" value="保存" class="bc_but" /></div>
</div>
<div class="kuang">
    <div class="tiao1">
        <div class="tiao_l"><span>货品名称</span></div>
        <div class="tiao_r"><span>${record.r_name }</span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>单位</span></div>
        <div class="tiao_r"><span>${record.r_unit }</span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
       
        <div id="parent" style="padding-left:0.3rem">
			<select name="type" >
              <option disabled="disabled">操作选项</option>
			  <option value="0">入库</option>
			  <option value="1">出库</option>
			  <option value="2">耗损</option>
            </select>
        </div>
    </div>
<input type="hidden" name="r_id"  value="${record.r_id}" class="srk" />
<input type="hidden" name="r_name" value="${record.r_name}" class="srk" />
<input type="hidden" name="r_unit" value="${record.r_unit}" class="srk" />
    <div class="tiao1">
        <div class="tiao_l"><span>数量</span></div>
        <div class="tiao_r"><span><input type="number" name="s_num" class="srk" required/></span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>价格</span></div>
        <div class="tiao_r"><span><input type="text" name="price" class="srk" /></span></div>
    </div>
         <div class="tiao1">
        <div class="tiao_l"><span>日期</span></div>
        <div class="tiao_r"><span><input type="text" name="datestr" required class="srk" id="start_date" placeholder="选择日期"  /></span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
        <div class="tiao_l"><span>供货商</span></div>
        <div class="tiao_r"><span><input type="text" name="pull_com" class="srk" required/></span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>提货商</span></div>
        <div class="tiao_r"><span><input type="text" name="let_com" class="srk" /></span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>负责人</span></div>
        <div class="tiao_r"><span><input type="text" name="oprator" class="srk" /></span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
        <div class="tiao_l"><span>备注</span></div>
        <div class="tiao_r"><span><input type="text" name="remark" class="srk" /></span></div>
    </div>
    <div class="hui">${msg }</div>
</div>
</form>
<script src="${path}/static/kcsj/LCalendar/js/LCalendar.js" type="text/javascript"></script>
	<script type="text/javascript">
		var calendar = new LCalendar();
		calendar.init({
			'trigger': '#start_date', //标签id
			'type': 'date', //date 调出日期选择 datetime 调出日期时间选择 time 调出时间选择 ym 调出年月选择,
			'minDate': (new Date().getFullYear()-3) + '-' + 1 + '-' + 1, //最小日期
			'maxDate': (new Date().getFullYear()+3) + '-' + 12 + '-' + 31 //最大日期
		});
		var calendar = new LCalendar();
		calendar.init({
			'trigger': '#end_date', //标签id
			'type': 'date', //date 调出日期选择 datetime 调出日期时间选择 time 调出时间选择 ym 调出年月选择,
			'minDate': (new Date().getFullYear()-3) + '-' + 1 + '-' + 1, //最小日期
			'maxDate': (new Date().getFullYear()+3) + '-' + 12 + '-' + 31 //最大日期
		});
		//		$(function() {
		//			$('#start_date').date();
		//			$('#end_date').date();
		//		});
	</script>
</body>
<div class="down">
	<ul>
		<li class="do1"><a href="${path}/"><img src="${path}/static/kcsj/images/d1.png"  /><br />首页</a></li>
		<li class="do1"><a href="${path}/index/storeList"><img src="${path}/static/kcsj/images/d2.png" /><br />货品</a></li>
		<li class="do1"><a href="${path}/storedetail?c_id=${indexUser.id}"><img src="${path}/static/kcsj/images/d3.png" /><br />明细</a></li>
        <li class="do1"><a href="统计.html"><img src="${path}/static/kcsj/images/d4.png" /><br />统计</a></li>
		<li class="do1"><a href="${path}/index/userinfo"><img src="${path}/static/kcsj/images/d5.png" /><br />我的</a></li>
	</ul>
</div>
</html>
