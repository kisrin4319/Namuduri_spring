<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 정보 조회</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Order List</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item active">Order List</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

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
					</select> <select class="custom-select filter-operator" name="filter[op][0]">
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
			<!-- 체크박스로 조건별 검색 기능 추가 -->
			<!-- 기간별 조회 기능도 추가 -->
			<!-- <div class="searcharea">
			<form>
				<div class="search_input">
					<select name="searchNum" class="searchNum">
						<option value="0">주문번호</option>
						<option value="1">배송번호</option>
						<option value="2">주문자 ID</option>
						<option value="3">결제인</option>
						<option value="4">수취인</option>
						<option value="5">전화번호</option>
					</select> <input class="searchKeyword" type="text" name="searchKeyword">
					<input class="searchbutton" name="submit" type="submit" value="검색">
				</div>
			</form>
		</div> -->
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs profile-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#home" role="tab">전체</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#profile" role="tab">결제중</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#settings" role="tab">배송중</a></li>
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

													<th>주문자 ID</th>
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
													<td><input class="form-control" type="text"
														name="member_join" value="" /></td>
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
													<td class="actions" style="vertical-align: middle;">
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
																<td>${list.member_id}</td>
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
									</form>
									<table class="paging">
										<tr align=center>
											<td colspan=8>${pagingHtml}</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- second tab -->
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
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>