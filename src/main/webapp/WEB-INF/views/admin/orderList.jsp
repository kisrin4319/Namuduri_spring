<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/adminPage.css" rel="stylesheet" type="text/css" />
<title>주문 정보 조회</title>
</head>
<body>
<!-- 검색창 영역 -->
<div class="searcharea">
<form >
	<select name="searchNum" class="searchNum">
		<option value="0">주문번호</option>
		<option value="1">배송번호</option>
	</select>
	<input class="searchKeyword" type="text" name="searchKeyword">
	<input class="searchbutton" name="submit" type="submit" value="검색">
</form>
</div>
<!-- 주문 리스트 출력 -->
<div class="list">
<table class="table_list">
<tr>
	<th width=12%><b>주문번호</b></th>
	<th width=10%><b>주문날짜</b></th>
	<th width=10%><b>주문자 ID</b></th>
	<th width=10%><b>결제자</b></th>
	<th width=10%><b>결제상태</b></th>
	<th width=12%><b>배송번호</b></th>
	<th width=10%><b>수취인</b></th>
	<th width=10%><b>수취인 번호</b></th>
	<th width=10%><b>배송상태</b></th>
</tr>
<!-- iterator로 주문 리스트 출력 -->
<s:iterator value="list" status="stat">
<!-- 주문번호와 연결되는 URL -->
	<s:url id="viewOrderURL" action="adminOrderDetail">
		<s:param name="order_trade_num">
			<s:property value="order_trade_num"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	
	<tr>
		<td><s:a href="%{viewOrderURL}"><s:property value="order_trade_num"/></s:a></td>
		<td><s:property value="order_regdate"/></td>
		<td><s:property value="member_id"/></td>
		<td><s:property value="order_trade_payer"/></td>
		<td><s:property value="payment_status"/></td>
		<td><s:property value="order_trans_num"/></td>
		<td><s:property value="order_receive_name"/></td>
		<td><s:property value="order_receive_mobile"/></td>
		<td><s:property value="order_trans_status"/></td>
	</tr>
</s:iterator>

<s:if test="list.size()==0">
<tr align=center>
	<td colspan=8>주문 내역이 없습니다.</td>
</tr>
</s:if>
</table>

<!-- paging -->
<table class="paging">
<tr align=center>
	<td colspan=8><s:property value="pagingHtml" escape="false"/></td>
</tr>
</table>
</div>
</body>
</html>