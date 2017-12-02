<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- Shop Area Start -->
        <div class="shopping-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="shop-widget">
                            <div class="shop-widget-top">
                                <aside class="widget widget-categories">
                                    <h2 class="sidebar-title text-center">CATEGORY</h2>
                                    <ul class="sidebar-menu">
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LEARNING                                          
                                                <span>(5)</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LIGHTING                                            
                                                <span>(8)</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                              <i class="fa fa-angle-double-right"></i>
                                               LIVING ROOMS
                                                <span>(4)</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LAMP                                           
                                                <span>(7)</span>
                                            </a>
                                        </li>
                                    </ul>
                                </aside> 
                                <aside class="widget shop-filter">
                                    <h2 class="sidebar-title text-center">PRICE SLIDER</h2>
                                    <div class="info-widget">
                                        <div class="price-filter">
                                            <div id="slider-range"></div>
                                            <div class="price-slider-amount">
                                                <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                                <div class="widget-buttom">
                                                    <input type="submit"  value="Filter"/>  
                                                    <input type="reset" value="CLEAR" />
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
                                        <li>
                                            <a href="#">e-book</a>
                                        </li>
                                        <li>
                                            <a href="#">writer</a>
                                        </li>
                                        <li>
                                            <a href="#">book’s</a>
                                        </li>
                                        <li>
                                            <a href="#">eassy</a>
                                        </li>
                                        <li>
                                            <a href="#">nice</a>
                                        </li>
                                        <li>
                                            <a href="#">author</a>
                                        </li>
                                    </ul>
                                </aside>
                                <aside class="widget widget-seller">
                                    <h2 class="sidebar-title">TOP SELLERS</h2>
                                    <div class="single-seller">
                                        <div class="seller-img">
                                            <img src="${pageContext.request.contextPath}/bootstrap/img/shop/1.jpg" alt="" />
                                        </div>
                                        <div class="seller-details">
                                            <a href="shop.html"><h5>Book’s</h5></a>
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
                                            <a href=""><h5>Book’s</h5></a>
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
                        <div class="wishlist-right-area table-responsive">
                            <table class="wish-list-table">
                                <thead>
                                    <tr>
                                        <th class="t-product-name">Products</th>
                                        <th class="product-details-comment">Product Details & Comment</th>
                                        <th class="product-price-cart">Add To Cart</th>
                                        <th class="w-product-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="${pageContext.request.contextPath}/bootstrap/img/wishlist/1.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="product-details">
                                            <h4>People of the book</h4>
                                            <input type="text" placeholder="Please Enter Your Comment" size="50">
                                        </td>
                                        <td class="product-cart">
                                            <div class="product-cart-details" style="margin-bottom: 10px; margin-top: 10px;">
                                                <span>$ 200.00</span>
                                                <input type="number" value="1">
                                                <input type="submit" value="ADD TO CART">
                                            </div>
                                        </td>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="wishlist-bottom-link">
                            <a class="wishlist-single-link" href="index.html">
                                <i class="fa fa-angle-double-left"></i>
                                Back
                            </a>
                            <div class="shopingcart-bottom-area wishlist-bottom-area pull-right">
                                <a href="#" class="right-shoping-cart">SHARE WISHLIST</a>
                                <a href="#" class="right-shoping-cart">ADD ALL TO CART</a>
                                <a href="#" class="right-shoping-cart">UPDATE WISHLIST</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Area End -->
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
		                            <li><a href="about.html">About Us</a></li>
		                            <li><a href="#">Delivery Information</a></li>
		                            <li><a href="#">Privacy & Policy</a></li>
		                            <li><a href="#">Terms & Conditions</a></li>
		                            <li><a href="#">Manufactures</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 hidden-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">My Account</h2>
		                        <ul class="footer-list">
		                            <li><a href="my-account.html">My Account</a></li>
		                            <li><a href="account.html">Login</a></li>
		                            <li><a href="cart.html">My Cart</a></li>
		                            <li><a href="wishlist.html">Wishlist</a></li>
		                            <li><a href="checkout.html">Checkout</a></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-md-2 hidden-sm">
		                    <div class="single-footer">
		                        <h2 class="footer-title">Shop</h2>
		                        <ul class="footer-list">
		                            <li><a href="#">Orders & Returns</a></li>
		                            <li><a href="#">Search Terms</a></li>
		                            <li><a href="#">Advance Search</a></li>
		                            <li><a href="#">Affiliates</a></li>
		                            <li><a href="#">Group Sales</a></li>
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
		                            <li><a href="#">Orders & Returns</a></li>
		                            <li><a href="#">Search Terms</a></li>
		                            <li><a href="#">Advance Search</a></li>
		                            <li><a href="#">Affiliates</a></li>
		                            <li><a href="#">Group Sales</a></li>
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
                                <p>Copyright &copy; 2016 <span><a href="#">DevItems</a></span>. All Right Reserved.</p>
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