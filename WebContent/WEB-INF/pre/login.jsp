<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业订单管理系统</title>
<link href="${ctx }/static/css/style.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="${ctx }/static/js/jquery.js"></script>
<script src="${ctx }/static/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>

</head>

<body
	style="background-color: #1c77ac; background-image: url(${ctx }/static/images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">



	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<!-- <div class="logintop">
		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div> -->

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">

			<ul>
				<li><input name="userName" id="userName" type="text" class="loginuser" value="用户名"
					onclick="JavaScript:this.value=''" /></li>
				<li><input name="password" id="password" type="password" class="loginpwd" value="密码"
					onclick="JavaScript:this.value=''" /></li>
				<li><input id="loginBtn" type="button" class="loginbtn" value="登录"
					 /><label><input
						name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a id="forgetPwd"
						href="#">忘记密码？</a></label></li>
			</ul>


		</div>

	</div>



	<div class="loginbm"></div>
</body>
<script language="javascript">
	$(function(){
		$("#loginBtn").click(function(){
			var userName=$("#userName").val();
			var password=$("#password").val();
			if(userName==""||password=="")
			{
				alert("登录名或密码不能为空");
				return;
			}
			$.ajax({
                url: "${ctx}/index/login",
                data: { userName: userName ,password:password},
                type: "post",
                dataType:'json',
                success: function (data) {
               		if(data.code==0)
            		{
               			$("#formUpload").remove();
               			var form=$("<form id='formUpload' >");//定义一个form表单
            	        form.attr("style","display:none");
            	        form.attr("method","post");
            	        form.attr("action","${ctx}/index");
            	        $("body").append(form);//将表单放置在web中
            	        $("#formUpload").submit();
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
		
		$("#forgetPwd").click(function(){
			window.location.href="${ctx}/index/forgetPwd";
		});
	});
</script>
</html>



<%-- <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" forua="true" />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta name="format-detection" content="telephone=no" />
<link href="${path}/static/kcsj/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${path}/static/kcsj/css/common.css">
<script type="text/javascript" src="${path}/static/kcsj/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${path}/static/kcsj/js/alertPopShow.js"></script>
<script type="text/javascript">
$(function(){


   $('#demo2').on('click', function(){
		popTipShow.alert('忘记密码','请联系管理员重置密码！联系QQ：123456', ['知道了'],
			function(e){
			  //callback 处理按钮事件
			  var button = $(e.target).attr('class');
			  if(button == 'ok'){
				//按下确定按钮执行的操作
				//todo ....
				this.hide();
			  }
			}
		);
   });
  })
</script>
</head>

<body>
<div class="denglu_wk">
    <div class="denglu">
	    <form action="${path }/index/login">
	        <div class="denglu_tit">会员登录</div>
	        <div class="dl_xx"><input type="text" name="username" class="dl_txt" placeholder="username"/></div>
	        <div class="dl_xx"><input type="password" name="psw" class="dl_txt2" placeholder="psw"/></div>
	        <div class="dl_xx"><input type="submit" class="dl_but" value="登 录" /></div>
	        <div>
	            <div class="demo" id="demo2">忘记密码?</div>
	        </div>
	    </form>
    </div>
</div>
</body>
</html>
 --%>