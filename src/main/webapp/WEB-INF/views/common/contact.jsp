<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp  = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Contact || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">Contact Us</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do">Home</a>
		</li>
		<li>Contact Us</li>
	</ul>
	<!-- Map Area Start -->
	<div class="map-area">
		<div id="googleMap" style="width: 100%; height: 445px;"></div>
	</div>
	<!-- Map Area End -->
	<!-- Address Information Area Start -->
	<div class="address-info-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4 hidden-sm">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span>
									<i class="fa fa-user-plus"></i>
								</span>
							</div>
							<div class="info">
								<h3>PHONE</h3>
								<p>+(02)-12345-6789-55</p>
								<p>+(05)-15689-5698-44</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span>
									<i class="fa fa-map-marker"></i>
								</span>
							</div>
							<div class="info">
								<h3>ADDRESS</h3>
								<p>Mhilara Street 205,</p>
								<p>Roitan city, USA.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="address-single no-margin">
						<div class="all-adress-info">
							<div class="icon">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="info">
								<h3>E-MAIL</h3>
								<p>info123@gmail.com</p>
								<p>www.companyweb.com</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Address Information Area End -->
	<!-- Contact Form Area Start -->
	<div class="contact-form-area">
		<div class="container">
			<div class="about-title">
				<h3>LEAVE A MESSAGE</h3>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form action="<%=cp %>/mail/mailSending.do" method="POST">
						<div class="row">
							<div class="col-md-5">
								<div class="contact-form-left">
									<input type="text" placeholder="Your Name" name="name" id="name" />
									<input type="email" placeholder="Your Email" name="tomail" id="tomail" />
									<input type="text" placeholder="Your phone" name="phone" id="phone" />
								</div>
							</div>
							<div class="col-md-7">
								<div class="contact-form-right">
									<div class="input-message">
										<textarea name="message" id="message" placeholder="Your Message"></textarea>
										<input class="btn btn-default" type="submit" value="SEND" name="submit" id="submit">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Form Area End -->
	<!-- Footer Area Start -->
	<footer>
		<div class="footer-top-area">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-8">
						<div class="footer-left">
							<a href="index.html">
								<img src="${pageContext.request.contextPath}/bootstrap/img/logo-2.png" alt="">
							</a>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</p>
							<ul class="footer-contact">
								<li>
									<i class="flaticon-location"></i>
									450 fifth Avenue, 34th floor. NYC
								</li>
								<li>
									<i class="flaticon-technology"></i>
									(+800) 123 4567 890
								</li>
								<li>
									<i class="flaticon-web"></i>
									info@bookstore.com
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2 col-sm-4">
						<div class="single-footer">
							<h2 class="footer-title">Information</h2>
							<ul class="footer-list">
								<li>
									<a href="about.html">About Us</a>
								</li>
								<li>
									<a href="#">Delivery Information</a>
								</li>
								<li>
									<a href="#">Privacy & Policy</a>
								</li>
								<li>
									<a href="#">Terms & Conditions</a>
								</li>
								<li>
									<a href="#">Manufactures</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2 hidden-sm">
						<div class="single-footer">
							<h2 class="footer-title">My Account</h2>
							<ul class="footer-list">
								<li>
									<a href="my-account.html">My Account</a>
								</li>
								<li>
									<a href="account.html">Login</a>
								</li>
								<li>
									<a href="cart.html">My Cart</a>
								</li>
								<li>
									<a href="wishlist.html">Wishlist</a>
								</li>
								<li>
									<a href="checkout.html">Checkout</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-2 hidden-sm">
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
							<ul class="social-icon">
								<li>
									<a href="#">
										<i class="flaticon-social"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="flaticon-social-1"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="flaticon-social-2"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="flaticon-video"></i>
									</a>
								</li>
							</ul>
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
								Copyright &copy; 2016
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
	<!-- Google Map js -->
	<script>
      function initMap() {
        var uluru = {lat: 37.498793, lng: 127.032867};
        var map = new google.maps.Map(document.getElementById('googleMap'), {
          zoom: 19,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPZcFFMWeb06l6P50zDK_MwZJnjV0vjMY&callback=initMap">
    </script>
</body>
</html>