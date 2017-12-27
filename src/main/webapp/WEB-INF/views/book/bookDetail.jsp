<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Product Details || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
img.resize {
	width: 270px;
	height: 370px;
}

img.used {
	width: 270px;
	height: 280px;
	}
	
img.soldout {
	width: 120px;
	height: 80px;
}

img.star {
	width: 18px;
	height: 18px;
}
</style>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">SINGLE PRODUCT DETAIL</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do">Home</a>
		</li>
		<li>
			<a title="Go to Basket" href="<%=cp%>/books/booksList.do">List</a>
		</li>
	</ul>
	<hr>
	<div class="single-product-area section-padding">
		<div class="container">
			<form name="detailForm" action="#">
				<input type="hidden" name="basket_book_num" value="${view.book_num}" />
				<input type="hidden" name="book_category" value="${view.book_category}" />
				<input type="hidden" name="book_name" value="${view.book_name}" />
				<input type="hidden" name="book_price" value="${view.book_price}" />
				<input type="hidden" name="book_image" value="${view.book_image}" />
				<div class="row" style="margin-left: 0px; margin-right: 0px;">
				<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var="toDay"/>	
					<div class="col-md-6 col-sm-7" style="width: 370px;">
						<div class="single-product-image-inner">
							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="one">
									<a class="venobox" href="<%=cp%>/upload/${view.book_image}" data-gall="gallery" title="">
										<img class="resize" src="<%=cp%>/upload/${view.book_image}" alt="${view.book_name}" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-5">
						<div class="single-product-details">
							<h2 style="margin-bottom: 5px;">${view.book_name}</h2>
							<div class="list-pro-rating" style="margin-bottom: 5px;">
								<c:if test="${view.star_point == 0}">
									&nbsp;<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</c:if>
								<c:if test="${view.star_point == 1}">
									&nbsp;<i class="fa fa-star icolor"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</c:if>
								<c:if test="${view.star_point == 2}">
									&nbsp;<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</c:if>
								<c:if test="${view.star_point == 3}">
									&nbsp;<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</c:if>
								<c:if test="${view.star_point == 4}">
									&nbsp;<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star"></i>
								</c:if>
								<c:if test="${view.star_point == 5}">
									&nbsp;<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
									<i class="fa fa-star icolor"></i>
								</c:if>
							</div>
							<p style="margin-bottom: 5px;">${view.book_auth}/${view.company_id}</p>
							<div class="single-product-price" style="height: 60px;">
								<h3><fmt:formatNumber value="${view.book_price}" pattern="###,###,###" /> 원</h3>
								<h5 style="font-style: inherit;">P <fmt:formatNumber pattern="#,###" value="${view.book_price * 0.05}"/> (5% 적립)</h5>
							</div>
							<div class="product-attributes clearfix">
								<span class="pull-left" id="quantity-wanted-p">
									<span class="dec qtybutton">-</span>
									<input type="text" value="1" class="cart-plus-minus-box" name="amount" maxlength="3" min="1" max="99" />
									<span class="inc qtybutton">+</span>
									<br />
								</span>
							</div>
							<div class="product-attributes clearfix">
								<span>
									<c:choose>
									<c:when test="${view.book_current_count == 0}">
									<img alt="" src="<%=cp%>/img/6-2-sold-out-png-hd.png" class="soldout" style="margin-top: 15px;">
									</c:when>
									<c:otherwise>
									<a class="cart-btn btn-default" href="javascript:javascript:isBuy(${view.book_num});">
										<i class="flaticon-shop"></i>
										BUY NOW
									</a>
									<br />
									<a class="cart-btn btn-default" href="javascript:isBasket(${view.book_num});" style="margin-top: 5px;">
										<i class="flaticon-shop"></i>
										ADD TO CART
									</a>
									</c:otherwise>
									</c:choose>
								</span>
							</div>
							<div class="add-to-wishlist">
								<c:if test="${view.book_current_count != 0}">
								<a class="wish-btn" href="javascript:isWish(${view.book_num})">
									&nbsp;<i class="fa fa-heart-o"></i>&nbsp;
									 ADD TO WISHLIST
								</a>
								<br />
								<a class="wish-btn" href="javascript:openMap()">
									<img src="<%=cp%>/img/location.png" style="width: 18px; height: 18px;">
									   배송 거리 확인
								</a>
								</c:if>
							</div>				
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-left: 0px;">
					<div class="col-md-9">
						<div class="p-details-tab-content">
							<div class="p-details-tab">
								<ul class="p-details-nav-tab" role="tablist" id="info">
									<li role="presentation" class="active">
										<a href="#info" aria-controls="more-info" role="tab" data-toggle="tab">상품정보</a>
									</li>
									<li role="presentation">
										<a aria-controls="data">회원리뷰</a>
									</li>
									<li role="presentation">
										<a aria-controls="reviews">교환/반품</a>
									</li>
								</ul>
							</div>
							<div class="clearfix"></div>
							<div class="tab-content review">
								<div role="tabpanel" class="tab-pane active" id="info">
									<p>${view.book_content}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<div class="p-details-tab-content">
							<div class="p-details-tab">
								<ul class="p-details-nav-tab" role="tablist" id="review">
									<li role="presentation">
										<a aria-controls="data">상품정보</a>
									</li>
									<li role="presentation" class="active">
										<a href="#review" aria-controls="data" role="tab" data-toggle="tab">회원리뷰</a>
									</li>
									<li role="presentation">
										<a aria-controls="data">교환/반품</a>
									</li>
								</ul>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane">
							<table class="table-data-sheet">
								<colgroup>
									<col width="13%" />
									<col width="" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<thead>
									<tr class="odd">
										<th style="text-align: center;">평점</th>
										<th style="text-align: center;">내용</th>
										<th style="text-align: center;">작성자</th>
										<th style="text-align: center;">작성일</th>
									</tr>
								</thead>
								<tbody>								
									<ul class="comments-advices">
										<li>
											<a href="javascript:openWriteForm()" class="open-comment-form">리뷰쓰기</a>
										</li>
									</ul>
									<br />
									<c:choose>
										<c:when test="${totalCount == 0}">
											<tr class="even">
												<td colspan="4" class="no-data" style="text-align: center;">등록된 상품후기가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="review" items="${review}" varStatus="stat">
												<fmt:formatDate value="${review.review_regdate}" pattern="yyyy-MM-dd" var ="RegDay"/>
												<tr class="even">
													<td style="text-align: center;">
														<c:if test="${review.star_point == 5}">
															<img src="<%=cp%>/img/yellow.png" class="star" />
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															
														</c:if>
														<c:if test="${review.star_point == 4}">
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
														</c:if>
														<c:if test="${review.star_point == 3}">
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
														</c:if>
														<c:if test="${review.star_point == 2}">
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
														</c:if>
														<c:if test="${review.star_point == 1}">
															<img src="<%=cp%>/img/yellow.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
														</c:if>
														<c:if test="${review.star_point == 0}">
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
															<img src="<%=cp%>/img/gray.png" class="star"/>
														</c:if>
													</td>
													<td style="text-align: center;">
														<span>
															<a href="javascript:void(0)" class="js-btn-view">${review.review_content}</a>
															<c:if test="${toDay eq RegDay }">
																<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;" />
															</c:if>
														</span>
													</td>
													<td style="text-align: center;">${review.member_id}</td>
													<td style="text-align: center;">
														<fmt:formatDate value="${review.review_regdate }" pattern="yy.MM.dd" />
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<ul class="pager" style="text-align: right;">
 								 <li><a href="bookDetail.do?currentPage=${currentPage-1}&book_num=${view.book_num}">＜</a></li>
  								${pagingHtml}
  								<li><a href="bookDetail.do?currentPage=${currentPage+1}&book_num=${view.book_num}">＞</a></li>
							</ul>

						</div>
					</div>
					<div class="col-md-9">
						<div class="p-details-tab-content">
							<div class="p-details-tab">
								<ul class="p-details-nav-tab" role="tablist" id="guide">
									<li role="presentation">
										<a aria-controls="data">상품정보</a>
									</li>
									<li role="presentation">
										<a aria-controls="data">회원리뷰</a>
									</li>
									<li role="presentation" class="active">
										<a href="#guide" aria-controls="reviews" role="tab" data-toggle="tab">교환/반품</a>
									</li>
								</ul>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="guide">
							<table class="table-data-sheet">
								<caption class="caption_hidden">
									<교환 /반품/품절안내>
								</caption>
								<colgroup>
									<col width="22%" />
									<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" style="text-align: center;">반품/교환방법</th>
										<td>
											<strong>
												마이룸 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회 &gt;
												<a href="<%=cp%>/board/boardList.do">반품/교환신청</a>
												,
												<br />
												<a href="<%=cp%>/board/boardList.do">[1:1상담&gt;반품/교환/환불]</a>
												또는 고객센터 (1544-1900)
											</strong>
											<br />
											※ 오픈마켓, 해외배송주문, 기프트 주문시
											<a href="<%=cp%>/board/boardList.do">[1:1상담&gt;반품/교환/환불]</a>
											또는 고객센터 (1544-1900)
										</td>
									</tr>
									<tr>
										<th scope="row" style="text-align: center;">반품/교환가능 기간</th>
										<td>
											변심반품의 경우 수령 후 7일 이내,
											<br />
											상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
										</td>
									</tr>
									<tr>
										<th scope="row" style="text-align: center;">반품/교환비용</th>
										<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
									</tr>
									<tr>
										<th scope="row" style="text-align: center;">반품/교환 불가 사유</th>
										<td>
											<ul>
												<li>
													소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우
													<br />
													(단지 확인을 위한 포장 훼손은 제외)
												</li>
												<li>
													소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우
													<br />
													예) 화장품, 식품, 가전제품(악세서리 포함) 등
												</li>
												<li>
													복제가 가능한 상품 등의 포장을 훼손한 경우
													<br />
													예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집
												</li>
												<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
												<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
												<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
												<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우</li>
											</ul>
											(1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시 ‘해외주문 반품/취소 수수료’ 고객 부담 (해외주문 반품/취소 수수료 : ①양서-판매정가의 12%, ②일서-판매정가의 7%를 적용)
										</td>
									</tr>
									<tr>
										<th scope="row" style="text-align: center;">상품 품절</th>
										<td>
											공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며,
											<br />
											품절 시 관련 사항에 대해서는 이메일과 문자로 안내드리겠습니다.
										</td>
									</tr>
									<tr>
										<th scope="row" style="text-align: center;">
											소비자 피해보상
											<br />
											환불지연에 따른 배상
										</th>
										<td>
											<ul>
												<li>
													상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은
													<br />
													소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
												</li>
												<li>
													대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의
													<br />
													소비자 보호에 관한 법률에 따라 처리함
												</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Single Product Area End -->
	<!-- Related Product Area Start -->
	<div class="related-product-area">
		<h2 class="section-title">USED BOOKS</h2>
		<div class="container">
			<div class="row">
				<div class="related-product indicator-style">
					<c:forEach var="used" items="${used}">
					<div class="col-md-3">
						<div class="single-banner">
							<div class="product-wrapper">
								<a href="<%=cp%>/books/usedBooksList.do?used_book_num=${used.used_book_num}" class="single-banner-image-wrapper">
									<img alt="" src="${pageContext.request.contextPath}/upload/${used.book_image}" class="used">
									<div class="rating-icon">
										<i class="fa fa-star icolor"></i>
										<i class="fa fa-star icolor"></i>
										<i class="fa fa-star icolor"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
									</div>
								</a>
							</div>
							<div class="banner-bottom text-center">
								<a href="#"><fmt:formatNumber pattern="###,###,###" value="${used.book_new_price}" /> 원</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Related Product Area End -->
	<script type="text/javascript">
	function openWriteForm() {
		var zipUrl = 'http://localhost:8080/namuduri/books/review.do?book_num=${view.book_num}&book_name=${view.book_name}'
		window.open(zipUrl,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=825, height=670");
	}
	   function isBasket(book_num) {
		      var isbuy = confirm("장바구니에 담으시겠습니까?");
		      var product = eval("document.detailForm");
		      var amount = document.detailForm.amount.value;
		      if (isbuy == true) {
		         document.detailForm.action='<%=cp%>/basket/basketInsert.do?basket_book_num='+book_num+'&amount='+amount;
		         product.submit();
		      } else {
		         return false;
		      }
		   }
	   function isBuy(book_num) {
		      var amount = document.detailForm.amount.value;
		      var stock = ${view.book_current_count};
		      if(amount > stock) {
		    	  alert("현재 재고는 " + stock + "권입니다");
		    	  return false;
		      }
		      var isbuy = confirm("구매하시겠습니까?");
		      if (isbuy == true) {
		         window.location.href = '<%=cp%>/order/singleOrder.do?book_num='+ book_num + '&order_book_count=' + amount;
				} else {
					return;
				}
			}
	   function isWish(book_num) {
			 var comment=prompt('Please Enter Your Comment');
			 var amount=document.detailForm.amount.value;
			 if (comment == null) return false;
				 window.location.href='<%=cp%>/wish/wishInsert.do?wish_book_num='+book_num+'&wish_book_count='+amount+'&wish_comment='+comment;
		}
	   function openMap() {
		var url = '<%=cp%>/common/openMap.do';
		window.open(url,"openMap","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=900, height=800")
	}
	</script>
</body>
</html>