<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码</title>
<link href="${ctx }/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx }/static/js/jquery.js"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">找回密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>忘记密码</span></div>
    <form action="${ctx }/order/saveOrder" id="form1" method="post">
    <ul class="forminfo">
    <li><label>用户名</label><input name="personname" id="personname" type="text" class="dfinput" /></li>
    <li><label>登录名</label><input name="username" id="username" type="text" class="dfinput" /></li>
    
    <li><label>&nbsp;</label><input id="format" type="button" class="btn" value="重置密码"/>
    </ul>
    </form>
    
    </div>
</body>
<script language="javascript">
	$(function(){
		$("#format").click(function(){
			if($("#personname").val()=="")
			{
				alert("用户名不能为空");
				return;
			}
			if($("#username").val()=="")
			{
				alert("客户名称不能为空");
				return;
			}
			
			$.ajax({
                url: "${ctx}/index/forgetPwd",
                data: { pName: $("#personname").val() ,uName:$("#username").val()},
                type: "post",
                dataType:'json',
                success: function (data) {
               		if(data.code==0)
            		{
               			alert(data.msg);
               			window.location.href="${ctx}/index/login"
            		}
               		else
              		{
              			alert(data.msg);
              			location.reload();
              		}
               		
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
			
		});
	});
</script>
</html>
