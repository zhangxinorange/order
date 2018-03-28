<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<header class="main-header">
	<!-- Logo -->
	<a href="${path }/index" class="logo">
		<!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini">${sitename }</span>
		<!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>${sitename}</b></span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<div class="collapse navbar-collapse pull-left">
			<ul class="nav navbar-nav" style="margin-left: 5px;">
				<!-- Messages: style can be found in dropdown.less-->
				<fmt:parseNumber value="${hid}" type="number" var="hid2"></fmt:parseNumber>
				<c:forEach items="${hoses }" var="one">
					<fmt:parseNumber value="${one.id}" type="number" var="id"></fmt:parseNumber>
					<li class="dropdown messages-menu <c:if test='${one.id==hid }'> active </c:if>">
						<a href="${path }/index/hospital/${one.id}" class="dropdown-toggle"> ${one.name } </a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown tasks-menu">
					<a href="${path }/index/alert"  >
						<i class="fa fa-flag-o"></i> <span class="label label-danger">${noread }</span></a>
				</li>
				<!-- Messages: style can be found in dropdown.less-->
				<li class="messages-menu">
					<a href="${path }/index/logout" class="dropdown-toggle"> 退出 </a>
				</li>
				<!-- Notifications: style can be found in dropdown.less -->
				<!-- User Account: style can be found in dropdown.less -->
				<li class="user user-menu">
					<a href="${path }/index/usercenter" class="dropdown-toggle">
						<img src="${indexUser.picurl}" class="user-image" alt="User Image">
						<span class="hidden-xs">${indexUser.name } 的个人中心</span>
					</a>
				</li>
				<!-- Control Sidebar Toggle Button -->
			</ul>
		</div>
	</nav>
</header>
