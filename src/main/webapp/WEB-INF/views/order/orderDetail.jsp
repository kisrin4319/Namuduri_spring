<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>주문 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=cp%>/css/default_ink_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/layout_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/myroom.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/order_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style2_ssl.css" rel="stylesheet" type="text/css" />
</head>
<body>
		
<div class="content_middle" style="width: 800px; margin-right: 100px;">
	<div id="myroom_contents">
	<h2 class="bul_green20">
			<span>주문자 정보</span>
	</h2>
	<table class="table_myroom td_font_12 margin_top10">
		
		<%-- <c:forEach var="item" items="${ orderDetailModel }">
			<tr>
				<td width="100">주 문 자 : ${ item.member_id }</td>
				<td colspan="3" width="500"></td>
			</tr>
		</c:forEach> --%>
		
		<tr>
			<td width="100">주 문 자</td>
			<td colspan="3" width="500">${ memberInfo.member_id }</td>
		</tr>
		<tr>
			<td width="40">휴대폰번호</td>
			<td width="80">${ memberInfo.member_phone }</td>
			<td width="40">이메일</td>
			<td width="80">${ memberInfo.member_email }</td>
		</tr>
		
	</table><br>
		
		<h2 class="bul_green20">
				<span>주문 정보</span>
		</h2>
		
	<table class="table_myroom td_font_12" style="margin-top: -15px;">
		<caption>상세 내역</caption>
		<colgroup>
			<col width="14%" />
			<col width="20%" />
			<col width="20%" />
			<col width="5%" />
			<col width="15%" />
		</colgroup>
		
			<tr>
				<th class="first" scope="col">번호</th>
				<th scope="col">상품이미지</th>
				<th scope="col">상품 정보</th>
				<th scope="col">수량</th>
				<th scope="col">금액</th>
			</tr>
		<!-- <s:iterator value ="orderlist" status ="stat"> -->
		<tr align="center">
			
			<td>${ memberOrderDetail.BOOK_NUM }</td>
			<!-- <script>alert('${memberOrderDetail.BOOK_IMAGE}')</script> -->
			<td width="100" height="50"><img src="<%=cp%>/upload/${ memberOrderDetail.BOOK_IMAGE }" style="width: 130px;height: 120px;"/></td>
			<td align="left" width="270">
			주문 번호 : ${ memberOrderDetail.ORDER_TRADE_NUM }<br><br>
			도 서 명 : ${ memberOrderDetail.ORDER_BOOK_NAME }<br><br>
			주문 상태 : 
			<c:if test="${ memberOrderDetail.ORDER_TRANS_STATUS == 'ST01' }">
				배송 준비중
			</c:if>
			<c:if test="${ memberOrderDetail.ORDER_TRANS_STATUS == 'ST02' }">
				배송 중
			</c:if>
			<c:if test="${ memberOrderDetail.ORDER_TRANS_STATUS == 'ST03' }">
				배송 완료
			</c:if>
			<br><br>
			주문 날짜 : ${ memberOrderDetail.ORDER_REGDATE }<br><br>
			</td>
			<td>${ memberOrderDetail.ORDER_BOOK_COUNT }권</td><br>
			<td>${ memberOrderDetail.ORDER_BOOK_COUNT * memberOrderDetail.ORDER_BOOK_PRICE }원</td>
			
		</tr>
		<!-- </s:iterator> -->
	</table>
	<br><br>
	<table class="table_myroom td_font_12 margin_top10">
		<tr>
			<td width="100">받으실 분</td>
			<td colspan="3" width="500">${ memberOrderDetail.ORDER_RECEIVE_NAME }</td>
		</tr>
		<tr>
			<td width="40">휴대폰번호</td>
			<td width="80">${ memberOrderDetail.ORDER_RECEIVE_PHONE }</td>
			<td width="40">전화번호</td>
			<td width="80">${ memberOrderDetail.ORDER_RECEIVE_MOBILE }</td>
		</tr>
		<tr>
			<td width="100">주  소</td>
			<td colspan="3" width="500">${ memberOrderDetail.ORDER_RECEIVE_ADDR1 }&nbsp;</td>
		</tr>
		
	</table>
	<br>
	<input type=button value="닫기" align="middle" onclick="javascript:location.href='http://localhost:8080/namuduri/order/orderListCheckView.do'"/>
	</div>
</div>
</body>
</html>