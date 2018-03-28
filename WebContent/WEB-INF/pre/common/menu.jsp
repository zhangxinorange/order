<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<!-- search form -->
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class=''>
				<a href="${path}/index/news">
					<i class="fa fa-group"></i> <span>新闻</span>
				</a>
			</li>
			<li class=''>
				<a href="${path}/index/notice">
					<i class="fa fa-tv"></i> <span>公告</span>
				</a>
			</li>
			<li class=''>
				<a href="${path}/index/file">
					<i class="fa fa-book"></i> <span>文件</span>
				</a>
			</li>
			
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
