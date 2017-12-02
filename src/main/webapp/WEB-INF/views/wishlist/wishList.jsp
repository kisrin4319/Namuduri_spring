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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
img.resize {
	width: 90px;
	height: 90px;
}
</style>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">WISH LIST</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do">Home</a>
		</li>
		<li>
			<a title="Return to List" href="<%=cp%>/books/booksList.do">Shopping</a>
		</li>
	</ul>
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
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=단편소설">
											<i class="fa fa-angle-double-right"></i>
											단편소설
											<span></span>
										</a>
									</li>
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=장편소설">
											<i class="fa fa-angle-double-right"></i>
											장편소설
											<span></span>
										</a>
									</li>
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=자기계발">
											<i class="fa fa-angle-double-right"></i>
											자기계발
											<span></span>
										</a>
									</li>
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=시/에세이">
											<i class="fa fa-angle-double-right"></i>
											시/에세이
											<span></span>
										</a>
									</li>
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=어린이(초등)">
											<i class="fa fa-angle-double-right"></i>
											어린이(초등)
											<span></span>
										</a>
									</li>
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=중/고등참고서">
											<i class="fa fa-angle-double-right"></i>
											중/고등 참고서
											<span></span>
										</a>
									</li>
									<li>
										<a href="<%=cp%>/books/booksList.do?book_category=취업/참고서">
											<i class="fa fa-angle-double-right"></i>
											취업/참고서
											<span></span>
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
											<input type="text" id="price" name="price" placeholder="Add Your Price" />
											<div class="widget-buttom">
												<input type="submit" value="Filter" />
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
										<a href="shop.html">
											<h5>Cold mountain</h5>
										</a>
										<h5>$ 50.00</h5>
										<ul>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
										</ul>
									</div>
								</div>
								<div class="single-seller">
									<div class="seller-img">
										<img src="${pageContext.request.contextPath}/bootstrap/img/shop/2.jpg" alt="" />
									</div>
									<div class="seller-details">
										<a href="">
											<h5>The historian</h5>
										</a>
										<h5>$ 50.00</h5>
										<ul>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
											<li>
												<i class="fa fa-star icolor"></i>
											</li>
										</ul>
									</div>
								</div>
							</aside>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="wishlist-right-area table-responsive">
						<form name="wishform">
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
									<c:choose>
										<c:when test="${wishList.size() == 0}">
											<tr>
												<h4>등록된 위시리스트가 없습니다.</h4>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="wish" items="${wishList}">
												<input type="hidden" id="wish_num" name="wish_num" value="${wish.wish_num }" />
												<input type="hidden" name="basket_book_num" value="${wish.wish_book_num}">
												<tr>
													<td class="product-image">
														<a href="<%=cp%>/books/booksList.do">
															<img class="resize" src="<%=cp%>/upload/${wish.wish_book_image}" alt="${wish.wish_book_name}">
														</a>
													</td>
													<td class="product-details">
														<h4>${wish.wish_book_name}</h4>
														<h5>
															<fmt:formatNumber pattern="###,###,###" value="${wish.wish_book_price}" />
															원
														</h5>
														<input type="text" placeholder="Please Enter Your Comment" size="40" value="${wish.wish_comment}" id="${wish.wish_num }">
														<input type="button" value="EDIT" onclick="Modify(${wish.wish_book_num },${wish.wish_num });">
													</td>
													<td class="product-cart">
														<div class="product-cart-details" style="margin-bottom: 10px; margin-top: 10px;">
															<input name="amount" id="count_${wish.wish_num }" type="number" value="${wish.wish_book_count}">
															<input type="button" value="ADD TO CART" onclick="isBasket(${wish.wish_book_num},count_${wish.wish_num })">
														</div>
													</td>
													<td class="product-remove">
														<a href="javascript:Delete(${wish.wish_num})">
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
					<div class="wishlist-bottom-link">
						<a class="wishlist-single-link" href="javascript: history.back(-1);">
							<i class="fa fa-angle-double-left"></i>
							BACK
						</a>
						<div class="shopingcart-bottom-area wishlist-bottom-area pull-right">
							<a href="<%=cp%>/wish/wishDeleteAll.do" class="right-shoping-cart">CLEAR WISHLIST</a>
							<a href="javascript:allBasket();" class="right-shoping-cart">ADD ALL TO CART</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<script type="text/javascript">
	function isBasket(book_num,wish_num) {
		 var is=confirm("장바구니에 담으시겠습니까?");
		 
		 var count=wish_num.value;
		 if(is==true) {
			location.href='<%=cp%>/basket/basketInsert.do?basket_book_num='+book_num+'&amount='+count;
		 } else {
		  return false;
		 }
		}
	
	function Delete(wish_num) {
		 var isbuy=confirm("삭제하시겠습니까?");
		 if(isbuy==true) {
			location.href='<%=cp%>/wish/wishDelete.do?wish_num='+wish_num;
		 } else {
		  return false;
		 }
		}
	   function allBasket() {
		      var all = confirm("장바구니에 담으시겠습니까?");
		      var product = eval("document.wishform");
		      if (all == true) {
		         document.wishform.action='<%=cp%>/basket/basketInsert.do';
		         product.submit();
		      } else {
		         return false;
		      }
		   }
		function Modify(book_num,wish_num) {
			 var modi=confirm("수정하시겠습니까?");
			 var comment = document.getElementById(wish_num).value;

			 if(modi==true) {
				location.href='<%=cp%>/wish/wishModify.do?wish_book_num='+book_num+'&wish_comment='+comment;
			 } else {
			  return false;
			 }
			}
	</script>
</body>
</html>