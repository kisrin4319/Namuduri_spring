<?xml version="1.0" encoding="UTF-8" ?>
<% String cp = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<link href="<%=cp%>/css/default.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/showcase2.css?ver=1" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="showcase_template">
		<div class="showcase_con" id="showcaseNew">
			<div class="list_button_wrap">
				<!-- start 페이징 -->
				<div class="list_paging align_center" id="eventPaging">
					<div class="list_paging">
						<ul>${pagingHtml}
						</ul>
						<a class="btn_next" href="booksList.do?currentPage=${currentPage+1 }">
							<img src="http://image.kyobobook.co.kr/ink/images/common/btn_next03_on.gif" alt="다음" />
						</a>
					</div>
				</div>
				<!-- end 페이징 -->
				<div class="list_button">
					<a href="javascript:downScroll();" class="btn_medium btn_blue3">아래로</a>
					<a href="javascript:location.href='<%=cp%>/basket/basketList.do'" class="btn_medium btn_blue3">장바구니로 가기</a>
				</div>
			</div>
			<div class="prd_list_area">
				<c:choose>
					<c:when test="${listCount == 0}">
						<table border="1" cellpadding="0" cellspacing="0" bordercolor="#6B66FF" width="730px" align="center"></table>
						<div style="text-align: center; font-size: small;">등록된 상품이 없습니다</div>
					</c:when>
					<c:otherwise>
						<form name="frmList">
							<ul class="prd_list_type1" id="prd_list_type1">
								<c:forEach var="list" items="${booksList}" varStatus="stat">
									<li class="id_detailli" id="style">
										<div class="thumb_cont">
											<div class="info_area">
												<div class="cover_wrap">
													<div class="cover">
														<c:url var="viewURL" value="/books/bookDetail.do">
															<c:param name="book_num" value="${list.book_num}" />
														</c:url>
														<a href="${viewURL}">
															<span>
																<img width="140" src="<%=cp %>/upload/${list.book_image}" />
																<em class="best_flag">
																	<span>${(currentPage-1)*10+stat.index+1}</span>
																</em>
															</span>
														</a>
													</div>
												</div>
												<div class="detail">
													<div class="title">
														<a href="${viewURL}">
															<b> ${list.book_name} </b>
														</a>
													</div>
													<div class="pub_info">
														<span class="author">${list.book_auth}</span>
														<span class="publication">${list.company_id}</span>
														<span class="publication">${list.book_publish_date }
															<!-- 초판일 -->
														</span>
													</div>
													<div class="price">
														<strong class="sell_price"><fmt:formatNumber value="${list.book_price}" pattern="###,###,###" />원</strong>
													</div>
													<div class="info" style="height: 90px;">
														<font size="2">
															<span>${list.book_content }</span>
														</font>
													</div>
												</div>
												<div class="book_add">
													<c:choose>
														<c:when test="${list.book_current_count == 0}">
															<img src="<%=cp%>/img/6-2-sold-out-png-hd.png" width="100" style="padding-top: 40px;" />
														</c:when>
														<c:otherwise>
															<input type="button" value="&nbsp;장바구니에 담기" class="btn_large btn_blue" onclick="isBasket(${list.book_num})" style="margin-top: 25px;" />
															<br />
															<br />
															<input type="button" value="&nbsp;바로구매 하기" class="btn_large btn_blue2" onclick="isBuy(${list.book_num})" style="padding-right: 20px; margin-top: 0px;" />
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>

						</form>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="list_button_wrap">
				<!-- 페이징 -->
				<div class="list_paging align_center" id="eventPaging">
					<div class="list_paging">
						${pagingHtml}
						<a class="btn_next" href="booksList.do?currentPage=${currentPage+1 }">
							<img src="http://image.kyobobook.co.kr/ink/images/common/btn_next03_on.gif" alt="다음" />
						</a>
					</div>
				</div>
				<div class="list_button">
					<a href="javascript:upScroll();" class="btn_medium btn_blue3">위로</a>
					<a href="javascript:location.href='<%=cp%>/basket/basketList.do'" class="btn_medium btn_blue3">장바구니로 가기</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" language="javascript">	
function isBasket(book_num) {
	 var isbuy=confirm("장바구니에 담으시겠습니까?");
	 var product=eval("document.frmList");
	 if(isbuy==true) {
	   location.href='<%=cp%>/basket/basketInsert.do?basket_book_num='+book_num+'&basket_book_count='+1;
	 } else {
	  return false;
	 }
	}
	
	
function isBuy(book_num) {
	var isbuy=confirm("구매 하시겠습니까?");
	var product=eval("document.frmList");
	if(isbuy==true) {
		 location.href='<%=cp%>/order/singleOrder.do?book_num='+book_num+'&order_book_count='+1;
	} else {
		return false;
	}
}
function upScroll() {
	document.documentElement.scrollTop = 0;
}
function downScroll() {
	document.documentElement.scrollTop = document.body.scrollHeight;
}
</script>
</body>
</html>