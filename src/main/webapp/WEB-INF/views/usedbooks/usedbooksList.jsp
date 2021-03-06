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
	<h2 style="text-align: -webkit-center; padding-top: 30px;">USED BOOK PAGE</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
		</li>
		<li>
			<a title="Go to Basket" href="<%=cp%>/basket/basketList.do" style="font-style: oblique;">BASKET</a>
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
											<a href="<%=cp%>/books/usedBooksList.do?book_category=단편소설">
												<i class="fa fa-angle-double-right"></i>
												short story
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/usedBooksList.do?book_category=장편소설">
												<i class="fa fa-angle-double-right"></i>
												feature novel
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/usedBooksList.do?book_category=자기계발">
												<i class="fa fa-angle-double-right"></i>
												self-development
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/usedBooksList.do?book_category=시/에세이">
												<i class="fa fa-angle-double-right"></i>
												poem & essay
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/usedBooksList.do?book_category=어린이(초등)">
												<i class="fa fa-angle-double-right"></i>
												kids & schoolchild
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/usedBooksList.do?book_category=중/고등참고서">
												<i class="fa fa-angle-double-right"></i>
												teenager
											</a>
										</li>
										<li style="margin-left: 35px;">
											<a href="<%=cp%>/books/usedBooksList.do?book_category=취업/참고서">
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
											<form method="post" action="<%=cp%>/books/usedBooksList.do" class="title-4">
												<select name="searchNum" style="height: 27px; border-color: #5e6b9e; width: 85px; padding-left: 5px; padding-top: 0px; border-top-width: 1px;">
													<option value="0">통합검색</option>
													<option value="1">제목</option>
													<option value="2">저자</option>
													<option value="3">출판사</option>
												</select>
												<input type="text" name="searchKeyword" size="8">
												<button type="submit" style="height: 26px;" class="btn btn-info">
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
										<c:forEach var="list" items="${usedBooksList}" varStatus="stat">
											<div class="col-md-4 col-sm-6">
												<div class="single-banner">
													<div class="product-wrapper">
														<a class="single-banner-image-wrapper">
															<img class="resize" alt="" src="${pageContext.request.contextPath}/upload/${list.book_image}" />
															<div class="rating-icon">
																<c:if test="${list.used_book_status eq '최상' }">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																</c:if>
																<c:if test="${list.used_book_status eq '상' }">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.used_book_status eq '중' }">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.used_book_status eq '하' }">
																	<i class="fa fa-star icolor"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
																<c:if test="${list.used_book_status eq '최하' }">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</c:if>
															</div>
														</a>
													</div>
													<div class="banner-bottom text-center">
														<a href="#">
															<fmt:formatNumber value="${list.book_new_price}" pattern="###,###,###" />
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
										<c:forEach var="list" items="${usedBooksList}" varStatus="stat">
											<c:url var="viewURL" value="/books/bookDetail.do">
												<c:param name="book_num" value="${list.book_num}" />
											</c:url>
											<div class="single-shop-product">
												<div class="col-xs-12 col-sm-5 col-md-4">
													<div class="left-item">
														<a href="#">
															<img class="resize" src="${pageContext.request.contextPath}/upload/${list.book_image}" alt="">
														</a>
													</div>
												</div>
												<div class="col-xs-12 col-sm-7 col-md-8">
													<div class="deal-product-content">
														<h4 style="margin-bottom: 7px;">${list.book_name}</h4>
														<div class="list-rating-icon" style="margin-bottom: 7px;">
															보관상태 : 														
															<c:if test="${list.used_book_status eq '최상' }">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
															</c:if>
															<c:if test="${list.used_book_status eq '상' }">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.used_book_status eq '중' }">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.used_book_status eq '하' }">
																<i class="fa fa-star icolor"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
															<c:if test="${list.used_book_status eq '최하' }">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
															</c:if>
														</div>
														<div class="product-price" style="margin-bottom: 7px;">
															<span class="new-price">
																<fmt:formatNumber value="${list.book_new_price}" pattern="###,###,###" />
																원
															</span>
															<span class="old-price">
																<fmt:formatNumber value="${list.book_price}" pattern="###,###,###" />
																원
															</span>
														</div>
														<h5 style="margin-bottom: 7px;">P <fmt:formatNumber pattern="#,###" value="${list.book_price * 0.05}"/> (5% 적립)</h5>
														<p style="margin-bottom: 7px;">${list.book_auth}(${list.company_id})</p>
														<p style="margin-bottom: 7px;">등록자 : ${list.member_id }</p>
														<p style="margin-bottom: 7px;">등록일 : [<fmt:formatDate value="${list.used_book_regdate}" pattern="yy/MM/dd" />]
														</p>
														<div class="shopingcart-bottom-area wishlist-bottom-area pull-right" style="float: left !important; margin-bottom: 7px;">
															<c:if test="${list.member_id eq member_id }">
																<span>
																	<a href="javascript:fn_Modify(${list.used_book_num});" class="right-shoping-cart" style="margin-bottom: 5px; font-size: small; font-style: oblique; margin-left: 0px; padding-bottom: 10px; padding-left: 18px; padding-right: 18px; height: 35px;">Modify</a>
																</span><br/>
																<span>
																	<a href="javascript:fn_Delete(${list.used_book_num});" class="right-shoping-cart" style="margin-bottom: 5px; font-size: small; font-style: oblique; margin-left: 0px; padding-bottom: 10px; padding-left: 18px; padding-right: 23px; height: 35px;">Delete</a>
																</span>
															</c:if>
															<c:if test="${list.member_id ne member_id }">
																<span>
																	<a href="javascript:fn_Buy(${list.used_book_num});" class="right-shoping-cart" style="margin-bottom: 5px; margin-top: 17px; font-size: small; font-style: oblique; margin-left: 0px; padding-bottom: 10px; padding-left: 18px; padding-right: 18px; height: 35px;">BUY NOW</a>
																</span>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<c:if test="${checkResult >=100000 }">
								<div class="shopingcart-bottom-area">
									<div class="shopingcart-bottom-area pull-right">
										<a class="right-shoping-cart" href="javascript:;" onclick="fn_writeBook()" style="margin-top: 20px; margin-right: 0px;">Enrollment Book</a>
									</div>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Shop Area End -->
	<script type="text/javascript">
    function fn_writeBook() {
     location.href = '<%=cp%>/books/usedBookWriteForm.do';
    }

    function fn_Basket(book_num) {
        var isbuy = confirm("장바구니에 담으시겠습니까?");
        if (isbuy == true) {
            location.href = '<%=cp%>/basket/basketInsert.do?basket_book_num=' + book_num + '&basket_book_count=' + 1;
        } else {
            return false;
        }
    }

    function fn_Buy(book_num) {
        var isbuy = confirm("구매 하시겠습니까?");
        if (isbuy == true) {
            location.href = '<%=cp%>/order/singleOrder.do?used_book_num=' + book_num + '&order_book_count=' + 1;
        } else {
            return false;
        }
    }

    function fn_Modify(used_book_num) {
        location.href = '<%=cp%>/books/usedBookModifyForm.do?used_book_num=' + used_book_num;
    }

    function fn_Delete(used_book_num) {
        location.href = '<%=cp%>/books/usedBookDelete.do?used_book_num=' + used_book_num;
    }

    function fn_slider() {
      var price = document.getElementById("price").value;
      if (!price) {
        alert("가격 범위를 정확히 설정 해주세요.");
        return false;
      } else {
        location.href = '<%=cp%>/books/usedBookSlider.do?price='+price;
      }
    }    
</script>
</body>
</html>