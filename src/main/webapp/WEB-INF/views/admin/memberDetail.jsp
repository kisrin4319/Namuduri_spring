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
<title>회원 상세보기</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Member Detail</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<%=cp%>/admin/memberList.do">Member List</a></li>
					<li class="breadcrumb-item active">Member Detail</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
		<div class="row">
			<!-- Column -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-lg-3" style="text-align: center;">
								<img src="<%=cp%>/bootstrap/img/blog/1.jpg" width="150">
							</div>
							<div class="col-lg-9">
								<h4 class="card-title m-t-10">${view.member_name}
									(@${view.member_id}) #${view.member_num}</h4>
								<h6 class="card-subtitle">JOIN DATE :
									${view.member_join_date}</h6>
								<div class="row text-center justify-content-md-center">
									<div class="col-4">
										<a href="javascript:void(0)" class="link"> <i
											class="icon-people"></i> <font class="font-medium">회원
												정보</font></a>
									</div>
									<div class="col-4">
										<a href="javascript:void(0)" class="link"><i
											class="mdi mdi-cart-outline"></i> <font class="font-medium">구매
												내역</font></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-block">
						<form class="form-horizontal form-material">
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">Name</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_name}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group"></div>
									<div class="col-md-6">
										<label class="col-md-6">Password</label>
										<div class="col-md-12">
											<input type="password" value="${view.member_pw}"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group"></div>
							<div class="form-group">
								<label class="col-md-12 h4">ID Card Number</label>
								<div class="form-group"></div>
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-5">Number1</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_jumin1}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group">-</div>
									<div class="col-md-5">
										<label class="col-md-6">Number2</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_jumin2}"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-8">
										<label class="col-md-6">Email</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_email}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group"></div>
									<div class="col-md-4">
										<label class="col-md-12 col-md-12">Get email</label>
										<div class="col-md-12 p-2">
											<input type="radio" name="member_email_get"
												id="member_email_get" value="1"
												${view.member_email_get == '1' ? 'checked="checked"' : '' }>수신
											&nbsp; <input type="radio" name="member_email_get"
												id="member_email_get" value="0"
												${view.member_email_get == '0' ? 'checked="checked"' : '' }>비수신
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">Phone No</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_phone}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">Mobile No</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_mobile}"
												class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-md-12">Full Name</label>
								<div class="col-md-12">
									<input type="text" placeholder="Johnathan Doe"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Message</label>
								<div class="col-md-12">
									<textarea rows="5" class="form-control form-control-line"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-12">Select Country</label>
								<div class="col-sm-12">
									<select class="form-control form-control-line">
										<option>London</option>
										<option>India</option>
										<option>Usa</option>
										<option>Canada</option>
										<option>Thailand</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<button class="btn btn-success">Update Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Column -->
		</div>
		<div class="row">
			<div class="col-lg-8 col-xlg-9 col-md-7">
				<div class="card">
					<div class="card-block">
						<div class="table-responsive">
							<table class="table detail" border=1>

								<tr>
									<th>주민번호</th>
									<td>${view.member_jumin1}-${view.member_jumin2}</td>
								</tr>


								<tr>
									<th>주소</th>
									<td colspan=3>(${view.member_zipcode})
										${view.member_addr1}&nbsp;${view.member_addr2}</td>
								</tr>
							</table>
							<h5>환불 관련 정보</h5>
							<table border=1 class="table detail">
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
							<div class="detail_button">
								<input class="button" type=button value="목록보기"
									onclick="javascript:location.href='<%=cp%>/admin/memberList.do?currentPage=${currentPage}'">
								&nbsp;&nbsp; <input class="button" type=button value="수정하기"
									onclick="javascript:location.href='<%=cp%>/admin/memberModify.do?member_id=${view.member_id}&currentPage=${currentPage}'">
								&nbsp;&nbsp; <input class="button" type=button value="삭제하기"
									onclick="javascript:location.href='<%=cp%>/admin/memberDelete.do?member_id=${view.member_id}&currentPage=${currentPage}'" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-block">
						<div class="table-responsive">
							<table border=1 class="table detail">
								<tr>
									<th width=20%>주문 날짜</th>
									<th width=20%>주문 번호</th>
									<th width=20%>결제 상태</th>
									<th width=20%>배송 번호</th>
									<th width=20%>배송 상태</th>
								</tr>
								<c:choose>
									<c:when test="${orderList.size()==0}">
										<c:forEach var="list" items="${orderList}" varStatus="stat">
											<c:url var="viewOrder" value="/admin/orderDetail.do">
												<c:param name="order_trade_num"
													value="${list.order_trade_num}" />
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
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan=5>주문한 내역이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>