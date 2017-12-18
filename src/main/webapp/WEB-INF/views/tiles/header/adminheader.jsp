<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap Core CSS -->
<link href="<%=cp%>/adminBootStrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--This page css - Morris CSS -->
<link href="<%=cp%>/adminBootStrap/css/c3.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=cp%>/adminBootStrap/css/style.css" rel="stylesheet">
<!-- You can change the theme colors from here -->
<link href="<%=cp%>/adminBootStrap/css/blue.css?ver=1" id="theme"
	rel="stylesheet">
<!-- chartist CSS -->
<link href="<%=cp%>/adminBootStrap/css/chartist.min.css"
	rel="stylesheet">
<link href="<%=cp%>/adminBootStrap/css/chartist-init.css"
	rel="stylesheet">
<link href="<%=cp%>/adminBootStrap/css/chartist-plugin-tooltip.css"
	rel="stylesheet">

<%-- <link href="<%=cp%>/css/adminPage.css?ver=1" rel="stylesheet"
	type="text/css" /> --%>

<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="<%=cp%>/adminBootStrap/js/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="<%=cp%>/adminBootStrap/js/tether.min.js"></script>
<script src="<%=cp%>/adminBootStrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<%=cp%>/adminBootStrap/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="<%=cp%>/adminBootStrap/js/waves.js"></script>
<!--Menu sidebar -->
<script src="<%=cp%>/adminBootStrap/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="<%=cp%>/adminBootStrap/js/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="<%=cp%>/adminBootStrap/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!-- Chart JS -->
<script src="<%=cp%>adminBootStrap/js/dashboard.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="<%=cp%>/adminBootStrap/css/datepicker.css">
<script src="<%=cp%>/adminBootStrap/js/bootstrap-datepicker.js"></script>

</head>

<body>
	<header class="topbar">
		<nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=cp%>/main.do"> 
				<!-- Logo icon -->
					<i class="wi wi-sunset"></i>
					<!-- <img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" /> -->
				<!-- Logo text --> 
					<span> 
						<!-- <img src="../assets/images/logo-light-text.png" class="light-logo" alt="homepage" /> -->
						<font>NAMUDURI</font>
					</span>
				</a>
			</div>
			<div class="navbar-collapse">
				<!-- ============================================================== -->
				<!-- toggle and nav items -->
				<!-- ============================================================== -->
				<ul class="navbar-nav mr-auto mt-md-0">
					<li class="nav-item"><a
						class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark"
						href="javascript:void(0)"> <i class="mdi mdi-menu"></i></a></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>
