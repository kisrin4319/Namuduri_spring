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
<title>Shop || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<style type="text/css">
img.resize {
	width: 220px;
	height: 280px;
}

img.top2 {
	width: 104px;
	height: 104px;
}
</style>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">SHOPPING BOOK PAGE</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do">Home</a>
		</li>
		<li>
			<a title="Go to Basket" href="<%=cp%>/basket/basketList.do">Basket</a>
		</li>
	</ul>
	<!-- Shop Area Start -->
	<form name="frmList">
		<div class="shopping-area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-3 col-xs-12">
						<div class="shop-widget">
							<div class="shop-widget-top">
								<aside class="widget widget-categories">
									<h2 class="sidebar-title text-center">CATEGORY</h2>
									<ul class="sidebar-menu" style="text-align: left;">
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=단편소설">
												<i class="fa fa-angle-double-right"></i>
												short story
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=장편소설">
												<i class="fa fa-angle-double-right"></i>
												feature novel
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=자기계발">
												<i class="fa fa-angle-double-right"></i>
												self-development
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=시/에세이">
												<i class="fa fa-angle-double-right"></i>
												poem & essay
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=어린이(초등)">
												<i class="fa fa-angle-double-right"></i>
												kids & schoolchild
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=중/고등참고서">
												<i class="fa fa-angle-double-right"></i>
												teenager
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/booksList.do?book_category=취업/참고서">
												<i class="fa fa-angle-double-right"></i>
												job applicants
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
													<input type="button" value="Filter" onclick="fn_slider()" />
													<input type="reset" value="CLEAR" />
												</div>
											</div>
										</div>
									</div>
								</aside>
							</div>
							<div class="shop-widget-bottom">
								<!-- 베스트 셀러 TOP2 -->
								<aside class="widget widget-seller">
									<h2 class="sidebar-title" style="margin-bottom: 5px;">TOP SELLERS</h2>
									<c:forEach var="top" items="${top2}">
										<div class="single-seller">
											<div class="seller-img">
												<a href="<%=cp%>/books/bookDetail.do?book_num=${top.book_num}">
													<img class="top2" src="${pageContext.request.contextPath}/upload/${top.book_image}" alt="${top.book_name}" />
												</a>
											</div>
											<div class="seller-details">
												<a href="<%=cp%>/books/bookDetail.do?book_num=${top.book_num}">
													<h5>${top.book_name}</h5>
												</a>
												<h5>
													<fmt:formatNumber pattern="###,###,###" value="${top.book_price}" />
													원
												</h5>
												<ul>
													<c:if test="${top.star_point == 0}">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</c:if>
													<c:if test="${top.star_point == 1}">
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</c:if>
													<c:if test="${top.star_point == 2}">
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</c:if>
													<c:if test="${top.star_point == 3}">
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</c:if>
													<c:if test="${top.star_point == 4}">
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star"></i>
													</c:if>
													<c:if test="${top.star_point == 5}">
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
														<i class="fa fa-star icolor"></i>
													</c:if>
												</ul>
											</div>
										</div>
									</c:forEach>
								</aside>
							</div>
						</div>
					</div>
					<!-- booksList 부분 -->
					<div class="col-md-9 col-sm-9 col-xs-12">
						<div class="shop-tab-area">
							<div class="shop-tab-list">
								<div class="shop-tab-pill pull-left">
									<ul>
										<li class="active" id="left">
											<a data-toggle="pill" href="#home">
												<i class="fa fa-th"></i>
												<span>Grid</span>
											</a>
										</li>
										<li>
											<a data-toggle="pill" href="#menu1">
												<i class="fa fa-th-list"></i>
												<span>List</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="shop-tab-pill pull-right">
									<ul>
										<li class="product-size-deatils">
											<form method="post" action="<%=cp%>/books/booksList.do" class="title-4">
												<select name="searchNum" style="height: 27px; border-color: #5e6b9e; width: 85px; padding-left: 5px; padding-top: 0px; border-top-width: 1px;">
													<option value="0">통합검색</option>
													<option value="1">제목</option>
													<option value="2">저자</option>
													<option value="3">출판사</option>
												</select>
												<input type="text" placeholder="Enter your book keyword here" name="searchKeyword" size="25">
												<button type="submit" style="height: 26px;">
													<i class="fa fa-search"></i>
												</button>
											</form>
										</li>
										${pagingHtml}
										<li class="shop-pagination">
											<a href="booksList.do?currentPage=${currentPage+1 }">
												<i class="fa fa-caret-right"></i>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="tab-content">
								<!-- GRID 형식 -->
								<div class="row tab-pane fade in active" id="home">
									<div class="shop-single-product-area">
										<c:forEach var="list" items="${booksList}" varStatus="stat">
											<c:url var="viewURL" value="/books/bookDetail.do">
												<c:param name="book_num" value="${list.book_num}" />
											</c:url>
											<div class="col-md-4 col-sm-6">
												<div class="single-banner">
													<div class="product-wrapper">
														<a href="${viewURL}" class="single-banner-image-wrapper">
															<img class="resize" alt="" src="${pageContext.request.contextPath}/upload/${list.book_image}">
															<div class="rating-icon">
																<c:if test="${list.star_point == 0}">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.star_point == 1}">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.star_point == 2}">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.star_point == 3}">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.star_point == 4}">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.star_point == 5}">
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
											</div>
										</c:forEach>
									</div>
								</div>
								<!--LIST 형식  -->
								<div id="menu1" class="tab-pane fade">
									<div class="row">
										<c:forEach var="list" items="${booksList}" varStatus="stat">
											<c:url var="viewURL" value="/books/bookDetail.do">
												<c:param name="book_num" value="${list.book_num}" />
											</c:url>
											<div class="single-shop-product">
												<div class="col-xs-12 col-sm-5 col-md-4">
													<div class="left-item">
														<a href="${viewURL}">
															<img class="resize" src="${pageContext.request.contextPath}/upload/${list.book_image}" alt="">
														</a>
													</div>
												</div>
												<div class="col-xs-12 col-sm-7 col-md-8">
													<div class="deal-product-content">
														<h4>
															<a href="${viewURL}">${list.book_name}</a>
														</h4>
														<div class="product-price" style="margin-bottom: 5px;">
															<span class="new-price">
																<fmt:formatNumber value="${list.book_price}" pattern="###,###,###" />
																원
															</span>
															<span class="old-price"></span>
														</div>
														<div class="list-rating-icon">
															<c:if test="${list.star_point == 0}">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.star_point == 1}">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.star_point == 2}">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.star_point == 3}">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.star_point == 4}">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.star_point == 5}">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
															</c:if>
														</div>
														<p>${list.book_auth}</p>
														<p>${list.company_id}[${list.book_publish_date}]</p>
														<p>
															<a href="javascript:isWish(${list.book_num})">♡ WISH LIST</a>
														</p>
														<div class="shopingcart-bottom-area wishlist-bottom-area pull-right" style="float: left !important;">
															<span>
																<a href="javascript:isBasket(${list.book_num});" class="right-shoping-cart" style="margin-bottom: 5px; font-size: small; font-style: oblique; margin-left: 0px; padding-bottom: 10px; padding-left: 18px; padding-right: 18px; height: 35px;">ADD TO CART</a>
															</span>
															<br />
															<span>
																<a href="javascript:isBuy(${list.book_num});" class="right-shoping-cart" style="margin-bottom: 5px; font-size: small; font-style: oblique; margin-left: 0px; padding-bottom: 10px; padding-left: 30px; padding-right: 30px; height: 35px;">BUY NOW</a>
															</span>
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
			</div>
		</div>
	</form>
	<!-- Shop Area End -->
	<script type="text/javascript">	
function isBasket(book_num) {
	 var isbuy=confirm("장바구니에 담으시겠습니까?");
	 if(isbuy==true) {
	   location.href='<%=cp%>/basket/basketInsert.do?basket_book_num='+book_num+'&amount='+1;
	 } else {
	  return false;
	 }
	}
	
function isWish(book_num) {
	 var comment=prompt('Please Enter Your Comment');
	 if (comment == null) return false;
		 location.href='<%=cp%>/wish/wishInsert.do?wish_book_num=' + book_num + '&wish_book_count=' + 1 + '&wish_comment=' + comment;
    }

    function isBuy(book_num) {
      var isbuy = confirm("구매 하시겠습니까?");
      if (isbuy == true) {
        location.href = '<%=cp%>/order/singleOrder.do?book_num='+book_num+'&order_book_count='+1;
	} else {
		return false;
	}
}
function fn_slider() {
  var price = document.getElementById("price").value;
  if(!price){
    alert("가격 범위를 정확히 설정 해주세요.");
    return false;
  }
  else
  {
 	 location.href = '<%=cp%>/books/bookSlider.do?price='+price;
  }
}

function resizeImg(osrc) 
{
	var bdiv =document.createElement('DIV');
	document.body.appendChild(bdiv);
	bdiv.setAttribute("id", "bdiv");
	bdiv.style.position = 'absolute';
	bdiv.style.top = 0;
	bdiv.style.left = 0;
	bdiv.style.zIndex = 0;
	bdiv.style.width = document.body.scrollWidth;
	bdiv.style.height = document.body.scrollHeight;
	bdiv.style.background = 'pink';
	bdiv.style.filter = "alpha(opacity=50)";
	var odiv = document.createElement('DIV');
	document.body.appendChild(odiv);
	odiv.style.zIndex = 1;
	odiv.setAttribute("id", "odiv");
	odiv.innerHTML = "<a href='javascript:void(closeImg())'><img id='oimg' src='"+osrc+"' border='0' /></a>";
	var img = document.all['oimg'];
	var owidth = (document.body.clientWidth)/2 - (img.width)/2;
	var oheight = (document.body.clientHeight)/2 - (img.height)/2;
	odiv.style.position = 'absolute';
	odiv.style.top = oheight + document.body.scrollTop;
	odiv.style.left = owidth;
	scrollImg(); 
}
	function scrollImg()
	{
		var odiv = document.all['odiv'];
		var img = document.all['oimg'];
		var oheight = (document.body.clientHeight)/2 - (img.height)/2 + document.body.scrollTop;
		odiv.style.top = oheight;
		settime = setTimeout(scrollImg, 100);
	}
	function closeImg()
	{
		document.body.removeChild(odiv);
		document.body.removeChild(bdiv);
		clearTimeout(settime);
	} 
</script>
</body>
</html>