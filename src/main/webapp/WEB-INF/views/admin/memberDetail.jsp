<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=cp%>/css/adminPage.css" rel="stylesheet" type="text/css" />
<title>회원 상세보기</title>
</head>
<body>
<div class="detail">
<h2 class="detail_h2">회원 정보 상세보기</h2>
<table border=1 cellspacing=0 cellpadding=0 class="table_detail">
	<tr>
		<th>회원 번호</th>
		<td>${view.member_num}</td>
		<th>가입일</th>
		<td>${view.member_join_date}</td>
	</tr>
	<tr>
		<th>ID</th>
		<td>${view.member_id}</td>
		<th>비밀번호</th>
		<td>${view.member_pw}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${view.member_name}</td>
		<th>주민번호</th>
		<td>${view.member_jumin1}-${view.member_jumin2}</td>
	</tr>
	<tr>
		<th>E-MAIL</th>
		<td>${view.member_email}</td>
		<th>E-MAIL 수신여부</th>
		<td class="getyn">
			<input type="radio" name="member_email_get" id="member_email_get" value="1" 
				${view.member_email_get == '1' ? 'checked="checked"' : '' }>수신
			<input type="radio" name="member_email_get" id="member_email_get" value="0" 
				${view.member_email_get == '0' ? 'checked="checked"' : '' }>비수신
		</td>
	</tr>
	<tr>
		<th>집 전화 번호</th>
		<td>${view.member_phone}</td>
		<th>휴대전화 번호</th>
		<td>${view.member_mobile}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan=3>(${view.member_zipcode})
		${view.member_addr1}&nbsp;${view.member_addr2}</td>
	</tr>
</table>
<br>
<h2  class="detail_h2">환불 관련 정보</h2>
<table border=1 cellspacing=0 cellpadding=0 class="table_detail">
	<tr>
		<th width=15%>은행명</th>
		<td width=35%>${view.member_bankname}</td>
		<th width=15%>예금주</th>
		<td width=35%>${view.member_account_holder}</td>
	</tr>
	<tr>
		<th>환불계좌</th>
		<td colspan=3>${view.member_refund_account}</td>
	</tr>
</table>
<br>
<div class="detail_button">
<input class="button" type=button value="목록보기" 
	onclick="javascript:location.href='<%=cp%>/admin/memberList.do?currentPage=${currentPage}'">
&nbsp;&nbsp;
<input class="button" type=button value="수정하기" 
	onclick="javascript:location.href='<%=cp%>/admin/memberModify.do?member_id=${view.member_id}&currentPage=${currentPage}'">
&nbsp;&nbsp;
<input class="button" type=button value="삭제하기" 
	onclick="javascript:location.href='<%=cp%>/admin/memberDelete.do?member_id=${view.member_id}&currentPage=${currentPage}'"/>
</div>
<br>
<br>
<h2 class="detail_h2">주문 내역</h2>
<table border=1 cellspacing=0 cellpadding=0 class="table_detail">
<tr>
	<th width=20%>주문 날짜</th>
	<th width=20%>주문 번호</th>
	<th width=20%>결제 상태</th>
	<th width=20%>배송 번호</th>
	<th width=20%>배송 상태</th>
</tr>
<c:forEach var="list" items="${orderList}" varStatus="stat">
	<c:url var="viewOrder" value="/admin/orderDetail.do">
		<c:param name="order_trade_num" value="${list.order_trade_num}"/>
	</c:url>
	<tr>
		<td>${list.order_regdate}</td>
		<td><a href="${viewOrder}">${list.order_trade_num}</a></td>
		<td>${list.payment_status}</td>
		<td>${list.order_trans_num}</td>
		<td>${list.order_trans_status}</td>
	</tr>
<%--  	<s:iterator value="listD" status="stat">
		<tr>
			<td><s:property value="goods_num"/></td>
			<td><s:property value="order_goods_name"/></td>
			<td><s:property value="order_goods_price"/></td>
			<td><s:property value="order_goods_count"/></td>
		</tr>
	</s:iterator> --%>
</c:forEach>
</table>
</div>
</body>
</html>