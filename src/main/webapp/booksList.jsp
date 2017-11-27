<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shop || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
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
<!-- modernizr css -->
<script src="<c:url value="bootstrap/js/vendor/modernizr-2.8.3.min.js" />"></script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Add your site or application content here -->
	<!-- Mobile Menu Start -->
	<div class="mobile-menu-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="mobile-menu">
						<nav id="dropdown">
							<ul>
								<li><a href="index.html">HOME</a></li>
								<li><a href="shop.html">FEATURED</a></li>
								<li><a href="shop.html">REVIEW BOOK</a></li>
								<li><a href="shop.html">ABOUT AUTHOR</a></li>
								<li><a href="shop.html">TESTIMONIAL</a></li>
								<li><a href="blog.html">pages</a>
									<ul>
										<li><a href="about.html">About Us</a></li>
										<li><a href="cart.html">Cart Page</a></li>
										<li><a href="checkout.html">Check Out</a></li>
										<li><a href="contact.html">Contact</a></li>
										<li><a href="login.html">Login</a></li>
										<li><a href="my-account.html">My Account</a></li>
										<li><a href="shop.html">Shopping Page</a></li>
										<li><a href="single-product.html">Single Shop Page</a></li>
										<li><a href="wishlist.html">Wishlist Page</a></li>
										<li><a href="404.html">404 Page</a></li>
									</ul></li>
								<li><a href="contact-us.html">CONTACT</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Mobile Menu End -->
	<!-- Shop Area Start -->
	<div class="shopping-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
							<aside class="widget widget-categories">
								<h2 class="sidebar-title text-center">CATEGORY</h2>
								<ul class="sidebar-menu" style="text-align: left;">
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 단편소설 <span>(5)</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 장편소설 <span>(8)</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 자기계발 <span>(4)</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 시/에세이 <span>(7)</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 어린이(초등) <span>(7)</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 중/고등 참고서 <span>(7)</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-angle-double-right"></i> 취업/참고서 <span>(7)</span>
									</a></li>
								</ul>
							</aside>
							<aside class="widget shop-filter">
								<h2 class="sidebar-title text-center">PRICE SLIDER</h2>
								<div class="info-widget">
									<div class="price-filter">
										<div id="slider-range"></div>
										<div class="price-slider-amount">
											<input type="text" id="amount" name="price" placeholder="Add Your Price" />
											<div class="widget-buttom">
												<input type="submit" value="Filter" /> <input type="reset" value="CLEAR" />
											</div>
										</div>
									</div>
								</div>
							</aside>
						</div>
						<div class="shop-widget-bottom">
							<aside class="widget widget-tag">
								<h2 class="sidebar-title">POPULAR TAG</h2>
								<ul class="tag-list">
									<li><a href="#">e-book</a></li>
									<li><a href="#">writer</a></li>
									<li><a href="#">book’s</a></li>
									<li><a href="#">eassy</a></li>
									<li><a href="#">nice</a></li>
									<li><a href="#">author</a></li>
								</ul>
							</aside>
							<aside class="widget widget-seller">
								<h2 class="sidebar-title">TOP SELLERS</h2>
								<div class="single-seller">
									<div class="seller-img">
										<img src="${pageContext.request.contextPath}/bootstrap/img/shop/1.jpg" alt="" />
									</div>
									<div class="seller-details">
										<a href="shop.html"><h5>Cold mountain</h5></a>
										<h5>$ 50.00</h5>
										<ul>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
										</ul>
									</div>
								</div>
								<div class="single-seller">
									<div class="seller-img">
										<img src="${pageContext.request.contextPath}/bootstrap/img/shop/2.jpg" alt="" />
									</div>
									<div class="seller-details">
										<a href=""><h5>The historian</h5></a>
										<h5>$ 50.00</h5>
										<ul>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
											<li><i class="fa fa-star icolor"></i></li>
										</ul>
									</div>
								</div>
							</aside>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="shop-tab-area">
						<div class="shop-tab-list">
							<div class="shop-tab-pill pull-left">
								<ul>
									<li class="active" id="left"><a data-toggle="pill" href="#home"><i class="fa fa-th"></i><span>Grid</span></a></li>
									<li><a data-toggle="pill" href="#menu1"><i class="fa fa-th-list"></i><span>List</span></a></li>
								</ul>
							</div>
							<div class="shop-tab-pill pull-right">
								<ul>
									<li class="product-size-deatils">
										<div class="show-label">
											<label>Show : </label> <select>
												<option value="10" selected="selected">10</option>
												<option value="09">09</option>
												<option value="08">08</option>
												<option value="07">07</option>
												<option value="06">06</option>
											</select>
										</div>
									</li>
									<li class="product-size-deatils">
										<div class="show-label">
											<label><i class="fa fa-sort-amount-asc"></i>Sort by : </label> <select>
												<option value="position" selected="selected">Position</option>
												<option value="Name">Name</option>
												<option value="Price">Price</option>
											</select>
										</div>
									</li>
									<li class="shop-pagination"><a href="#">1</a></li>
									<li class="shop-pagination"><a href="#">2</a></li>
									<li class="shop-pagination"><a href="#"><i class="fa fa-caret-right"></i></a></li>
								</ul>
							</div>
						</div>
						<!-- GRID 형식 -->
						<div class="tab-content">
							<div class="row tab-pane fade in active" id="home">
								<div class="shop-single-product-area">
									
									<c:forEach var="list" items="${booksList}" varStatus="stat">
									<div class="col-md-4 col-sm-6">
										<div class="single-banner">
											<div class="product-wrapper">
												<a href="#" class="single-banner-image-wrapper"> <img width="200" height="180" alt="" src="${pageContext.request.contextPath}/upload/${list.book_image}">
													<div class="rating-icon">
														<i class="fa fa-star icolor"></i> 
														<i class="fa fa-star icolor"></i> 
														<i class="fa fa-star icolor"></i> 
														<i class="fa fa-star"></i> 
														<i class="fa fa-star"></i>
													</div>
												</a>
												<div class="product-description">
													<div class="functional-buttons">
														<a href="#" title="Add to Cart"> <i class="fa fa-shopping-cart"></i>
														</a> <a href="#" title="Add to Wishlist"> <i class="fa fa-heart-o"></i>
														</a> <a href="#" title="Quick view" data-toggle="modal" data-target="#productModal"> <i class="fa fa-compress"></i>
														</a>
													</div>
												</div>
											</div>
											<div class="banner-bottom text-center">
												<a href="#">${list.book_price}원</a>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<!--LIST 형식  -->
							<div id="menu1" class="tab-pane fade">
								<div class="row">
									<div class="single-shop-product">
										<div class="col-xs-12 col-sm-5 col-md-4">
											<div class="left-item">
												<a href="single-product.html" title="East of eden"> <img src="${pageContext.request.contextPath}/bootstrap/img/featured/1.jpg" alt="">
												</a>
											</div>
										</div>
										<div class="col-xs-12 col-sm-7 col-md-8">
											<div class="deal-product-content">
												<h4>
													<a href="single-product.html" title="East of eden">East of eden</a>
												</h4>
												<div class="product-price">
													<span class="new-price">$ 140.00</span> <span class="old-price">$ 120.00</span>
												</div>
												<div class="list-rating-icon">
													<i class="fa fa-star icolor"></i> <i class="fa fa-star icolor"></i> <i class="fa fa-star icolor"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
												</div>
												<p>Faded short sleeves t-shirt with high neckline. Soft and stretchy material for a comfortable fit. Accessorize with a straw hat and you're ready for summer!</p>
												<div class="availability">
													<span>In stock</span> <span><a href="cart.html">Add to cart</a></span>
												</div>
											</div>
										</div>
									</div>
						
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="<c:url value ="bootstrap/js/vendor/jquery-1.12.0.min.js"/> "></script>
	<!-- bootstrap js -->
	<script src="<c:url value ="bootstrap/js/bootstrap.min.js"/> "></script>
	<!-- owl.carousel js -->
	<script src="<c:url value ="bootstrap/js/owl.carousel.min.js" />"></script>
	<!-- jquery-ui js -->
	<script src="<c:url value ="bootstrap/js/jquery-ui.min.js" />"></script>
	<!-- jquery Counterup js -->
	<script src="<c:url value ="bootstrap/js/jquery.counterup.min.js" />"></script>
	<script src="<c:url value ="bootstrap/js/waypoints.min.js" />"></script>
	<!-- jquery countdown js -->
	<script src="<c:url value ="bootstrap/js/jquery.countdown.min.js" />"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="<c:url value ="bootstrap/venobox/venobox.min.js" /> "></script>
	<!-- jquery Meanmenu js -->
	<script src="<c:url value ="bootstrap/js/jquery.meanmenu.js" /> "></script>
	<!-- wow js -->
	<script src="<c:url value ="bootstrap/js/wow.min.js" /> "></script>
	<script>
		new WOW().init();
	</script>
	<!-- scrollUp JS -->
	<script src="<c:url value ="bootstrap/js/jquery.scrollUp.min.js" /> "></script>
	<!-- plugins js -->
	<script src="<c:url value ="bootstrap/js/plugins.js" /> "></script>
	<!-- Nivo slider js -->
	<script src="<c:url value ="bootstrap/lib/js/jquery.nivo.slider.js" />" type="text/javascript"></script>
	<script src="<c:url value ="bootstrap/lib/home.js" />" type="text/javascript"></script>
	<!-- main js -->
	<script src="<c:url value ="bootstrap/js/main.js" /> "></script>
</body>
</html>