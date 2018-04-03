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

<script type="text/javascript" src="${ctx }/static/js/select-ui.min.js"></script>
<script type="text/javascript" src="${ctx }/static/js/jquery.idTabs.min.js"></script>
<link href="${ctx }/static/css/select.css" rel="stylesheet" type="text/css" />


</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">添加订单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>订单信息</span></div>
    <form action="${ctx }/order/saveOrder" id="form1" method="post">
    <ul class="forminfo">
    <li><label>订单名称</label><input name="ordername" id="ordername" type="text" class="dfinput" /></li>
    <li><label>客户名称</label><input name="customname" id="customname" type="text" class="dfinput" /></li>
   <!--  <li><label>采购物资类型</label>
    	<input name="ordergood" id="ordergood" type="text" class="dfinput" />
    </li> -->
     <li><label>采购物资类型</label>
    	<!-- <input name="ordergood" id="ordergood" type="text" class="dfinput" /> -->
    	<div class="vocation">
    		<select class="select2" name="goodtype" id="goodtype" onchange="javascript:changeGoods();">
				   <c:forEach var="type" items="${tList }">
        				<option value="${type.tid }" >${type.tname }</option>
        			</c:forEach>
				   </select>
    </li>
    <li><label>采购物资</label>
    	<!-- <input name="ordergood" id="ordergood" type="text" class="dfinput" /> -->
    	<div class="vocation">
    		<select class="select2" name="ordergood" id="ordergood">
    			
			</select>
    </li>
    <li><label>采购数量</label><input name="ordernum" id="ordernum" type="number" class="dfinput"  /></li>
     <li><label>订单总金额</label><input name="ordertotal" type="number" class="dfinput"  />
    <input name="uId" type="hidden" value="${person.id }" /></li>
    <li><label>备注</label><textarea name="remark" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><input id="format" type="button" class="btn" value="确认保存"/>
    <input id="reset" type="button" class="btn" value="返回"/></li>
    </ul>
    </form>
    
    </div>
</body>
<script language="javascript">
	$(function(){
		$("#format").click(function(){
			if($("#ordername").val()=="")
			{
				alert("订单名称不能为空");
				return;
			}
			if($("#customname").val()=="")
			{
				alert("客户名称不能为空");
				return;
			}
			if($("#ordergood").val()=="")
			{
				alert("采购物资不能为空");
				return;r
			}
			if($("#ordernum").val()=="")
			{
				alert("采购数量不能为空");
				return;
			}
			if($("#ordertotal").val()=="")
			{
				alert("采购总金额不能为空");
				return;
			}
			$("#form1").submit();
			
		});
		$("#reset").click(function(){
			window.location.href="${ctx}/order/orderList";
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
	function changeGoods()
	{
		var type=$("#goodtype").val();
		$.ajax({
            url: "${ctx}/order/searchGoods",
            data: { type: type },
            type: "post",
            dataType:'json',
            success: function (data) {
           		if(data.code==0)
        		{
           			var d=eval(data.data);
           			$("#ordergood").val();
           			$("#ordergood").empty();
           			var str="<option value=''>请选择</option>";
           			$.each(d, function(i, p) {  //遍历json数组时，这么写p为索引，0,1
           				str += '<option value="'+p.gid+'">'+p.goodsname+'</option>';
           			});
           			$("#ordergood").append(str);
        		}
           		else
          		{
           				
          		}
           		
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
	}
</script>
</html>
