<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.HashMap" %>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MY PAGE</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	
	<h2 style="text-align: -webkit-center; padding-top: 30px;">MY PAGE</h2>
		<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
			<li>
				<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
			</li>
			<li>
				<a title="Go to Books" href="<%=cp%>/books/booksList.do">BOOKS</a>
			</li>
		</ul>
		
		<div class="shopping-area section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-2 col-sm-3 col-xs-12">
						<div class="shop-widget">
							<div class="shop-widget-top">
								<aside class="widget widget-categories">
									<h2 class="sidebar-title text-center">CATEGORY</h2>
									<ul class="sidebar-menu">
										<li>
											<a href="<%=cp%>/order/orderListCheckView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">주문/배송 조회</p>								
											</a>
										</li>
										<li>
											<a href="<%=cp%>/member/memberModifyView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">회원 정보수정</p>
											</a>
										</li>
										<li>
											<a href="<%=cp%>/member/memberDeleteView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">회원 탈퇴</p>
											</a>
										</li>
										<li>
											<a href="<%=cp%>/eFeelogView.do">
												<p class="text-left">eFeelog</p>
											</a>
										</li>
									</ul> 
								</aside>
							</div>
						</div>
					</div>
					<div class="col-md-9 col-sm-12">
                        <div class="mainmenu text-center">
						<table class="table">
							<thead>
								<tr>
									<th><div class="user_name">${ member_id } 님 안녕하세요.</div></th>
								</tr>
							</thead>
						</table>
						<input type="hidden" id="order_trade_num" name="order_trade_num"/>
						<table class="table table-striped">
							<thead>
								<colgroup>
									<col width="14%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="15%"/>
									<col width="14%"/>
								</colgroup>
								<tr>
									<th class="first" scope="col"><p class="text-center">주문번호</p></th>
									<th scope="col"><p class="text-center">주문날짜</p></th>
									<th scope="col"><p class="text-center">결제상태</p></th>
									<th scope="col"><p class="text-center">결제방법</p></th>
									<th scope="col"><p class="text-center">배송번호</p></th>
									<th scope="col"><p class="text-center">주문상태</p></th>
								</tr>
							</thead>
							<tbody>
								<c:url var="viewOrderURL" value="orderDetailView.do">
									<c:param name="order_trade_num" value="${order_trade_num}"/>
									<c:param name="curretPage" value="${currentPage}" />
								</c:url>
								
								<c:if test="${ fn:length(orderModel) != '0' }">
								<c:forEach var="item" items="${ orderModel }">
								<tr>
									<td height="50" align="center">
										<a href ="${viewOrderURL}">${ item.order_trade_num }</a>	
									</td>
									<td align="center">${ item.order_regdate }</td>
									<td align="center">
										<c:if test="${ item.payment_status =='PS01' }">
											결제 대기중
										</c:if>
										<c:if test="${ item.payment_status =='PS02' }">
											결제 완료
										</c:if>
									</td>
									<td align="center">
										<c:if test="${ order_trade_status =='TR01' }">
											무통장 입금
										</c:if>
										<c:catch>
											카드 결제
										</c:catch>${ order_trade_status }
									</td>
									<td align="center">${item.order_trans_num}</td>
									
									<td align="center">
										<c:if test="${ item.order_trans_status == 'ST01' }">
											배송 준비중
										</c:if>
										<c:if test="${ order_trans_status == 'ST02' }">
											배송 중
										</c:if>
										<c:if test="${ order_trans_status == 'ST03' }">
											배송 완료
										</c:if>
									</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${ fn:length(orderModel) == '0' }">
									<tr align="center">
										<td colspan="8">주문 내역이 없습니다.</td>
										<%-- <td>
											<select class="selectpicker">
												<c:forEach var="list" items="${ item }">
													<option value="${ list.seq }">${ list.name }</option>
												</c:forEach>
											</select>
										</td> --%>
									</tr>
								</c:if>
							</tbody>
						<tr align="center">
							<td colspan="8">${ pagingHtml }</td>
						</tr>
						
						</table>
						</div>
					</div>
				
				</div>
			</div>
		</div>
			
</body>
</html>