<%	String cp = request.getContextPath();	%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicon.png">
<!-- Bootstrap Core CSS -->
<link href="<%=cp%>/adminBootStrap/css/bootstrap.min.css"
	rel="stylesheet">
<!--This page css - Morris CSS -->
<link href="<%=cp%>/adminBootStrap/css/c3.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=cp%>/adminBootStrap/css/style.css" rel="stylesheet">
<!-- You can change the theme colors from here -->
<link href="<%=cp%>/adminBootStrap/css/blue.css" id="theme"
	rel="stylesheet">
</head>

<body>
	<nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=cp%>/main.do">
				<!-- <b><img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" /></b>
				<span><img src="../assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> -->
			</a>
		</div>
	</nav>
	<!-- ============================================================== -->
	<!-- End Topbar header -->
	<!-- ============================================================== -->

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
	<!--c3 JavaScript -->
	<script src="<%=cp%>/adminBootStrap/js/d3.min.js"></script>
	<script src="<%=cp%>/adminBootStrap/js/c3.min.js"></script>
	<!-- Chart JS -->
	<script src="<%=cp%>adminBootStrap/js/dashboard1.js"></script>
</body>
</html>
