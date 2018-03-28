<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${ctx }/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx }/static/js/jquery.js"></script>
<script language="JavaScript" src="${ctx }/static/js/jquery.alerts.js"></script>
<script type="text/javascript">
$(function(){
	if('${result}'!='')
	{
		//alert('${result.msg}');
		/* $.alerts.alert("${result.msg}","提示","确定",function(){
			$("#form1").attr("action",'${ctx}/${result.data}');
			$("#form1").submit();
		}); */
		if(confirm("${result.msg}")){
			$("#form1").attr("action",'${ctx}/${result.data}');
			$("#form1").submit();
		}
	}
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<form id="form1" action="" method="post">
		
	</form>
</body>
</html>
