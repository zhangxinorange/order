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
    <li><a href="#">添加用户</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>用户信息</span></div>
    <form action="${ctx }/person/savePerson" id="form1" method="post">
    <ul class="forminfo">
    <li><label>用户名称</label><input name="personname" id="personName" type="text" class="dfinput" /></li>
    <li><label>登录名称</label><input name="username" id="username" type="text" class="dfinput"  onblur="javascript:checkUserName();"/></li>
    <li><label>登录密码</label><input name="password" id="password" type="password" class="dfinput" /></li>
    <li><label>用户角色</label>
    	<cite><input name="role" type="radio" value="1" checked="checked"/>普通用户&nbsp;
    	<input name="role" type="radio" value="0"/>管理员</cite>
    </li>
    <li><label>用户性别</label>
    	<cite><input name="sex" type="radio" value="0" checked="checked"/>男&nbsp;&nbsp;
    	<input name="sex" type="radio" value="1"/>女</cite></li>
    	
    <li><label>用户手机号</label><input name="phone" id="phone" type="text" class="dfinput" /></li>
    
    <li><label>用户公司</label><input name="company" id="company" type="text" class="dfinput" /></li>
     <li><label>担任岗位</label><input name="post" id="post" type="text" class="dfinput" />
     <input name="status" type="hidden" value="0"/>
     </li>
    <li><label>&nbsp;</label><input id="format" type="button" class="btn" value="确认保存"/>
    <input id="reset" type="button" class="btn" value="返回"/></li>
    </ul>
    </form>
    
    </div>
</body>
<script language="javascript">
	$(function(){
		$("#format").click(function(){
			if($("#personName").val()=="")
			{
				alert("用户名称不能为空");
				return;
			}
			if($("#username").val()=="")
			{
				alert("登录名称不能为空");
				return;
			}
			if($("#password").val()=="")
			{
				alert("登录密码不能为空");
				return;r
			}
			$("#form1").submit();
			
		});
		$("#reset").click(function(){
			window.location.href="${ctx}/person/pList";
		});
	});
	function checkUserName(){
		var uName=$("#username").val();
		if(uName!=null&&uName!="")
			{
			
			
		$.ajax({
            url: "${ctx}/person/checkUser",
            data: { userName: uName},
            type: "post",
            dataType:'json',
            success: function (data) {
           		if(data.code!=0)
        		{
           			alert(data.msg);
           			$("#username").val("");
        		}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        }); }
	}
</script>
</html>
