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
<script language="JavaScript" src="${ctx }/static/js/echarts.min.js"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">订单统计</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>订单信息</span></div>
    <div id="container" style="height: 600px;"></div>
     <input id="reset" type="button" class="btn" value="返回"/></li>
    </div>
</body>
<script language="javascript">
	$(function(){
		$.ajax({
            url: "${ctx}/order/tongji",
            type: "post",
            dataType:'json',
            success: function (data) {
            	var dom = document.getElementById("container");
        		var myChart = echarts.init(dom);
        		var app = {};
        		option = null;
        		option = {
        		    title : {
        		        text: data.userName+'订单情况一览',
        		        subtext: '单位:元',
        		        x:'center'
        		    },
        		    tooltip : {
        		        trigger: 'item',
        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
        		    },
        		    legend: {
        		        orient: 'vertical',
        		        left: 'left',
        		        data: data.title
        		    },
        		    series : [
        		        {
        		            name: '订单金额',
        		            type: 'pie',
        		            radius : '55%',
        		            center: ['50%', '60%'],
        		            data:data.value,
        		            itemStyle: {
        		                emphasis: {
        		                    shadowBlur: 10,
        		                    shadowOffsetX: 0,
        		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        		                }
        		            }
        		        }
        		    ]
        		};
        		;
        		if (option && typeof option === "object") {
        		    myChart.setOption(option, true);
        		}
           		
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        }); 
		
		$("#reset").click(function(){
			parent.location.href="${ctx}/index";
		});
	});
</script>
</html>
