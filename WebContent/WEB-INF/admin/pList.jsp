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
  
  
  window.parent.document.getElementById('leftFrame').contentWindow.changeLi_1();
});
  

  $(".clickAdd").click(function(){
	 window.location.href="${ctx}/person/addPerson"; 
  });
  
});
function searchlis(e){
	if(typeof(e)=="undefined")
	{
		e=1;
	}
	 window.location.href="${ctx}/person/pList?personName="+$("#personName").val()+"&pageIndex="+e+"&userName="+$("#userName").val();
}

</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">用户信息</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="clickAdd"><span><img src="${ctx }/static/images/t01.png" /></span>添加</li> 
        <li class="click"><span><img src="${ctx }/static/images/t02.png" /></span>修改</li>
        <li class="delClick"><span><img src="${ctx }/static/images/t03.png" /></span>删除</li>
        <%-- <li class="tongji"><span><img src="${ctx }/static/images/t04.png" /></span>统计</li> --%>
        </ul>
        
        
        <ul class="toolbar1">
        	<form action="${ctx }/person/pList" id="form1" method="post">
        	<li>用户名称:<input type="text"  class="dfinput_1" name="personName" id="personName" /></li>
        	<li>登录名称:<input type="text"  class="dfinput_1" name="userName" id="userName" /></li>
         	<a href="javascript:searchlis();"><li ><span><img src="${ctx }/static/images/t05.png" /></span>查询</li> </a>
         	</form>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="radio" value="" /></th>
        <th>编号<i class="sort"><img src="${ctx }/static/images/px.gif" /></i></th>
         <th>用户姓名</th>
        <th>用户角色</th>
        <th>用户性别</th>
        <th>用户电话</th>
        <th>用户公司</th>
        <th>用户岗位</th>
        <th>登录名称</th>
        <th>用户状态</th>
         <th>注册时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="person" items="${data.data }">
        	<tr>
	        <td><input name="personCheck" type="radio" value="${person.id }" /></td>
	        <td>${person.id }</td>
	        <td>${person.personname }</td>
	        <td>
	        	<c:choose>
	        		<c:when test="${person.role eq 0}">
	        			管理员
	        		</c:when>
	        		<c:otherwise>
	        			用户
	        		</c:otherwise>
	        	</c:choose>
	        </td>
	        <td>
	        	${ person.sexStr}
	        </td>
	        <td>${person.phone }</td>
	        <td>${person.company }</td>
	        <td>${person.post }</td>
	        <td>${person.username }</td>
	         <td>
	         <c:if test="${person.status eq 1 }">
	         <font style="color: red;"></c:if>
	         ${person.statusStr}
	         <c:if test="${person.status eq 1 }">
	         </font></c:if>
	         </td>
	        <td> <fmt:formatDate value="${person.createDate}" pattern="yyyy年MM月dd日 hh点mm分ss秒"></fmt:formatDate></td>
	        <td><a href="javascript:deleteLi('${person.id }')" class="tablelink"> 删除</a> &nbsp;
	          
	          <c:choose>
	          	<c:when test="${person.status eq 0 }">
	          		<a href="javascript:changeUser('${person.id }',1)" class="tablelink">禁用</a>
	          	</c:when>
	          	<c:when test="${person.status eq 1 }">
	          		<a href="javascript:changeUser('${person.id }',0)" class="tablelink">还原</a>
	          	</c:when>
	          </c:choose>
	          
	          <a href="javascript:resetPwd(${person.id });" class="tablelink">重置密码</a>
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
        <p>是否确认对信息的修改 ？</p>
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
				alert("请选择一条用户信息进行修改");
				return;
			}
			window.location.href="${ctx}/person/editPerson?id="+a;
		});
		$(".delClick").click(function(){
			var a = $("input[name='personCheck']:checked").val();
			if(typeof(a)=="undefined")
			{
				alert("请选择一条订单信息进行删除");
				return;
			}
			if(confirm("确认删除吗?"))
			{
				window.location.href="${ctx}/person/deletePerson?pId="+a;
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
			window.location.href="${ctx}/person/deletePerson?pId="+id;
		}
	}
	function changeUser(id,type)
	{
		var msg="";
		if(type==0)
		{
			msg="确定恢复此用户吗?";
		}
		else
		{
			msg="确定禁用此用户吗?"
		}
		if(confirm(msg))
		{
			window.location.href="${ctx}/person/changeUser?uId="+id+"&type="+type;
		}
	}
	function resetPwd(id)
	{
		debugger;
		window.location.href="${ctx}/person/resetPwd?uId="+id;
	}
	</script>
</body>
</html>
