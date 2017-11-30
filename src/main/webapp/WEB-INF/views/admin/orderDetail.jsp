<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 상세보기</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Order Detail</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<%=cp%>/admin/orderList.do">Order List</a></li>
					<li class="breadcrumb-item active">Order Detail</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<h2>주문 정보 상세보기</h2>
					<div class="table-responsive">
						<input type="hidden" name="currentPage" value="${currentPage}" />
						<input type="hidden" name="order_trade_num"
							value="${view.order_trade_num}" />
						<table class="table order">
							<c:url var="viewMemberURL" value="/admin/memberDetail.do">
								<c:param name="member_id" value="${view.member_id}" />
							</c:url>
							<tr>
								<th>주문번호</th>
								<td>${view.order_trade_num}</td>
								<th>주문날짜</th>
								<td>${view.order_regdate}</td>
							</tr>
							<tr>
								<th>주문자</th>
								<td>
									<%-- ${view.member_name} --%> (<a href="${viewMemberURL}">${view.member_id}</a>)
								</td>
								<th>결제 상태</th>
								<td><select class="form-control" style="width: auto;" name="payment_status">
										<c:choose>
											<c:when test="${view.payment_status =='PS01'}">
												<option value="PS01" selected="selected">결제 대기중</option>
												<option value="PS02">결제 완료</option>
											</c:when>
											<c:otherwise>
												<option value="PS01">결제 대기중</option>
												<option value="PS02" selected="selected">결제 완료</option>
											</c:otherwise>
										</c:choose>
								</select>
									<button class="btn btn-warning">
										<i class="mdi mdi-grease-pencil"></i>
									</button></td>
							</tr>
							<tr>
								<th width=15%>결제자</th>
								<td width=35%>${view.order_trade_payer}</td>
								<th width=15%>결제 방법</th>
								<td width=35%>${view.order_trade_status}</td>
							</tr>
							<tr>
								<th width=15%>입금 은행</th>
								<td width=35%>${view.order_bank_name}</td>
								<th width=15%>입금 은행 계좌번호</th>
								<td width=35%>${view.order_bank_num}</td>
							</tr>
							<tr>
								<th width=15%>은행명</th>
								<td width=35%>${viewM.member_bankname}</td>
								<th width=15%>예금주</th>
								<td width=35%>${viewM.member_account_holder}</td>
							</tr>
							<tr>
								<th width=15%>환불계좌</th>
								<td width=85% colspan=3>${viewM.member_refund_account}</td>
							</tr>
							<tr>
								<th width=15%>주문 상태</th>
								<td class="getyn" width=85% colspan=3><input type="radio"
									name="order_use_yn" id="order_use_yn" value="1"
									${view.order_use_yn == '1' ? 'checked="checked"' : '' }>주문됨<!-- 기본값 -->
									<input type="radio" name="order_use_yn" id="order_use_yn"
									value="0"
									${view.order_use_yn == '0' ? 'checked="checked"' : '' }>취소됨
									&nbsp;
									<button class="btn btn-warning">
										<i class="mdi mdi-grease-pencil"></i>
									</button></td>
							</tr>
						</table>
						<br>
						<h2>주문 상품 목록</h2>
						<table class="table order">
							<tr>
								<th width=15>상품 번호</th>
								<th width=50>상품 이름</th>
								<th width=20>상품 가격</th>
								<th width=15>상품 수량</th>
							</tr>

							<c:forEach var="list" items="${orderDetailList}" varStatus="stat">
								<c:url var="viewBookURL" value="/admin/bookDetail.do">
									<c:param name="book_num" value="${list.book_num}" />
								</c:url>

								<tr>
									<td><a href="${viewBookURL}">${list.book_num}</a></td>
									<td>${list.order_book_name}</td>
									<td>${list.order_book_price}</td>
									<td>${list.order_book_count}</td>
								</tr>
							</c:forEach>

							<tr>
								<td colspan=4><b>총 구매 금액 : <font color="red">${view.order_receive_moneysum}원</font></b></td>
							</tr>
						</table>
						<h2>배송 정보 상세보기</h2>
						<table class="table order">
							<tr>
								<th width=15%>배송번호</th>
								<td width=35%>${view.order_trans_num}</td>
								<th width=15%>배송 상태</th>
								<td width=35%><select class="form-control"
									style="width: auto;" class="form-control"
									name="order_trans_status">
										<c:choose>
											<c:when test="${view.order_trans_status == 'ST01'}">
												<option value="ST01" selected="selected">배송 준비중</option>
												<option value="ST02">배송 중</option>
												<option value="ST03">배송 완료</option>
											</c:when>
											<c:when test="${view.order_trans_status == 'ST02'}">
												<option value="ST01">배송 준비중</option>
												<option value="ST02" selected="selected">배송 중</option>
												<option value="ST03">배송 완료</option>
											</c:when>
											<c:otherwise>
												<option value="ST01">배송 준비중</option>
												<option value="ST02">배송 중</option>
												<option value="ST03" selected="selected">배송 완료</option>
											</c:otherwise>
										</c:choose>
								</select>
									<button class="btn btn-warning">
										<i class="mdi mdi-grease-pencil"></i>
									</button></td>
							</tr>
							<tr>
								<th width=15%>수취인</th>
								<td width=85% colspan=3>${view.order_receive_name}</td>
							</tr>
							<tr>
								<th width=15%>집 전화 번호</th>
								<td width=35%>${view.order_receive_phone}</td>
								<th width=15%>휴대전화 번호</th>
								<td width=35%>${view.order_receive_mobile}</td>
							</tr>
							<tr>
								<th width=15%>우편번호</th>
								<td width=85% colspan=3>${view.order_receive_zipcode}</td>
							</tr>
							<tr>
								<th width=15%>주소</th>
								<td width=85% colspan=3>${view.order_receive_addr1}&nbsp;${view.order_receive_addr2}</td>
							</tr>
							<tr>
								<th width=15%>요청 사항</th>
								<td width=85% colspan=3>${view.order_receive_memo}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>