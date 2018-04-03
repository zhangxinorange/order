<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单管理系统</title>
<link href="${ctx }/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/static/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
  
  
  window.parent.document.getElementById('leftFrame').contentWindow.changeLi();
});
  

  $(".clickAdd").click(function(){
	 window.location.href="${ctx}/order/addOrder"; 
  });
  
});
function searchlis(e){
	if(typeof(e)=="undefined")
	{
		e=1;
	}
	 window.location.href="${ctx}/order/dOrderList?orderName="+$("#orderName").val()+"&pageIndex="+e;
}

</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">订单信息</a></li>
    <li><a href="#">订单回收站</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><span><img src="${ctx }/static/images/t02.png" /></span>恢复</li>
        <li class="delClick"><span><img src="${ctx }/static/images/t03.png" /></span>删除</li>
        </ul>
        
        
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="radio" value="" /></th>
        <th>编号<i class="sort"><img src="${ctx }/static/images/px.gif" /></i></th>
        <th>订单名称</th>
        <th>客户名称</th>
        <th>订单物资</th>
        <th>订单数量</th>
        <th>订单金额</th>
        <th>下单时间</th>
        <th>备注</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${data.data }">
        	<tr>
	        <td><input name="orderCheck" type="radio" value="${order.id }" /></td>
	        <td>${order.id }</td>
	        <td>${order.ordername }</td>
	        <td>${order.customname }</td>
	        <td>${order.goodsname }</td>
	        <td>${order.ordernum }</td>
	        <td>${order.ordertotal }</td>
	        <td> <fmt:formatDate value="${order.orderDate}" pattern="yyyy年MM月dd日 hh点mm分ss秒"></fmt:formatDate></td>
	        <td>${order.remark }</td>
	        </tr> 
        </c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${data.total }</i>条记录，当前显示第&nbsp;<i class="blue">${data.pageIndex }&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:javascript:searchlis(${data.pageIndex-1 })"><span class="pagepre"></span></a></li>
        <c:forEach  begin="1" end="${data.pageCount}" var="x">
        	 <li  class="paginItem 
        	 <c:if test="${x== data.pageIndex}">
        	 	current
        	 </c:if>
        	 "><a href="javascript:searchlis(${x })";>${x }</a></li>
        </c:forEach>
        <li class="paginItem"><a href="javascript:searchlis(${data.pageIndex+1 })"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${ctx }/static/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对订单的恢复 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$(function(){
		$(".sure").click(function(){
			var a = $("input[name='orderCheck']:checked").val();
			if(typeof(a)=="undefined")
			{
				alert("请选择一条订单信息进行恢复");
				return;
			}
			window.location.href="${ctx}/order/reOrder?oId="+a;
		});
		$(".delClick").click(function(){
			var a = $("input[name='orderCheck']:checked").val();
			if(typeof(a)=="undefined")
			{
				alert("请选择一条订单信息进行删除");
				return;
			}
			if(confirm("确认永久删除吗此条订单吗?"))
			{
				window.location.href="${ctx}/order/deleteOrder?oId="+a+"&type=1";
			}
		});
		
		$(".tongji").click(function(){
			window.location.href="${ctx}/order/gototongji";
		});
	});
	function deleteLi(id)
	{
		if(confirm("确认删除吗?"))
		{
			window.location.href="${ctx}/order/deleteOrder?oId="+id;
		}
	}
	</script>
</body>
</html>
