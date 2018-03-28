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
    <li><a href="#">变更分页条数</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>分页信息</span></div>
    <form action="${ctx }/person/updatePage" id="form1" method="post">
    <ul class="forminfo">
    <li><label>订单分页</label><input name="orderPage" id="orderPage" type="number" class="dfinput" value="${osize }"/></li>
    <li><label>用户分页</label><input name="userPage" id="userPage" type="number" class="dfinput"  value="${usize }"/></li>
   
    <li><label>&nbsp;</label><input id="format" type="button" class="btn" value="确认保存"/>
    <input id="reset" type="button" class="btn" value="返回"/></li>
    </ul>
    </form>
    
    </div>
</body>
<script language="javascript">
	$(function(){
		$("#format").click(function(){
			if($("#orderPage").val()=="")
			{
				alert("订单分页不能为空");
				return;
			}
			if($("#userPage").val()=="")
			{
				alert("用户分页不能为空");
				return;
			}
			$("#form1").submit();
			
		});
		$("#reset").click(function(){
			parent.location.href="${ctx}/person/pList";
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
