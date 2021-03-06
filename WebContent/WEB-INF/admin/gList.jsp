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
<link href="${ctx }/static/css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jquery.idTabs.min.js"></script>
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
  
  
  window.parent.document.getElementById('leftFrame').contentWindow.changeLi_1();
});
  

  $(".clickAdd").click(function(){
	 window.location.href="${ctx}/goods/addGoods"; 
  });
  
  $(".select1").uedSelect({
		width : 345			  
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
  
});
function searchlis(e){
	if(typeof(e)=="undefined")
	{
		e=1;
	}
	 window.location.href="${ctx}/goods/gList?goodName="+$("#goodsName").val()+"&pageIndex="+e+"&goodtype="+$("#goodtype").val();
}

</script>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">商品信息</a></li>
    <li><a href="#">商品信息查看</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="clickAdd"><span><img src="${ctx }/static/images/t01.png" /></span>添加</li> 
        <li class="click"><span><img src="${ctx }/static/images/t02.png" /></span>修改</li>
        <li class="delClick"><span><img src="${ctx }/static/images/t03.png" /></span>删除</li>
        </ul>
        
        
        <ul class="toolbar1">
        	<form action="${ctx }/goods/gList" id="form1" method="post">
        	<li><label>商品类型</label> <div class="vocation" style="float: right;margin-left: 5px;">
    		<select class="select3" name="goodtype" id="goodtype">
    			<option value="">请选择</option>
				   <c:forEach var="type" items="${tList }">
        				<option value="${type.tid }" >${type.tname }</option>
        			</c:forEach>
				   </select>
    </div>
    </li>
        	<li>商品名称:<input type="text"  class="dfinput_1" name="goodsName" id="goodsName" /></li>
         	<a href="javascript:searchlis();"><li ><span><img src="${ctx }/static/images/t05.png" /></span>查询</li> </a>
         	</form>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="radio" value="" /></th>
        <th>编号<i class="sort"><img src="${ctx }/static/images/px.gif" /></i></th>
         <th>商品类别</th>
           <th>商品名称</th>
        <th>创建时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="goods" items="${data.data }">
        	<tr>
	        <td><input name="personCheck" type="radio" value="${goods.gid }" /></td>
	        <td>${goods.gid }</td>
	        <td>${goods.tName }</td>
	        <td>${goods.goodsname }</td>
	        <td> <fmt:formatDate value="${goods.createdate}" pattern="yyyy年MM月dd日 hh点mm分ss秒"></fmt:formatDate></td>
	        <td><a href="javascript:deleteLi('${goods.gid }')" class="tablelink"> 删除</a> &nbsp;
	          </td>
	        </tr> 
        </c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${data.total }</i>条记录，当前显示第&nbsp;<i class="blue">${data.pageIndex }&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:javascript:searchlis(${data.pageIndex-1 })"><span class="pagepre"></span></a></li>
        <!-- <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li> -->
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
        <p>是否确认对商品的修改 ？</p>
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
			var a = $("input[name='personCheck']:checked").val();
			if(typeof(a)=="undefined")
			{
				alert("请选择一条商品进行修改");
				return;
			}
			window.location.href="${ctx}/goods/editGoods?id="+a;
		});
		$(".delClick").click(function(){
			var a = $("input[name='personCheck']:checked").val();
			if(typeof(a)=="undefined")
			{
				alert("请选择一条商品信息进行删除");
				return;
			}
			if(confirm("确认删除吗?"))
			{
				window.location.href="${ctx}/goods/deleteGoods?gId="+a;
			}
		});
		
	});
	function deleteLi(id)
	{
		if(confirm("确认删除吗?"))
		{
			window.location.href="${ctx}/goods/deleteGoods?gId="+id;
		}
	}
	</script>
</body>
</html>
