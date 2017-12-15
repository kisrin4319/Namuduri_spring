<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home One || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
img.resize {
	width: 270px;
	height: 280px;
}

img.Newresize {
	width: 370px;
	height: 300px;
}
</style>
</head>
<body>
	<!-- slider Area Start -->
	<div class="slider-area">
		<div class="bend niceties preview-1">
			<div id="ensign-nivoslider" class="slides">
				<img src="${pageContext.request.contextPath}/bootstrap/img/slider/slider1.jpg" alt="" title="#slider-direction-1" />
				<img src="${pageContext.request.contextPath}/bootstrap/img/slider/slider2.jpg" alt="" title="#slider-direction-2" />
			</div>
			<!-- direction 1 -->
			<div id="slider-direction-1" class="text-center slider-direction">
				<!-- layer 1 -->
				<div class="layer-1">
					<h2 class="title-1">LET'S Look Around The Site.</h2>
				</div>
				<!-- layer 2 -->
				<div class="layer-2">
					<p class="title-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
				<!-- layer 3 -->
				<div class="layer-3">
					<a href="#" class="title-3">SEE MORE</a>
				</div>
				<!-- layer 4 -->
				<div class="layer-4">
					<form action="books/booksList.do" class="title-4">
						<input type="text" name="searchKeyword" placeholder="Enter your book keyword here">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!-- direction 2 -->
			<div id="slider-direction-2" class="slider-direction">
				<!-- layer 1 -->
				<div class="layer-1">
					<h2 class="title-1">LET’S WRITE IMAGINE</h2>
				</div>
				<!-- layer 2 -->
				<div class="layer-2">
					<p class="title-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
				<!-- layer 3 -->
				<div class="layer-3">
					<a href="#" class="title-3">SEE MORE</a>
				</div>
				<!-- layer 4 -->
				<div class="layer-4">
					<form action="#" class="title-4">
						<input type="text" placeholder="Enter your book title here">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->
	<!-- Online Banner Area Start -->
	<div class="online-banner-area">
		<div class="container">
			<div class="banner-title text-center">
				<h2>
					ONLINE
					<span>BOOK STORE</span>
				</h2>
				<p>The Namuduri is the biggest big store and the biggest books library in the world that has a lot of the popular and the most top category books presented here. Top Authors are here just subscribe your email address and get updated with us.</p>
			</div>
			<div class="row">
				<div class="banner-list">
					<c:forEach var="list" items="${newBookList }">
						<div class="col-md-4 col-sm-6">
							<div class="single-banner">
								<c:url var="viewURL" value="/books/bookDetail.do">
									<c:param name="book_num" value="${list.book_num}" />
								</c:url>
								<a href="${viewURL}" class="single-banner-image-wrapper">
									<img class="Newresize" alt="" src="${pageContext.request.contextPath}/upload/${list.book_image}" />
								</a>
								<div class="product-description">
									<div class="functional-buttons">
										<a href="javascript:isBasket(${list.book_num})" style="padding-top: 11px;">
											<i class="fa fa-shopping-cart"></i>
										</a>
										<a href="javascript:isWish(${list.book_num})" title="Add to Wishlist" style="padding-top: 11px;">
											<i class="fa fa-heart-o"></i>
										</a>
										<a href="#" title="Quick view" data-toggle="modal" data-target="#productModal" style="padding-top: 11px;">
											<i class="fa fa-compress"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="banner-bottom text-center">
								<a href="#">
									<fmt:formatNumber value="${list.book_price}" pattern="###,###,###" />
									원
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Online Banner Area End -->
	<!-- Shop Info Area Start -->
	<div class="shop-info-area">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="single-shop-info">
						<div class="shop-info-icon">
							<i class="flaticon-transport"></i>
						</div>
						<div class="shop-info-content">
							<h2>FREE SHIPPING</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="single-shop-info">
						<div class="shop-info-icon">
							<i class="flaticon-money"></i>
						</div>
						<div class="shop-info-content">
							<h2>FREE SHIPPING</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 hidden-sm">
					<div class="single-shop-info">
						<div class="shop-info-icon">
							<i class="flaticon-school"></i>
						</div>
						<div class="shop-info-content">
							<h2>FREE SHIPPING</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Info Area End -->
	<!-- Featured Product Area Start -->
	<div class="featured-product-area section-padding">
		<h2 class="section-title">FEATURED PRODUCTS</h2>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="tab-menu">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="first-item active">
								<a href="#arrival" aria-controls="arrival" role="tab" data-toggle="tab">New Arrival</a>
							</li>
							<li role="presentation">
								<a href="#sale" aria-controls="sale" role="tab" data-toggle="tab">BEST SELLERS</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="product-list tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="arrival">
						<div class="featured-product-list indicator-style">
							<c:forEach var="list" items="${booksDateList}" varStatus="stat" begin="0" end="5" step="1">
								<div class="single-p-banner">
									<div class="col-md-3">
										<div class="single-banner">
											<div class="product-wrapper">
												<c:url var="viewURL" value="/books/bookDetail.do">
													<c:param name="book_num" value="${booksDateList[stat.index].book_num}" />
												</c:url>
												<a href="${viewURL}" class="single-banner-image-wrapper">
													<img class="resize" alt="" src="${pageContext.request.contextPath}/upload/${booksDateList[stat.index].book_image}" />
													<div class="rating-icon">
														<c:if test="${booksDateList[stat.index].star_point == 0}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index].star_point == 1}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index].star_point == 2}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index].star_point == 3}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index].star_point == 4}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index].star_point == 5}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
														</c:if>
													</div>
												</a>
												<div class="product-description">
													<div class="functional-buttons">
														<a href="javascript:isBasket(${booksDateList[stat.index].book_num})" style="padding-top: 11px;">
															<i class="fa fa-shopping-cart"></i>
														</a>
														<a href="javascript:isWish(${booksDateList[stat.index].book_num})" title="Add to Wishlist" style="padding-top: 11px;">
															<i class="fa fa-heart-o"></i>
														</a>
														<a href="#" title="Quick view" data-toggle="modal" data-target="#productModal" style="padding-top: 11px;">
															<i class="fa fa-compress"></i>
														</a>
													</div>
												</div>
											</div>
											<div class="banner-bottom text-center">
												<a href="#">
													<fmt:formatNumber value="${booksDateList[stat.index].book_price}" pattern="###,###,###" />
													원
												</a>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="single-banner">
											<div class="product-wrapper">
												<c:url var="viewURL" value="/books/bookDetail.do">
													<c:param name="book_num" value="${booksDateList[stat.index+6].book_num}" />
												</c:url>
												<a href="${viewURL}" class="single-banner-image-wrapper">
													<img class="resize" alt="" src="${pageContext.request.contextPath}/upload/${booksDateList[stat.index+6].book_image}">
													<div class="rating-icon">
														<c:if test="${booksDateList[stat.index+6].star_point == 0}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index+6].star_point == 1}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index+6].star_point == 2}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index+6].star_point == 3}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index+6].star_point == 4}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${booksDateList[stat.index+6].star_point == 5}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
														</c:if>
													</div>
												</a>
												<div class="product-description">
													<div class="functional-buttons">
														<a href="javascript:isBasket(${booksDateList[stat.index+6].book_num})" style="padding-top: 11px;">
															<i class="fa fa-shopping-cart"></i>
														</a>
														<a href="javascript:isWish(${booksDateList[stat.index+6].book_num})" title="Add to Wishlist" style="padding-top: 11px;">
															<i class="fa fa-heart-o"></i>
														</a>
														<a href="#" title="Quick view" data-toggle="modal" data-target="#productModal" style="padding-top: 11px;">
															<i class="fa fa-compress"></i>
														</a>
													</div>
												</div>
											</div>
											<div class="banner-bottom text-center">
												<a href="#">
													<fmt:formatNumber value="${booksDateList[stat.index+6].book_price}" pattern="###,###,###" />
													원
												</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="sale">
						<div class="featured-product-list indicator-style">
							<c:forEach var="list" items="${bestSellerList}" varStatus="stat" begin="0" end="5" step="1">
								<div class="single-p-banner">
									<div class="col-md-3">
										<div class="single-banner">
											<div class="product-wrapper">
												<c:url var="viewURL" value="/books/bookDetail.do">
													<c:param name="book_num" value="${bestSellerList[stat.index].book_num}" />
												</c:url>
												<a href="${viewURL}" class="single-banner-image-wrapper">
													<img class="resize" alt="" src="${pageContext.request.contextPath}/upload/${bestSellerList[stat.index].book_image}" />
													<div class="rating-icon">
														<c:if test="${bestSellerList[stat.index].star_point == 0}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index].star_point == 1}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index].star_point == 2}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index].star_point == 3}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index].star_point == 4}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index].star_point == 5}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
														</c:if>
													</div>
												</a>
												<div class="product-description">
													<div class="functional-buttons">
														<a href="javascript:isBasket(${bestSellerList[stat.index].book_num})" style="padding-top: 11px;">
															<i class="fa fa-shopping-cart"></i>
														</a>
														<a href="javascript:isWish(${bestSellerList[stat.index].book_num})" title="Add to Wishlist" style="padding-top: 11px;">
															<i class="fa fa-heart-o"></i>
														</a>
														<a href="#" title="Quick view" data-toggle="modal" data-target="#productModal" style="padding-top: 11px;">
															<i class="fa fa-compress"></i>
														</a>
													</div>
												</div>
											</div>
											<div class="banner-bottom text-center">
												<a href="#">
													<fmt:formatNumber value="${bestSellerList[stat.index].book_price}" pattern="###,###,###" />
													원
												</a>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="single-banner">
											<div class="product-wrapper">
												<c:url var="viewURL" value="/books/bookDetail.do">
													<c:param name="book_num" value="${bestSellerList[stat.index+6].book_num}" />
												</c:url>
												<a href="${viewURL}" class="single-banner-image-wrapper">
													<img class="resize" alt="" src="${pageContext.request.contextPath}/upload/${bestSellerList[stat.index+6].book_image}">
													<div class="rating-icon">
														<c:if test="${bestSellerList[stat.index+6].star_point == 0}">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index+6].star_point == 1}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index+6].star_point == 2}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index+6].star_point == 3}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index+6].star_point == 4}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star"></i>
														</c:if>
														<c:if test="${bestSellerList[stat.index+6].star_point == 5}">
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
															<i class="fa fa-star icolor"></i>
														</c:if>
													</div>
												</a>
												<div class="product-description">
													<div class="functional-buttons">
														<a href="javascript:isBasket(${bestSellerList[stat.index+6].book_num})" style="padding-top: 11px;">
															<i class="fa fa-shopping-cart"></i>
														</a>
														<a href="javascript:isWish(${bestSellerList[stat.index+6].book_num})" title="Add to Wishlist" style="padding-top: 11px;">
															<i class="fa fa-heart-o"></i>
														</a>
														<a href="#" title="Quick view" data-toggle="modal" data-target="#productModal" style="padding-top: 11px;">
															<i class="fa fa-compress"></i>
														</a>
													</div>
												</div>
											</div>
											<div class="banner-bottom text-center">
												<a href="#">
													<fmt:formatNumber value="${bestSellerList[stat.index+6].book_price}" pattern="###,###,###" />
													원
												</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Featured Product Area End -->
	<!-- Counter Area Start -->
	<div class="counter-area section-padding text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
						<div class="counter-info">
							<span class="fcount">
								<span class="counter">3725</span>
							</span>
							<h3>BOOKS READ</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
						<div class="counter-info">
							<span class="fcount">
								<span class="counter">950</span>
							</span>
							<h3>ONLINE USERS</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
						<div class="counter-info">
							<span class="fcount">
								<span class="counter">1450</span>
							</span>
							<h3>BEST AUTHORS</h3>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="single-counter wow" data-wow-duration="1.5s" data-wow-delay=".3s">
						<div class="counter-info">
							<span class="fcount">
								<span class="counter">62</span>
							</span>
							<h3>AWARDS</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Counter Area End -->
	<!-- News Letter Area Start -->
	<div class="newsletter-area text-center" style="margin-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter-title">
						<h2>SUBSCRIBE OUR NEWSLETTER</h2>
						<p>Subscribe here with your email us and get up to date.</p>
					</div>
					<div class="letter-box">
						<form action="#" method="post" class="search-box">
							<div>
								<input type="text" placeholder="Subscribe us">
								<button type="submit" class="btn btn-search">
									SUBSCRIBE
									<span>
										<i class="flaticon-school-1"></i>
									</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- News Letter Area End -->
</body>
</html>