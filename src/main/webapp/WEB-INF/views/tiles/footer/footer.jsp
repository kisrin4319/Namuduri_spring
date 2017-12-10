<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<body>
	<footer>
		<div class="footer-top-area">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-8">
						<div class="footer-left">
							<a href="index.html">
								<img src="${pageContext.request.contextPath}/img/footerLogo.png" style="padding-top: 30px; margin-top: 10px;">
							</a>
							<ul class="footer-contact">
								<li>
									<i class="flaticon-location"></i>
									Gangnam-gu, Seoul
								</li>
								<li>
									<i class="flaticon-technology"></i>
									1544-9970
								</li>
								<li>
									<i class="flaticon-web"></i>
									namuduri@namuduri.com
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2 col-sm-4">
						<div class="single-footer">
							<h2 class="footer-title">My Account</h2>
							<ul class="footer-list">
								<li>
									<a href="<%=cp%>/member/loginForm.do">&nbsp;Login</a>
								</li>
								<li>
									<a href="<%=cp%>/basket/basketList.do">&nbsp;My Cart</a>
								</li>
								<li>
									<a href="<%=cp%>/wish/wishList.do">&nbsp;Wish List</a>
								</li>
								<li>
									<a href="<%=cp%>/member/memberModifyView.do">&nbsp;Manage Account</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2 hidden-sm">
						<div class="single-footer">
							<h2 class="footer-title">Shop</h2>
							<ul class="footer-list">
								<li>
									<a href="<%=cp%>/main.do">&nbsp;Main</a>
								</li>
								<li>
									<a href="<%=cp%>/books/best.do">&nbsp;Best Seller</a>
								</li>
								<li>
									<a href="<%=cp%>/books/booksList.do">&nbsp;New Books</a>
								</li>
								<li>
									<a href="<%=cp%>/books/usedBooksList.do">&nbsp;Used Books</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2 hidden-sm" style="text-align: left;">
						<div class="single-footer">
							<h2 class="footer-title">Service</h2>
							<ul class="footer-list">
								<li>
									<a href="#">&nbsp;FAQ</a>
								</li>
								<li>
									<a href="<%=cp%>/board/boardList.do">&nbsp;Q&A</a>
								</li>
								<li>
									<a href="<%=cp%>/etc/contact.do">&nbsp;Contact</a>
								</li>
								<li>
									<a href="<%=cp%>/mypage.do">&nbsp;My Page</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-8">
						<div class="single-footer footer-newsletter">
							<h2 class="footer-title">Our Newsletter</h2>
							<p>Consectetur adipisicing elit se do eiusm od tempor incididunt ut labore et dolore magnas aliqua.</p>
							<form action="#" method="post">
								<div>
									<input type="text" placeholder="email address">
								</div>
								<button class="btn btn-search btn-small" type="submit">SUBSCRIBE</button>
								<i class="flaticon-networking"></i>
							</form>
						</div>
					</div>
					<div class="col-md-2 col-sm-4 visible-sm">
						<div class="single-footer">
							<h2 class="footer-title">Shop</h2>
							<ul class="footer-list">
								<li>
									<a href="#">Orders & Returns</a>
								</li>
								<li>
									<a href="#">Search Terms</a>
								</li>
								<li>
									<a href="#">Advance Search</a>
								</li>
								<li>
									<a href="#">Affiliates</a>
								</li>
								<li>
									<a href="#">Group Sales</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="footer-bottom-left pull-left">
							<p>
								Copyright &copy; Namuduri.com 2017
								<span>
									<a href="#">DevItems</a>
								</span>
								. All Right Reserved.
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="footer-bottom-right pull-right">
							<img src="${pageContext.request.contextPath}/bootstrap/img/paypal.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Area End -->
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="<%=cp%>/bootstrap/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="<%=cp%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="<%=cp%>/bootstrap/js/owl.carousel.min.js"></script>
	<!-- jquery-ui js -->
	<script src="<%=cp%>/bootstrap/js/jquery-ui.min.js"></script>
	<!-- jquery Counterup js -->
	<script src="<%=cp%>/bootstrap/js/jquery.counterup.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/waypoints.min.js"></script>
	<!-- jquery countdown js -->
	<script src="<%=cp%>/bootstrap/js/jquery.countdown.min.js"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="<%=cp%>/bootstrap/venobox/venobox.min.js"></script>
	<!-- jquery Meanmenu js -->
	<script src="<%=cp%>/bootstrap/js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="<%=cp%>/bootstrap/js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- scrollUp JS -->
	<script src="<%=cp%>/bootstrap/js/jquery.scrollUp.min.js"></script>
	<!-- plugins js -->
	<script src="<%=cp%>/bootstrap/js/plugins.js"></script>
	<!-- Nivo slider js -->
	<script src="<%=cp%>/bootstrap/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="<%=cp%>/bootstrap/lib/home.js" type="text/javascript"></script>
	<!-- main js -->
	<script src="<%=cp%>/bootstrap/js/main.js?ver=1"></script>
</body>
</html>