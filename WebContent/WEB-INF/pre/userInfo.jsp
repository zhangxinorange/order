<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>基本信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" forua="true" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="format-detection" content="telephone=no" />
<link href="${path}/static/kcsj/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form action="${path }/preuser/update?id=${indexUser.id}" method="post">
<div class="ftop">
	<div class="back"><a href="javascript:history.go(-1)"><img src="${path}/static/kcsj/images/back.png" /></a></div>
    <div class="f_tit">基本信息</div>
    <div class="bianji"><input type="submit" value="保存" class="bc_but" /></div>
</div>
<div class="kuang">
    <div class="tiao1">
        <div class="tiao_l"><span>公司名称</span></div>
        <div class="tiao_r"><span><input type="text" name="c_name" class="srk" value="${indexUser.c_name }" placholder="请输入公司名称" /></span></div>
    </div>
     <div class="tiao1">
        <div class="tiao_l"><span>账号</span></div>
        <div class="tiao_r"><span>${indexUser.c_user }</span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>密码</span></div>
        <div class="tiao_r"><span><a href="${path }/index/reset" class="xiugai">修改</a></span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>公司行业</span></div>
        <div class="tiao_r"><span><input type="text" name="c_ind"  class="srk" value="${indexUser.c_ind }" /></span></div>
    </div>
    <div class="hui"></div>
    <div class="tiao1">
        <div class="tiao_l"><span>公司地址</span></div>
        <div class="tiao_r"><span><input type="text" name="c_area"  class="srk" value="${indexUser.c_area }" /></span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>联系方式</span></div>
        <div class="tiao_r"><span><input type="text" name="c_tel"  class="srk" value="${indexUser.c_tel }" /></span></div>
    </div>
    <div class="tiao1">
        <div class="tiao_l"><span>邮箱</span></div>
        <div class="tiao_r"><span><input type="text" name="c_mail"  class="srk" value="${indexUser.c_mail }"  /></span></div>
    </div>

    <div class="hui"></div>
    <div class="dengchu"><input onclick="logout()" type="button" class="dl_but" value="注 销"/></div>
</div>
</form>
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
    <script>
    function logout(){
window.location="${path}/index/logout";    	
    }
	</script>
</html>
