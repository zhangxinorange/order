<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Registration Page</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<jsp:include page="./common/static.jsp"></jsp:include>
<![endif]-->
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="../../index2.html"><b>注册</a>
		</div>
		<div class="register-box-body">
			<p class="login-box-msg"></p>
			<form action="${path }/index/reg" id="form" method="post">
				<div class="form-group has-feedback">
					<input type="text" id= "username" name="username" class="form-control" placeholder="用户名"> <span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" id="certifyno" name="certifyno" class="form-control" placeholder="身份证"> <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" id="realname" name="realname" class="form-control" placeholder="真实姓名"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" id="phone" name="phone" class="form-control" placeholder="电话"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="radio" id="usex" name="usex" checked value="0" >男
					<input type="radio" id="usex" name="usex"  value="1" >女
				</div>
				<div class="form-group has-feedback">
					<input type="password" id="password" name="password" class="form-control" placeholder="密码"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" id="password2" name="password2" class="form-control" placeholder="确认密码"> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label> </label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type='submit' class="btn btn-primary btn-block btn-flat" >注册</button>
					</div>
					<!-- /.col -->
				</div>
			</form>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->
	<script>
	   $(function () {
	        $("#form").submit(function () {
	            var username = $("#username");
	            var certifyno = $("#certifyno");
	            var realname = $("#realname");
	            var phone = $("#phone");
	            var password = $("#password");
	            var password2 = $("#password2");
	            if (username.val().length == 0) {
	                alert('用户名不能为空');
	                return false;
	            }
	            if (certifyno.val().length == 0) {
	                alert('身份证不能为空');
	                return false;
	            }
	            if (realname.val().length == 0) {
	                alert('名称不能为空');
	                return false;
	            }
	            if (password.val().length == 0) {
	                alert('密码不能为空');
	                return false;
	            }
	            if (password.val()!= password2.val()) {
	                alert('密码不一致');
	                return false;
	            }
	        })
	    })
</script>
</body>
</html>
