<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/checkBox.css">
<!-- modernizr css -->
<script src="<%=cp %>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Add your site or application content here -->
	<h2 style="text-align: -webkit-center; padding-top: 30px;">SHOPPING CART</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do">Home</a>
		</li>
		<li>Shopping Cart</li>
	</ul>
	<!-- Cart Area Start -->
	<div class="shopping-cart-area section-padding" style="padding-top: 20px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="wishlist-table-area table-responsive">
						<form name="basketform" id="basketform">
							<table>
								<thead>
									<tr>
										<th class="product-edit">
											<div class="checkbox checkbox-primary">
												<input type="checkbox" id="checkbox2" onchange="fn_checkSum()" />
												<label for="checkbox2"> All Check </label>
											</div>
										</th>
										<th class="product-image">Image</th>
										<th class="t-product-name">Product Name</th>
										<th class="product-unit-price">Unit Price</th>
										<th class="product-edit">Category</th>
										<th class="product-quantity">Quantity</th>
										<th class="product-subtotal">Subtotal</th>
										<th class="product-edit">Buy Now</th>
										<th class="product-remove">Remove</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${basketList.size()==0 }">
											<strong>
												<font size="3">장바구니에 담겨있는 상품이 없습니다.</font>
											</strong>
										</c:when>
										<c:otherwise>
											<c:forEach var="row" items="${basketList }" varStatus="i">
												<input type="hidden" id="basket_num" name="basket_num" value="${row.basket_num }" />
												<input type="hidden" id="basket_book_num" name="basket_book_num" value="${row.basket_book_num}" />
												<tr>
													<td class="product-edit">
														<div class="checkbox checkbox-primary">
															<p>
																<input type="checkbox" name="RowCheck" value="${row.basket_book_price*row.basket_book_count }" id="checkbox2" onchange="fn_checkSum()" />
																<label for="checkbox2"></label>
															</p>
														</div>
													</td>
													<td class="product-image">
														<a href="javascript:;" onclick="fn_bookDetail(${row.basket_book_num})">
															<img src="<%=cp %>/upload/${row.basket_book_image }" alt="" width="104px" height="104px">
														</a>
													</td>
													<td class="t-product-name">
														<h3>
															<a href="javascript:;" onclick="fn_bookDetail(${row.basket_book_num})">${row.basket_book_name }</a>
														</h3>
													</td>
													<td class="product-unit-price">
														<p>
															<fmt:formatNumber pattern="###,###,###" value="${row.basket_book_price}" groupingUsed="true" />
															원
														</p>
													</td>
													<td class="product-edit">
														<p>${row.book_category }</p>
													</td>
													<td class="product-quantity product-cart-details">
														<input type="text" name="book_count" maxlength="2" id="${row.basket_num }" value="${row.basket_book_count}" size="1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode: disabled;' />
														<button type="button" class="normal-btn small1 js-goods-cnt-change" onclick="fn_basketModify(${row.basket_num})">
															<em>수정</em>
														</button>
													</td>
													<td class="product-quantity">
														<p>
															<fmt:formatNumber pattern="###,###,###" value="${row.basket_book_price*row.basket_book_count}" groupingUsed="true" />
															원
														</p>
													</td>
													<td class="product-edit">
														<p>
															<a href="javascript:;" onclick="singleOrder(${row.basket_book_num}, ${row.basket_book_count}, ${row.basket_num})" class="right-shoping-cart">BUY NOW</a>
														</p>
													</td>
													<td class="product-remove">
														<a href="javascript:;" onclick="fn_basketDelete(${row.basket_num})">
															<i class="flaticon-delete"></i>
														</a>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</form>
					</div>
					<div class="shopingcart-bottom-area">
						<a class="left-shoping-cart" href="javascript:;">CONTINUE SHOPPING</a>
						<div class="shopingcart-bottom-area pull-right">
							<a class="right-shoping-cart" href="javascript:;" id="deleteAll">CLEAR SHOPPING CART</a>
							<a class="right-shoping-cart" href="javascript:;" onclick="fn_selectDelete()">CLEAR SELECTED SHOPPING CART</a>
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
							<h2>
								SUBTOTAL
								<span>
									<input type="text" id="SubTotal" value="0" style="border: 0; font-size: x-large; text-align: center; vertical-align: baseline; font-weight: unset;" size="10" readOnly />
									원
								</span>
							</h2>
						</div>
						<div class="subtotal-area">
							<input type="hidden" id="fee" value="0" size="4" />
							<h2>
								GRAND TOTAL
								<span>
									<input type="text" id="sum" value="0" style="border: 0; font-size: x-large; text-align: center; vertical-align: baseline; font-weight: unset;" size="10" readOnly />
									원
								</span>
							</h2>
						</div>
						<a href="javascript:;" onclick="fn_selectOrder()">SELECTED CHECKOUT</a>
						<a href="javascript:;" onclick="fn_totalOrder()">CHECKOUT</a>
						<p>Checkout With Multiple Addresses</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Discount Area End -->
	<script src ="<%=cp%>/bootstrap/js/custom.js"></script>
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
	<script src="<%=cp %>/bootstrap/js/main.js"></script>
</body>
</html>