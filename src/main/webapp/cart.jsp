<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Shopping Cart || Witter Multipage Responsive Template</title>
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
        <!--Header Area Start-->
        
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
                                        </ul>
                                    </li>
                                    <li><a href="contact-us.html">CONTACT</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>		
		<!-- Mobile Menu End -->   
       
		<!-- Cart Area Start -->
		<div class="shopping-cart-area section-padding">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
                        <div class="wishlist-table-area table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="product-remove">Remove</th>
                                        <th class="product-image">Image</th>
                                        <th class="t-product-name">Product Name</th>
                                        <th class="product-edit">Edit</th>
                                        <th class="product-unit-price">Unit Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="${pageContext.request.contextPath}/bootstrap/img/shop/1.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="t-product-name">
                                            <h3>
                                                <a href="#">Cold mountain</a>
                                            </h3>
                                        </td>
                                        <td class="product-edit">
                                            <p>
                                                <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-unit-price">
                                            <p>$ 100</p>
                                        </td>
                                        <td class="product-quantity product-cart-details">
											<input type="number" value="1">
										</td>
                                        <td class="product-quantity">
											<p>$ 100</p>
										</td>
                                    </tr>
                                    <tr>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="${pageContext.request.contextPath}/bootstrap/img/shop/2.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="t-product-name">
                                            <h3>
                                                <a href="#">East of eden</a>
                                            </h3>
                                        </td>
                                        <td class="product-edit">
                                            <p>
                                               <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-unit-price">
                                            <p>$ 100</p>
                                        </td>
                                        <td class="product-quantity product-cart-details">
											<input type="number" value="1">
										</td>
                                        <td class="product-quantity">
											<p>$ 100</p>
										</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>	
                        <div class="shopingcart-bottom-area">
                            <a class="left-shoping-cart" href="#">CONTINUE SHOPPING</a>
                            <div class="shopingcart-bottom-area pull-right">
								<a class="right-shoping-cart" href="#">CLEAR SHOPPING CART</a>
								<a class="right-shoping-cart" href="#">UPDATE SHOPPING CART</a>
							</div>
                        </div>	                
		            </div>
		        </div>
		    </div>
		</div>
		<!-- Cart Area End -->
        <!-- Discount Area Start -->
        <div class="discount-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="discount-main-area">
                            <div class="discount-top">
                                <h3>DISCOUNT CODE</h3>
                                <p>Enter your coupon code if have one</p>
                            </div>
                            <div class="discount-middle">
                                <input type="text" placeholder="">
                                <a class="" href="#">APPLY COUPON</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <div class="subtotal-main-area">
                            <div class="subtotal-area">
                                <h2>SUBTOTAL<span>$ 200</span></h2>
                            </div>
                            <div class="subtotal-area">
                                <h2>GRAND TOTAL<span>$ 200</span></h2>
                            </div>
                            <a href="#">CHECKOUT</a>
                            <p>Checkout With Multiple Addresses</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Discount Area End -->	
		
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