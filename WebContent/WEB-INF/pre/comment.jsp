<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${sitename}</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<jsp:include page="./common/static.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="./common/header.jsp"></jsp:include>
		<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <!-- search form -->
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
           <li class='<c:if test="${m.id==did }">active</c:if> '>
          <a href="${path}/index/usercenter">
            <i class="fa "></i> <span>我的预约</span>
          </a>
        </li><li class='<c:if test="${m.id==did }">active</c:if> '>
          <a href="${path}/index/comment">
            <i class="fa "></i> <span>我的评论</span>
          </a>
        </li>


      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12"></div>
					<div class="col-xs-12">
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>医生</th>
											<th>时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="d" items="${comments.data }">
											<tr>
												<td>${d.dname }</td>
												<td>${d.msg }</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
									</tfoot>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.7
			</div>
			<strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 2.2.3 -->
	<script src="${path}/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
	<!-- Morris.js charts -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="${path}/static/plugins/morris/morris.min.js"></script>
	<!-- Sparkline -->
	<script src="${path}/static/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="${path}/static/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${path}/static/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="${path}/static/plugins/knob/jquery.knob.js"></script>
	<!-- daterangepicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="${path}/static/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script src="${path}/static/plugins/datepicker/bootstrap-datepicker.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script src="${path}/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script src="${path}/static/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="${path}/static/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${path}/static/dist/js/app.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="${path}/static/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${path}/static/dist/js/demo.js"></script>
	<script type="text/javascript">

	function show(id){
		$("#comment_"+id).toggle();
	}
	function save(id){
		var content=$("#content_"+id).val();
		 $.ajax({
		     type:"post",
		     url:"${path}/index/savecomment?id="+id+"&msg="+content,
		     data:{},
		     dataType:"json",
		     success:function (data) {
		    	 debugger;
		     }


		 });
		 window.location.reload();

	}
	function book(id){

		var arr=[];
		$("input[name='book_"+id+"']:checked").each(

				function(){
			         arr.push($(this).val());
				}

				)
		if(arr.length>0){
			 $.ajax({
			     type:"post",
			     url:"${path}/index/appoint/add?id="+id,
			     data:{'arr':arr.join(",")},
			     dataType:"json",
			     success:function (data) {
			    	 debugger;

			     }


			 });
		 }
		 window.location.reload();
		 }
	</script>
</body>
</html>
