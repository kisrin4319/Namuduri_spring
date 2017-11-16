<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/adminPage.css" rel="stylesheet" type="text/css" />
<title>주문 상세보기</title>
</head>
<body>
<div class="detail">
<h2  class="detail_h2">주문 정보 상세보기</h2>
<form method="post" action="adminOrderModify.do">
<table border=1 cellspacing=0 cellpadding=0 class="table_detail">

	<s:url id="viewMemberURL" action="adminViewMember">
			<s:param name="member_id">
				<s:property value="resultClass.member_id"/>
			</s:param>
	</s:url>
	
	<tr>
		<th width=15%>주문번호</th>
		<td width=35%><s:property value="resultClass.order_trade_num"/></td>
		<th width=15%>주문날짜</th>
		<td width=35%><s:property value="resultClass.order_regdate"/></td>
	</tr>
	<tr>
		<th width=15%>주문자</th>
		<td colspan=3><s:property value="memberResultClass.member_name"/>
		(<s:a href="%{viewMemberURL}"><s:property value="resultClass.member_id"/></s:a>)</td>
	</tr>
	<tr>
		<td align=center colspan=4><h2>주문 내역</h2></td>
	</tr>
	<tr>
		<th width=15>상품 번호</th>
		<th width=50>상품 이름</th>
		<th width=20>상품 가격</th>
		<th width=15>상품 수량</th>
	</tr>
	
<s:iterator value="list" status="stat">
	<s:url id="viewTextbookURL" action="adminTextbookDetail">
			<s:param name="goods_num">
				<s:property value="goods_num"/>
			</s:param>
	</s:url>
		
	<tr>
		<td><s:a href="%{viewTextbookURL}"><s:property value="goods_num"/></s:a></td>
		<td><s:property value="order_goods_name"/></td>
		<td><s:property value="order_goods_price"/></td>
		<td><s:property value="order_goods_count"/></td>
	</tr>
	
</s:iterator>

	<tr>
		<td colspan=4><b>총 금액 : <font size="red"><s:property value="resultClass.order_receive_moneysum"/></font></b></td>
	</tr>
	<tr>
		<th width=15%>결제자</th>
		<td width=35%><s:property value="resultClass.order_trade_payer"/></td>
		<th width=15%>결제 방법</th>
		<td width=35%><s:property value="order_trade_status"/></td>
	</tr>
	<tr>
		<th width=15%>입금 은행</th>
		<td width=35%><s:property value="resultClass.order_bankname"/></td>
		<th width=15%>입금 은행 계좌번호</th>
		<td width=35%><s:property value="resultClass.order_bank_num"/></td>
	</tr>
	<tr>
		<th width=15%>결제 상태</th>
		<td width=85% colspan=3>
		<s:if test="resultClass.payment_status =='PS01'">
			<select name="payment_status">
				<option value="PS01" selected="selected">결제 대기중</option>
				<option value="PS02">결제 완료</option>
			</select>
		</s:if>
		<s:else>
			<select name="payment_status">
				<option value="PS01">결제 대기중</option>
				<option value="PS02" selected="selected">결제 완료</option>
			</select>		
		</s:else>
		</td>
	</tr>
	<tr>
		<th width=15%>배송번호</th>
		<td width=35%><s:property value="resultClass.order_trans_num"/></td>
		<th width=15%>배송 상태</th>
		<td width=35%>
		<select name="order_trans_status">
			<s:if test="resultClass.order_trans_status == 'ST01'">
				<option value="ST01" selected="selected">배송 준비중</option>
				<option value="ST02">배송 중</option>
				<option value="ST03">배송 완료</option>
			</s:if>
			<s:elseif test="resultClass.order_trans_status == 'ST02'">
				<option value="ST01">배송 준비중</option>
				<option value="ST02" selected="selected">배송 중</option>
				<option value="ST03">배송 완료</option>
			</s:elseif>
			<s:else>
				<option value="ST01">배송 준비중</option>
				<option value="ST02">배송 중</option>
				<option value="ST03" selected="selected">배송 완료</option>
			</s:else>				
			</select>
		</td>
	</tr>
	<tr>
		<th width=15%>수취인</th>
		<td width=85% colspan=3><s:property value="resultClass.order_receive_name"/></td>
	</tr>
	<tr>
		<th width=15%>집 전화 번호</th>
		<td width=35%><s:property value="resultClass.order_receive_phone"/></td>
		<th width=15%>휴대전화 번호</th>
		<td width=35%><s:property value="resultClass.order_receive_mobile"/></td>
	</tr>
	<tr>
		<th width=15%>우편번호</th>
		<td width=85% colspan=3><s:property value="resultClass.order_receive_zipcode"/></td>
	</tr>
	<tr>
		<th width=15%>주소</th>
		<td width=85% colspan=3><s:property value="resultClass.order_receive_addr1"/>&nbsp;<s:property value="resultClass.order_receive_addr2"/></td>
	</tr>
	<tr>
		<th width=15%>요청 사항</th>
		<td width=85% colspan=3><s:property value="resultClass.order_receive_memo"/></td>
	</tr>
	<tr>
		<th width=15%>은행명</th>
		<td width=35%><s:property value="resultMClass.member_bankname"/></td>
		<th width=15%>예금주</th>
		<td width=35%><s:property value="resultMClass.member_account_holder"/></td>
	</tr>
	<tr>
		<th width=15%>환불계좌</th>
		<td width=85% colspan=3><s:property value="resultMClass.member_refund_account"/></td>
	</tr>	
	<tr>
		<th width=15%>주문 내역 표시 여부</th>
		<td class="getyn" width=85% colspan=3>
			<input type="radio" name="order_use_yn" id="order_use_yn" value="1" 
				${resultClass.order_use_yn == '1' ? 'checked="checked"' : '' }>사용 
			<input type="radio" name="order_use_yn" id="order_use_yn" value="0" 
				${resultClass.order_use_yn == '0' ? 'checked="checked"' : '' }>비사용
		</td>
	</tr>
</table>
<br>
<s:hidden name="order_trade_num" value="%{resultClass.order_trade_num}"/>
<div class="detail_button">
<input class="button" type=submit name=submit value="수정하기" onclick="javascript:location.href='adminOrderModify.do?order_trade_num=<s:property value="resultClass.order_trade_num"/>&currentPage=<s:property value="currentPage"/>'">
&nbsp;&nbsp;
<input class="button" type=button value="목록보기" onclick="javascript:location.href='adminOrderCheck.do?currentPage=<s:property value="currentPage"/>'">
</div>
</form>
</div>
</body>
</html>