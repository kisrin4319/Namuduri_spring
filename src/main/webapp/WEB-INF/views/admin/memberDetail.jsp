<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세보기</title>
<script>
var page = ${currentPage};
var id = ${view.member_id};
var stat = '${status}';

function updateCheck(id){
	if(confirm("정말 수정하시겠습니까?")){
		document.memberModel.submit();
	}else{
		return false
	}	
}
function deleteCheck(path) {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.location.href="<%=cp%>/admin/memberDelete.do?status="+stat+"&member_id="+id+"&currentPage="+page;
	}else{
		return false;
	}
}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Member Detail</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<%=cp%>/admin/main.do">Home</a>
					</li>
					<li class="breadcrumb-item">
						<a href="<%=cp%>/admin/memberList/${status}.do">Member List</a>
					</li>
					<li class="breadcrumb-item active">Member Detail</li>
				</ol>
			</div>
		</div>
		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
		<div class="row">
			<!-- Column -->
			<div class="col-lg-12">
				<h3>Member Information</h3>
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-lg-3" style="text-align: center;">
								<img src="<%=cp%>/bootstrap/img/blog/1.jpg" width="150">
							</div>
							<div class="col-lg-9">
								<h4 class="card-title m-t-10">${view.member_name}(@${view.member_id}) #${view.member_num}</h4>
								<h6 class="card-subtitle">
									<b>JOIN DATE :</b>
									${view.member_join_date}
								</h6>
								<div class="row text-center justify-content-md-center">
									<div class="col-4">
										<a href="#info" class="link">
											<i class="icon-people"></i>
											<font class="font-medium">회원정보</font>
										</a>
									</div>
									<div class="col-4">
										<a href="#purchase" class="link">
											<i class="mdi mdi-cart-outline"></i>
											<font class="font-medium">구매내역</font>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="info">
			<div class="col-lg-12">
				<h4>
					<b>회원 정보</b>
				</h4>
				<div class="card">
					<div class="card-block">
						<form class="form-horizontal form-material" method="post" id="memberModel" onsubmit="return updateCheck()">
							<div class="col-md-2">
								<h4>
									<b>회원 기본 정보 ▽</b>
								</h4>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">Name</label>
										<div class="col-md-12">
											<input type="text" name="member_name" value="${view.member_name}" class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group"></div>
									<div class="col-md-6">
										<label class="col-md-6">Password</label>
										<div class="col-md-12">
											<input type="text" name="member_pw" value="${view.member_pw}" class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12 h6">ID Card Number</label>
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-5">Number1</label>
										<div class="col-md-12">
											<input type="text" name="member_jumin1" value="${view.member_jumin1}" class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group" style="margin: 30px 0 0 0;">-</div>
									<div class="col-md-5">
										<label class="col-md-6">Number2</label>
										<div class="col-md-12">
											<input type="text" name="member_jumin2" value="${view.member_jumin2}" class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-8">
										<label class="col-md-6">Email</label>
										<div class="col-md-12">
											<input type="text" name="member_email" value="${view.member_email}" class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group"></div>
									<div class="col-md-4">
										<label class="col-md-12 col-md-12">Get email</label>
										<div class="col-md-12 p-2">
											<input type="radio" name="member_email_get" id="member_email_get" value="1" ${view.member_email_get == '1' ? 'checked="checked"' : '' }>
											수신 &nbsp;
											<input type="radio" name="member_email_get" id="member_email_get" value="0" ${view.member_email_get == '0' ? 'checked="checked"' : '' }>
											비수신
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">Phone No</label>
										<div class="col-md-12">
											<input type="text" name="member_phone" value="${view.member_phone}" class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">Mobile No</label>
										<div class="col-md-12">
											<input type="text" name="member_mobile" value="${view.member_mobile}" class="form-control form-control-line">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<div class="row">
										<label class="col-md-12">Address</label>
										<div class="col-md-2">
											<input type="text" name="member_zipcode" class="form-control form-control-line" value="${view.member_zipcode}">
										</div>
										<div class="col-md-1">
											<input type="button" value="검색">
										</div>
										<div class="col-md-5">
											<input type="text" name="member_addr1" class="form-control form-control-line" value="${view.member_addr1}">
										</div>
										<div class="col-md-4">
											<input type="text" name="member_addr2" class="form-control form-control-line" value="${view.member_addr2}">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group"></div>
							<div class="form-group"></div>
							<div class="col-md-2">
								<h4>
									<b>환불 관련 정보 ▽</b>
								</h4>
							</div>
							<div class="form-group"></div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">Bank Name</label>
										<div class="col-md-12">
											<input type="text" name="member_bankname" value="${view.member_bankname}" class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">예금주</label>
										<div class="col-md-12">
											<input type="text" name="member_account_holder" value="${view.member_account_holder}" class="form-control form-control-line">
										</div>
									</div>
								</div>
								<div class="form-group"></div>
								<label class="col-md-6">환불 계좌</label>
								<div class="col-md-12">
									<input type="text" name="member_refund_account" value="${view.member_refund_account}" class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group">
								<input type="hidden" name="currentPage" value="${currentPage}">
								<%-- <input type="hidden" name="member_id" value="${view.member_id}"> --%>
							</div>
							<div class="form-group">
								<div class="row col-md-12">
									<label class="col-md-2">차단 여부</label>
									<div class="col-md-5 p-2">
										<input type="radio" name="member_use_yn" id="member_use_yn" value="0" ${view.member_use_yn == '0' ? 'checked="checked"' : '' }>
										활성화 &nbsp;
										<input type="radio" name="member_use_yn" id="member_email_get" value="1" ${view.member_use_yn == '1' ? 'checked="checked"' : '' }>
										차단됨
									</div>
									<div class="col-sm-5">
										<button class="btn btn-warning">Update Profile</button>
										&nbsp;
										<a class="btn btn-danger" onclick="deleteCheck()">Delete Profile</a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="purchase">
			<div class="col-lg-12">
				<h4>
					<b>구매 내역</b>
				</h4>
				<div class="card">
					<div class="card-block">
						<div class="row col-md-12">
							<div class="row col-md-4">
								<div class="row col-md-4">
									<b>보유 포인트</b>
								</div>
								<div class="col-md-8">${view.member_point}</div>
							</div>
							<div class="row col-md-4">
								<div class="row col-md-4">
									<b>주문 횟수</b>
								</div>
								<div class="col-md-8">${view.member_order_count}</div>
							</div>
							<div class="row col-md-4">
								<div class="row col-md-4">
									<b>총 구매 금액</b>
								</div>
								<div class="col-md-8">${view.member_moneysum}</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-block">
						<div class="table-responsive">
							<form class="form-inline" method="POST"></form>
							<div class="col-lg-12">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs profile-tab" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#home" role="tab">주문 내역</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#profile" role="tab">취소된 주문</a>
									</li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<!-- first tab -->
									<div class="tab-pane active" id="home" role="tabpanel">
										<div class="card-block">
											<table class="list-items table table-hover table-striped">
												<thead class="list-header">
													<tr>
														<th>주문번호</th>
														<th>결제인</th>
														<th>배송번호</th>
														<th>수취인</th>
														<th>수취인 번호</th>
														<th>결제상태</th>
														<th>배송상태</th>
														<th>주문날짜</th>
													</tr>
												</thead>
												<tbody>
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
																	<c:param name="status" value="${status}"/>
																	<c:param name="order_trade_num" value="${list.order_trade_num}" />
																	<c:param name="currentPage" value="${currentPage}" />
																</c:url>
																<tr>
																	<td>
																		<a href="${viewOrderURL}">${list.order_trade_num}</a>
																	</td>
																	<td>${list.order_trade_payer}</td>
																	<td>${list.order_trans_num}</td>
																	<td>${list.order_receive_name}</td>
																	<td>${list.order_receive_mobile}</td>
																	<td>${list.payment_status}</td>
																	<td>${list.order_trans_status}</td>
																	<td>${list.order_regdate}</td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
									</div>
									<!--second tab-->
									<div class="tab-pane" id="profile" role="tabpanel">
										<div class="card-block">
											<table class="list-items table table-hover table-striped">
												<thead class="list-header">
													<tr>
														<th>주문번호</th>
														<th>결제인</th>
														<th>배송번호</th>
														<th>수취인</th>
														<th>수취인 번호</th>
														<th>결제상태</th>
														<th>주문상태</th>
														<th>주문날짜</th>
													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${listCountBck==0}">
															<tr align=center>
																<td colspan=8>주문 내역이 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach var="list" items="${orderListBck}" varStatus="stat">
																<!-- 주문번호와 연결되는 URL -->
																<c:url var="viewOrderURL" value="/admin/orderDetail.do">
																	<c:param name="status" value="all"/>
																	<c:param name="order_trade_num" value="${list.order_trade_num}" />
																	<c:param name="currentPage" value="currentPage" />
																</c:url>
																<tr>
																	<td>
																		<a href="${viewOrderURL}">${list.order_trade_num}</a>
																	</td>
																	<td>${list.order_trade_payer}</td>
																	<td>${list.order_trans_num}</td>
																	<td>${list.order_receive_name}</td>
																	<td>${list.order_receive_mobile}</td>
																	<td>${list.payment_status}</td>
																	<td>
																		<c:if test="${list.order_use_yn==0}">취소됨</c:if>
																	</td>
																	<td>${list.order_regdate}</td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>