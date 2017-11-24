<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
</head>

<body>
	<aside class="left-sidebar">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav">
					<li>
						<a class="waves-effect waves-dark" href="<%=cp%>/admin/main.do" aria-expanded="false">
						<i class="mdi mdi-gauge"></i><span class="hide-menu">Dashboard</span></a>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="<%=cp%>/admin/memberList.do" aria-expanded="false">
						<i class="mdi mdi-account-check"></i><span class="hide-menu">MEMBER</span></a>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="<%=cp%>/admin/bookList.do" aria-expanded="false">
						<i class="mdi mdi-table"></i><span class="hide-menu">TEXTBOOK</span></a>
					</li>
					<li><a class="waves-effect waves-dark" href="<%=cp%>/admin/orderList.do" aria-expanded="false">
						<i class="mdi mdi-emoticon"></i><span class="hide-menu">ORDER</span></a>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="map-google.html" aria-expanded="false">
						<i class="mdi mdi-earth"></i><span class="hide-menu">Google Map</span></a>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="pages-blank.html" aria-expanded="false">
						<i class="mdi mdi-book-open-variant"></i><span class="hide-menu">Blank Page</span></a>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="pages-error-404.html" aria-expanded="false">
						<i class="mdi mdi-help-circle"></i><span class="hide-menu">Error 404</span></a>
					</li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
		<!-- Bottom points-->
		<div class="sidebar-footer">
			<!-- item-->
			<a href="" class="link" data-toggle="tooltip" title="Settings"><i
				class="ti-settings"></i></a>
			<!-- item-->
			<a href="" class="link" data-toggle="tooltip" title="Email"><i
				class="mdi mdi-gmail"></i></a>
			<!-- item-->
			<a href="" class="link" data-toggle="tooltip" title="Logout"><i
				class="mdi mdi-power"></i></a>
		</div>
		<!-- End Bottom points-->
	</aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
</body>

</html>
