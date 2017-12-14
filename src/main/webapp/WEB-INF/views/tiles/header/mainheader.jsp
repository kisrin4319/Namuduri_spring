<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>WishList || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/venobox/venobox.css" type="text/css" media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/preview.css" type="text/css" media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/checkBox.css">
<!-- modernizr css -->
<script src="<%=cp%>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>

</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Add your site or application content here -->
	<!--Header Area Start-->
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-6 col-xs-6">
					<div class="header-logo">
						<a href="<%=cp%>/main.do">
							<img src="${pageContext.request.contextPath}/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
					<div class="header-right">
						<ul>
							<li class="shoping-cart" style="vertical-align: unset;">
								<a href="#">
									<c:if test="${empty member_id}">
										<i class="flaticon-people"></i>
									</c:if>
									<c:if test="${not empty member_id }">
										<c:if test="${member_id!='admin' }">
											<img src="<%=cp%>/img/member.png" width="20" height="20">
										</c:if>
										<c:if test="${member_id=='admin' }">
											<img src="<%=cp%>/img/member(admin).png" width="20" height="20">
										</c:if>
									</c:if>
								</a>
								<div class="add-to-cart-product">
									<div class="cart-checkout">
										<c:if test="${empty member_id}">
											<a href="<%=cp%>/member/loginForm.do">
												Sign In
												<i class="fa fa-chevron-right"></i>
											</a>
										</c:if>
										<c:if test="${not empty member_id }">
											<a href="<%=cp%>/member/logOut.do"> SIGN OUT </a>
										</c:if>
									</div>
									<c:if test="${empty member_id}">
									<div class="cart-checkout">
										<a href="<%=cp%>/member/memberInfo.do">
											Sign Up
											<i class="fa fa-chevron-right"></i>
										</a>
									</div>
									</c:if>
									<c:if test="${not empty member_id && member_id eq 'admin'}">
										<div class="cart-checkout">
										<a href="<%=cp%>/admin/main.do">
											Admin Main
											<i class="fa fa-chevron-right"></i>
										</a>
									</div>
									</c:if>
								</div>
							</li>
							<li class="shoping-cart">
								<a href="<%=cp%>/basket/basketList.do">
									<i class="flaticon-shop"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 hidden-xs">
					<div class="mainmenu text-center">
						<nav>
							<ul id="nav">
								<li>
									<a href="<%=cp%>/books/booksList.do">NEW BOOKS</a>
								</li>
								<li>
									<a href="<%=cp%>/books/usedBooksList.do">USED BOOKS</a>
								</li>
								<li>
									<a href="<%=cp%>/wish/wishList.do">WISH LIST</a>
								</li>
								<li>
									<a href="<%=cp%>/mypage.do">MY PAGE</a>
									<ul class="sub-menu">
										<li>
											<a href="<%=cp%>/member/memberModifyView.do">MANAGE ACCOUNT</a>
										</li>
										<li>
											<a href="<%=cp%>/order/orderListCheckView.do">ORDER STATUS</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#">SERVICE CENTER</a>
									<ul class="sub-menu">
										<li>
											<a href="<%=cp%>/board/boardList.do">Q&A</a>
										</li>
										<li>
											<a href="<%=cp%>/faq/faqList.do">FAQ</a>
										</li>
									</ul>
								<li>
									<a href="<%=cp%>/common/contact.do">CONTACT</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-md-1 hidden-sm">
					<div class="header-right">
						<ul>
							<li class="shoping-cart" style="vertical-align: unset;">
								<a href="#">
									<c:if test="${empty member_id}">
										<i class="flaticon-people"></i>
									</c:if>
									<c:if test="${not empty member_id }">
										<c:if test="${member_id!='admin' }">
											<img src="<%=cp%>/img/member.png" width="20" height="20">
										</c:if>
										<c:if test="${member_id=='admin' }">
											<img src="<%=cp%>/img/member(admin).png" width="20" height="20">
										</c:if>
									</c:if>
								</a>
								<div class="add-to-cart-product">
									<div class="cart-checkout">
										<c:if test="${empty member_id }">
											<a href="<%=cp%>/member/loginForm.do">
												Sign In
												<i class="fa fa-chevron-right"></i>
											</a>
											<a href="javascript:;" onclick="startApp()">
												GOOGLE LOGIN
												<i class="fa fa-chevron-right"></i>
											</a>
										</c:if>
										<c:if test="${not empty member_id }">
											<a href="<%=cp%>/member/logOut.do"> Sign Out </a>
										</c:if>
									</div>
									<c:if test="${empty member_id}">
									<div class="cart-checkout">
										<a href="<%=cp%>/member/memberInfo.do">
											Sign Up
											<i class="fa fa-chevron-right"></i>
										</a>
									</div>
									</c:if>
									<c:if test="${not empty member_id && member_id eq 'admin'}">
										<div class="cart-checkout">
										<a href="<%=cp%>/admin/main.do">
											Admin Main
											<i class="fa fa-chevron-right"></i>
										</a>
									</div>
									</c:if>
								</div>
							</li>
							<li class="shoping-cart">
								<a href="<%=cp%>/basket/basketList.do">
									<i class="flaticon-shop"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Area End-->
	<!-- Mobile Menu Start -->
	<div class="mobile-menu-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="mobile-menu">
						<nav id="dropdown">
							<ul>
								<li>
									<a href="<%=cp%>/main.do">HOME</a>
								</li>
								<c:if test="${member_id==null }">
									<li>
										<a href="<%=cp%>/member/loginForm.do">SIGN IN</a>
									</li>
								</c:if>
								<c:if test="${member_id!=null }">
									<a href="<%=cp%>/member/loginOut.do">SIGN OUT</a>
								</c:if>
								<li>
									<a href="<%=cp%>/books/booksList.do">NEW BOOKS</a>
								</li>
								<li>
									<a href="<%=cp%>/books/usedBooksList.do">USED BOOKS</a>
								</li>
								<li>
									<a href="<%=cp%>/wish/wishList.do">WISH LIST</a>
								</li>
								<li>
									<a href="<%=cp%>/mypage.do">MY PAGE</a>
									<ul>
										<li>
											<a href="<%=cp%>/basket/basketList.do">Basket</a>
										</li>
										<li>
											<a href="/member/memberModifyView.do">My Account</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="<%=cp%>/etc/contact.do">CONTACT</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Mobile Menu End -->
</body>
</html>