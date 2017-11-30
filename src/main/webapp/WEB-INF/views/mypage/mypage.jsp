<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.HashMap" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>mypage</title>
<link href ="<%=cp%>/css/default_ink_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/layout_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/myroom.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/order_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/style_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/style2_ssl.css" rel="stylesheet" type="text/css" />
</head>
<body>		
	<div class="content_middle" style="width:800px;margin-right:100px;"> 
	<div id="myroom_contents">
		<!-- 고객 공통 컨텐츠 -->
		<div class="out_myroom_gradearea">
			<div class="user_section">
				<div class="user_name"><p>${member_id}</p> 님 안녕하세요.</div>
			</div>
			<font size ="2" style ="text-align: center">mypage</font>
		</div>
		<!--// 고객 공통 컨텐츠 -->
		<h2 class="bul_green20">
			<span>주문/배송조회</span>
		</h2>
		
		<form name="orderListCheckForm" id="orderListCheckForm" method="post">
			<!-- 주문내역시작 -->
			<input type="hidden" id="order_trade_num" name="order_trade_num" />
				<table class="table_myroom td_font_12 margin_top10"	summary="주문번호, 주문금액, 상품정보, 주문상태를 알 수 있는 주문 내역 테이블 입니다.">
					<caption>주문 내역</caption>
						<colgroup>
							<col width="14%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="15%" />
							<col width="14%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="first" scope="col">주문번호</th>
								<th scope="col">주문날짜</th>
								<th scope="col">결제상태</th>
								<th scope="col">결제방법</th>
								<th scope="col">배송번호</th>
								<th scope="col">주문상태</th>
							</tr>
						<!-- <s:iterator value="orderlist" status="stat"> -->
							<!-- 주무번호와 연결되는 URL -->
							<c:url var="viewOrderURL" value="orderDetailView.do">
								<c:param name="order_trade_num" value="${order_trade_num}"/>
								<c:param name="curretPage" value="${currentPage}" />
							</c:url>
							
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
						<!-- </s:iterator> -->
						<c:if test="list.size()==0">
							<tr align="center">
								<td colspan="8">주문 내역이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
					<tr align="center">
						<td colspan="8" value="pagingHtml" escape="false"></td>
					</tr>
			</table>
			<!-- 주문내역종료 -->
		</form>

		<h2 class="bul_green20 margin_top30">
			<span>주문/배송안내</span>
		</h2>
		<img align="middle" src="<%=cp%>/mypage/image/mypage.JPG" />
		</div>
	</div>	
</body>
</html>