<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
    </div>
  </footer>
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
<script src="${path }/static/dist/js/raphael-min.js"></script>
<script src="${path}/static/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="${path}/static/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${path}/static/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${path}/static/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="${path}/static/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="${path}/static/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="${path}/static/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
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
<script src="${path}/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
