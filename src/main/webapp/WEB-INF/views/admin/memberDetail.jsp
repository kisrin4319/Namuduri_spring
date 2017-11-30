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
				<h3>Member Information</h3>
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-lg-3" style="text-align: center;">
								<img src="<%=cp%>/bootstrap/img/blog/1.jpg" width="150">
							</div>
							<div class="col-lg-9">
								<h4 class="card-title m-t-10">${view.member_name}
									(@${view.member_id}) #${view.member_num}</h4>
								<h6 class="card-subtitle">
									<b>JOIN DATE :</b> ${view.member_join_date}
								</h6>
								<div class="row text-center justify-content-md-center">
									<div class="col-4">
										<a href="javascript:void(0)" class="link"> <i
											class="icon-people"></i> <font class="font-medium">회원정보</font></a>
									</div>
									<div class="col-4">
										<a href="javascript:void(0)" class="link"> <i
											class="mdi mdi-cart-outline"> </i> <font class="font-medium">구매내역</font></a>
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
				<h4>
					<b>회원 정보</b>
				</h4>
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
							<div class="form-group">
								<label class="col-md-12 h6">ID Card Number</label>
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-5">Number1</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_jumin1}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="form-group" style="margin: 30px 0 0 0;">-</div>
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
								<div class="col-md-12">
									<div class="row">
										<label class="col-md-12">Address</label>
										<div class="col-md-2">
											<input type="text" class="form-control form-control-line"
												value="${view.member_zipcode}">
										</div>
										<div class="col-md-1">
											<input type="button" value="검색">
										</div>
										<div class="col-md-5">
											<input type="text" class="form-control form-control-line"
												value="${view.member_addr1}">
										</div>
										<div class="col-md-4">
											<input type="text" class="form-control form-control-line"
												value="${view.member_addr2}">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group"></div>
							<label class="col-md-12 h4"><b>환불 정보</b></label>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label class="col-md-6">Bank Name</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_bankname}"
												class="form-control form-control-line">
										</div>
									</div>
									<div class="col-md-6">
										<label class="col-md-6">예금주</label>
										<div class="col-md-12">
											<input type="text" value="${view.member_account_holder}"
												class="form-control form-control-line">
										</div>
									</div>

								</div>
								<div class="form-group"></div>

								<label class="col-md-6">환불 계좌</label>
								<div class="col-md-12">
									<input type="text" value="${view.member_refund_account}"
										class="form-control form-control-line">
								</div>
							</div>
							<div class="form-group"></div>
							<div class="form-group">
								<div class="col-sm-12">
									<button class="btn btn-warning"
										onclick="javascript:location.href='<%=cp%>/admin/memberModify.do?member_id=${view.member_id}&currentPage=${currentPage}'">Update
										Profile</button>
									&nbsp;
									<button class="btn btn-danger"
										onclick="javascript:location.href='<%=cp%>/admin/memberDelete.do?member_id=${view.member_id}&currentPage=${currentPage}'">Delete
										Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h4>
					<b>구매 내역</b>
				</h4>
				<div class="card">
					<div class="card-block">
						<div class="table-responsive">
							<nav class="main-navbar">
								<form class="form-inline" method="POST"
									action="/admin/default/jqadm/search/product?lang=en">
									<input class="csrf-token" type="hidden" name="_token"
										value="l5mVyaZRPdp53vmVVmSSuP02irvG7LuQi76Q86Xe" /> <i
										class="fa more"></i>

									<div class="input-group">
										<select class="custom-select filter-key" name="filter[key][0]">
											<option value="product.label" data-type="string">
						Label					</option>
										</select> <select class="custom-select filter-operator"
											name="filter[op][0]">
											<option value="=~">
					=~&nbsp;&nbsp;starts with				</option>
										</select> <input type="text" class="form-control filter-value"
											name="filter[val][0]" value="">
										<button class="input-group-addon btn btn-primary fa fa-search"></button>
									</div>

								</form>
							</nav>
							<div class="col-lg-12">
								<!-- 검색창 영역 -->
								<!-- <div class="searcharea">
				<form>
					<div class="search_input">
						<select name="searchNum" class="searchNum">
							<option value="0">ID</option>
							<option value="1">이름</option>
							<option value="2">EMAIL</option>
							<option value="3">전화번호</option>
							<option value="4">휴대폰번호</option>
							<option value="5">주민번호 앞자리</option>
						</select> <input class="searchKeyword" type="text" name="searchKeyword">
						<input class="searchbutton" name="submit" type="submit" value="검색">
					</div>
				</form>
			</div> -->

								<!-- Nav tabs -->
								<ul class="nav nav-tabs profile-tab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home" role="tab">전체</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#profile" role="tab">주문 취소</a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<!-- first tab -->
									<div class="tab-pane active" id="home" role="tabpanel">
										<div class="card-block">

											<form class="list list-product" method="POST">
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
														<tr class="list-search">
															<td><input class="form-control" type="text"
																name="member_id" value="" /></td>
															<td><input class="form-control" type="text"
																name="member_name" value="" /></td>
															<td><input class="form-control" type="text"
																name="member_jumin" value="" /></td>
															<td><input class="form-control" type="text"
																name="member_phone" value="" /></td>
															<td><input class="form-control" type="text"
																name="member_emial" value="" /></td>
															<td><select class="form-control"
																name="payment_status">
																	<option value="">All</option>
																	<option value="0">PS01</option>
																	<option value="1">PS02</option>
															</select></td>
															<td><select class="form-control"
																name="payment_status">
																	<option value="">All</option>
																	<option value="0">ST01</option>
																	<option value="1">ST02</option>
																	<option value="2">ST03</option>
															</select></td>
															<td colspan=2 class="actions" style="vertical-align: middle;">
																<!-- <a class="fa fa-refresh" href="#" title="Reset"></a> -->
																<button type="submit" style="font-size: 20px;"
																	class="fa fa-search" title="Search"></button>
															</td>
														</tr>

														<c:choose>
															<c:when test="${listCount==0}">
																<tr align=center>
																	<td colspan=8>주문 내역이 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>
																<c:forEach var="list" items="${orderList}"
																	varStatus="stat">
																	<!-- 주문번호와 연결되는 URL -->
																	<c:url var="viewOrderURL" value="/admin/orderDetail.do">
																		<c:param name="order_trade_num"
																			value="${list.order_trade_num}" />
																		<c:param name="currentPage" value="currentPage" />
																	</c:url>
																	<tr>
																		<td><a href="${viewOrderURL}">${list.order_trade_num}</a></td>
																		<td>${list.order_trade_payer}</td>
																		<td>${list.order_trans_num}</td>
																		<td>${list.order_receive_name}</td>
																		<td>${list.order_receive_mobile}</td>
																		<td>${list.payment_status}</td>
																		<td>${list.order_trans_status}</td>
																		<td>${list.order_regdate}</td>
																		<td><a class="mdi mdi-grease-pencil"
																			title="Modify"
																			href="javascript:location.href='<%=cp%>/admin/memberModify.do?member_id=${list.member_id}&currentPage=${currentPage}'"></a>
																			<a class="mdi mdi-delete" title="Delete"
																			href="deleteCheck('${list.member_id}')"></a></td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											</form>
										</div>
									</div>
									<!--second tab-->
									<div class="tab-pane" id="profile" role="tabpanel">
										<div class="card-block"></div>
									</div>
									<!-- third tab -->
									<div class="tab-pane" id="settings" role="tabpanel">
										<div class="card-block"></div>
									</div>
								</div>
							</div>
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