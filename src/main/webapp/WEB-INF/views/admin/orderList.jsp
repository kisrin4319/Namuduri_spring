<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=cp%>/css/adminPage.css" rel="stylesheet" type="text/css" />
<title>주문 정보 조회</title>
</head>
<body>
<!-- 검색창 영역 -->
<div class="searcharea">
		<form>
			<div class="search_input">
				<select name="searchNum" class="searchNum">
					<option value="0">주문번호</option>
					<option value="1">배송번호</option>
					<option value="2">주문자 ID</option>
					<option value="3">결제인</option>
					<option value="4">수취인</option>
					<option value="5">전화번호</option><!-- 수취인 폰, 모바일 둘 다! -->
				</select> <input class="searchKeyword" type="text" name="searchKeyword">
				<input class="searchbutton" name="submit" type="submit" value="검색">
			</div>
		</form>
	</div>
<!-- 주문 리스트 출력 -->
<div class="list">
<table class="table_list">
<tr>
	<th width=12%><b>주문번호</b></th>
	<th width=10%><b>주문날짜</b></th>
	<th width=10%><b>주문자 ID</b></th>
	<th width=10%><b>결제인</b></th>
	<th width=10%><b>결제상태</b></th>
	<th width=12%><b>배송번호</b></th>
	<th width=10%><b>수취인</b></th>
	<th width=10%><b>수취인 번호</b></th>
	<th width=10%><b>배송상태</b></th>
</tr>
<c:choose>
	<c:when test="${listCount==0}">
		<tr align=center>
			<td colspan=8>주문 내역이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="list" items="${orderList}" varStatus="stat">
			<!-- 주문번호와 연결되는 URL -->
			<c:url var="viewOrderURL" value="/admin/orderDetail.do">
				<c:param name="order_trade_num" value="${list.order_trade_num}"/>
				<c:param name="currentPage" value="currentPage"/>
			</c:url>
			<tr>
				<td><a href="${viewOrderURL}">${list.order_trade_num}</a></td>
				<td>${list.order_regdate}</td>
				<td>${list.member_id}</td>
				<td>${list.order_trade_payer}</td>
				<td>${list.payment_status}</td>
				<td>${list.order_trans_num}</td>
				<td>${list.order_receive_name}</td>
				<td>${list.order_receive_mobile}</td>
				<td>${list.order_trans_status}</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<!-- paging -->
<table class="paging">
<tr align=center>
	<td colspan=8>${pagingHtml}</td>
</tr>
</table>
</div>
</body>
</html>