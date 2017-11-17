<?xml version="1.0" encoding="UTF-8" ?>
<% String cp = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>도서 상세 정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/default.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/default_ink.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/detail.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/goods_view.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
   function checkreview() {
      if (!document.review.name.value) {
         alert("Review의 작성자를 입력해주세요");
         document.review.name.focus();
         return false;
      }
      if (!document.review.password.value) {
         alert("Review의 비밀번호를 입력해주세요");
         document.review.password.focus();
         return false;
      }
      if (!document.review.content.value) {
         alert("Review의 내용을 입력해주세요");
         document.review.content.focus();
         return false;
      } else {
         if (confirm("Review를 작성하시겠습니까?")) {
         } else {
            alert("취소되었습니다");
            return false;
         }
      }
   }

   function count_change(temp) {
      var test = detailForm.amount.value;
      if (temp == 0) {
         test++;
      } else if (temp == 1) {
         if (test > 1)
            test--;
      }

      detailForm.amount.value = test;
   }

   function isBasket(goods_num, goods_price) {
      var isbuy = confirm("장바구니에 담으시겠습니까?");
      var product = eval("document.goodsform");
      var amount = document.goodsform.amount.value;
      if (isbuy == true) {
         document.goodsform.action = 'basketAddAction.do?goods_num=${tresultClass.goods_num}&basket_goods_count=' + amount;
         product.submit();
      } else {
         return false;
      }
   }

   function isBuy(book_num) {
      var isbuy = confirm("구매하시겠습니까?");
      var amount = document.detailForm.amount.value;
      if (isbuy == true) {
         window.location.href = '<%=cp%>/order/singleOrder.do?book_num='+book_num+'&order_book_count='+amount;
      } else {
         return;
      }
   }
   
   function openWriteForm() {   
      
      var zipUrl = 'http://localhost:8080/namuduri/books/review.do?book_num=${view.book_num}&book_name=${view.book_name}'
      window.open(zipUrl,"confirm","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=825, height=670");
   }
</script>
</head>
<body>
	<div id="wrap">
		<!-- s:#Container -->
		<div id="container">
			<!-- s:.content_middle -->
			<div class="content_middle" style="margin-top: 50px;">
				<!-- *** s:메인정보 *** -->
				<!-- *** s:form - proForm *** -->
				<form name="detailForm" action="#">
					<input type="hidden" name="book_num" value="${view.book_num}" /> <input type="hidden" name="book_category" value="${view.book_category}" /> <input type="hidden" name="book_name" value="${view.book_name}" /> <input type="hidden" name="book_price" value="${view.book_price}" /> <input type="hidden" name="book_image" value="${view.book_image}" />
					<!-- s:.box_detail_point -->
					<div class="box_detail_point" style="padding-bottom: 20px; text-align: left">
						<h1 class="title">
							<strong>${view.book_name}</strong>
						</h1>
						<div class="author">
							<!-- s:저자명 -->
							<span class="name"> ${view.book_auth} </span>&nbsp;지음&nbsp; <span class="line">|&nbsp;</span> <span class="name" title="출판사"> ${view.company_id} </span> <span class="line">|&nbsp;</span> <span class="date" title="출간일"> ${view.book_publish_date} </span>
							<!-- 15-03-31 추가 -->
						</div>
						<!-- *** s:상품 리뷰정보 *** -->
						<!-- ***orderClick*** -->
						<div class="review">
							<a href="#review">리뷰 <c:out value="${totalCount}"/>개</a>
							${reviewCount}
						</div>
						<!-- *** //e:상품 리뷰정보 *** -->
					</div>
					<!-- //e:.box_detail_point -->
					<!-- s:.box_detail_info -->
					<div class="box_detail_info">
						<!-- *** s:도서 대표이미지 *** -->
						<div class="box_detail_cover">
							<div class="cover">
								<img src="<%=cp%>/upload/${view.book_image}" alt="${view.book_name}" />
							</div>
						</div>
						<!-- *** //e:도서 대표이미지 *** -->
					</div>
					<!-- //e:.box_detail_info -->
					<!-- s:.box_detail_order -->
					<div class="box_detail_order">
						<!-- *** s:상품 가격정보 *** -->
						<div class="box_detail_price" style="text-align: left;">
							<h2>가격정보</h2>
							<ul class="list_detail_price" style="padding-bottom: 0px; padding-top: 20px;">
								<li>판매가 : <span class="sell_price" title="판매가"> <strong><fmt:formatNumber value="${view.book_price}" pattern="###,###,###" />원</strong>
								
								</span>
								</li>
								<li>배송비 : 무료</li>
							</ul>
						</div>
						<!-- *** //e:상품 가격정보 *** -->
						<!-- *** s:구매하기 *** -->
						<div class="box_detail_button" style="text-align: left">
							<!-- s:일반 -->
							<div class="amount">
								<label for="proForm_qty">주문수량</label> <input type="text" class="input_style" id="amount" name="amount" value="1" maxlength="3" onkeydown="javascript:only_number();" /> <span class="btn_count">
									<button type="button" onclick="javascript:count_change(0);">
										<img src="http://image.kyobobook.co.kr/ink/images/common/btn_plus.gif" alt="수량 더하기" />
									</button>
									<button type="button" onclick="javascript:count_change(1);">
										<img src="http://image.kyobobook.co.kr/ink/images/common/btn_minus.gif" alt="수량 빼기" />
									</button>
								</span>
							</div>
							<div class="button_set">
								<!-- s:정상구매 -->
								<!-- ***orderClick*** -->
								<a href="javascript:isBasket(goods_num,goods_price);" class="btn_xlarge btn_blue">장바구니 담기</a>
								<!-- ***orderClick*** -->
								<a href="javascript:isBuy(${view.book_num});" class="btn_xlarge btn_blue2">바로구매</a>
								<!-- //e:정상구매 -->
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="content_middle">
				<div class="content_left">
					<ul class="tab_detail_content" id="book_info">
						<li class="on"><a href="#book_info">상품정보</a></li>
						<li><a href="#review">회원리뷰 <span><c:out value="(${totalCount})"/></span></a></li>
						<li><a href="#guide">교환/반품/품절</a></li>
					</ul>
					<div class="box_detail_content">
						<h2 class="title_detail_basic">책소개</h2>
						<div class="box_detail_article">${view.book_content}</div>
					</div>
					<ul class="tab_detail_content" id="review">
						<li><a href="#book_info">상품정보</a></li>
						<li class="on"><a href="#review">회원리뷰 <span><c:out value="(${totalCount})"/></span></a></li>
						<li><a href="#guide">교환/반품/품절</a></li>
					</ul>
					<div class="box_detail_content">
						<!-- 리뷰작성 -->
						<div class="top-reviews">
							<div class="tit">
								<h2>도서후기</h2>
							</div>
							<div class="btn">
								<a href="javascript:openWriteForm()"> <img src="<%=cp%>/img/write.JPG" alt="리뷰 쓰러가기" />
								</a>
							</div>
						</div>
						<div id="ajax-goods-goodsreview-list">
							<table id="js-review-board-table" class="review-board" cellspacing="0" border="1" style="margin-bottom: 18px;">
									<colgroup>
										<col width="13%" />
										<col width=""/>
										<col width="10%" />
										<col width="10%" />
									</colgroup>
									<thead>
										<tr>
											<th>평점</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${totalCount == 0}">
												<tr class="not-record">
													<td colspan="4" class="no-data">등록된 상품후기가 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="review" items="${review}" varStatus="stat">
													<tr class="preview js-data-row">
														
														<td>
															<c:if test="${review.star_point == 5}">
																<img src="<%=cp%>/img/star5-88x15.png" border="0" />
															</c:if> 
															<c:if test="${review.star_point == 4}">
																<img src="<%=cp%>/img/star4-88x15.png" border="0" />
															</c:if> 
															<c:if test="${review.star_point == 3}">
																<img src="<%=cp%>/img/star3-88x15.png" border="0" />
															</c:if> 
															<c:if test="${review.star_point == 2}">
																<img src="<%=cp%>/img/star2-88x15.png" border="0" />
															</c:if> 
															<c:if test="${review.star_point == 1}">
																<img src="<%=cp%>/img/star1b.jpg" border="0" />
															</c:if>
															<c:if test="${review.star_point == 0}">
																<img src="<%=cp%>/img/star0-88x15.png" border="0" />
															</c:if>
															</td>
															
														<td class="txt-la">
														<span> 
														<a href="javascript:void(0)" class="js-btn-view">${review.review_content}</a> 
														<img src="images/common/icon_board_new.png" />
														</span></td>
														<td class="txt-la" style="padding-left: 0px;">${review.member_id}</td>
														<td>
														<fmt:formatDate value="${review.review_regdate }" pattern="yy.MM.dd" />
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
								</tbody>
							</table>
							 <nav>
							<ul class="pagination pagination-sm">
							${pagingHtml}
							</ul>
							</nav>
						</div>
					</div>
					<ul class="tab_detail_content" id="guide">
						<li><a href="#book_info">상품정보</a></li>
						<li><a href="#review">회원리뷰 <span><c:out value="(${totalCount})"/></span></a></li>
						<li class="on"><a href="#guide">교환/반품/품절</a></li>
					</ul>
					<div class="box_detail_content">
						<table class="table_simple2 table_detail_guide margin_top10" summary="교환/반품/품절안내 상세테이블로 목록으로 반품/교환방법, 반품/교환가능 기간, 반품/교환비용, 반품/교환 불가 사유, 상품 품절, 소비자 피해보상 환불지연에 따른 배상">
							<caption class="caption_hidden">교환/반품/품절안내</caption>
							<colgroup>
								<col width="22%" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">반품/교환방법</th>
									<td><strong>마이룸 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회 &gt; <a href="qnaList.do">반품/교환신청</a> , <br /> <a href="qnaList.do">[1:1상담&gt;반품/교환/환불]</a> 또는 고객센터 (1544-1900)
									</strong><br /> ※ 오픈마켓, 해외배송주문, 기프트 주문시 <a href="boardList.do">[1:1상담&gt;반품/교환/환불]</a><br /> &nbsp; &nbsp; 또는 고객센터 (1544-1900)</td>
								</tr>
								<tr>
									<th scope="row">반품/교환가능 기간</th>
									<td>변심반품의 경우 수령 후 7일 이내,<br /> 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
									</td>
								</tr>
								<tr>
									<th scope="row">반품/교환비용</th>
									<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
								</tr>
								<tr>
									<th scope="row">반품/교환 불가 사유</th>
									<td>
										<ul class="list_normal">
											<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br /> (단지 확인을 위한 포장 훼손은 제외)
											</li>
											<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br /> 예) 화장품, 식품, 가전제품(악세서리 포함) 등
											</li>
											<li>복제가 가능한 상품 등의 포장을 훼손한 경우<br /> 예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집
											</li>
											<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
											<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
											<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
											<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br /> 해당되는 경우
											</li>
										</ul> (1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시 ‘해외주문 반품/취소 수수료’ 고객 부담 (해외주문 반품/취소 수수료 : ①양서-판매정가의 12%, ②일서-판매정가의 7%를 적용)
									</td>
								</tr>
								<tr>
									<th scope="row">상품 품절</th>
									<td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br /> 이메일과 문자로 안내드리겠습니다.
									</td>
								</tr>
								<tr>
									<th scope="row">소비자 피해보상<br /> 환불지연에 따른 배상
									</th>
									<td>
										<ul class="list_normal">
											<li>상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은<br /> 소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
											</li>
											<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br /> 소비자 보호에 관한 법률에 따라 처리함
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>