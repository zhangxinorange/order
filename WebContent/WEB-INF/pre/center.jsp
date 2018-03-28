<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="./common/static.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="./common/header.jsp"></jsp:include>
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="./common/menu.jsp"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header"></section>
			<!-- Main content -->
			<section class="content">
				<div class="box">
					<div class="box-header with-border">
						姓名：
						<h3 class="box-title">${indexUser.name}</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="box-body">							<img src="${indexUser.picurl }" style="width:250px;">
					
						<div class="form-group">
							<label for="content">用户名：</label> ${indexUser.username }
						</div>
						<div class="form-group">
							<label for="content">电话：</label> ${indexUser.tel }
						</div>
						<div class="form-group">
							<label for="content">地址：</label> ${indexUser.address }
						</div><div class="form-group">
							<label for="content">职位：</label> ${indexUser.rolename }
						</div><div class="form-group">
							<label for="content">部门：</label> ${indexUser.ogname }
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer"></div>
					<!-- /.box-footer-->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
	</div>
	<jsp:include page="./common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(function () {
//Date picker
$('#created').datepicker({
autoclose: true
});

});
</script>
</html>
