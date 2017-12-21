<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
</head>

<body>
	<aside class="left-sidebar">
		<!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
				<ul id="sidebarnav">
					<li>
						<a class="waves-effect waves-dark" href="<%=cp%>/admin/main.do" aria-expanded="false">
						 <i class="mdi mdi-gauge"></i> <span class="hide-menu">Dashboard</span></a>
					</li>
					<!-- <li class="nav-devider"></li> -->
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-human-greeting"></i> <span class="hide-menu">회원 관리</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="<%=cp%>/admin/memberList/all.do" aria-expanded="false">
								 <i class="mdi mdi-account-check"></i> <span class="nav-dropdown-item">회원 통합 리스트</span></a>
							</li>
							<li>
								<a href="<%=cp%>/admin/memberList/rank.do" aria-expanded="false">
								 <i class="mdi mdi-account-star-variant"></i> <span class="nav-dropdown-item">회원 등급 관리</span></a>
							</li>
							<li>
								<a href="<%=cp%>/admin/memberList/Bck.do" aria-expanded="false">
								 <i class="mdi mdi-account-off"></i> <span class="nav-dropdown-item">차단 회원 관리</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-book-open-page-variant"></i> <span class="hide-menu">도서 관리</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-bookmark-check"></i> <span class="nav-dropdown-item">카테고리 관리</span></a>
							</li>
							<li>
								<a href="<%=cp%>/admin/bookWrite.do" aria-expanded="false">
								 <i class="mdi mdi-book-plus"></i> <span class="nav-dropdown-item">도서 등록</span></a>
							</li>
							<li>
								<a href="<%=cp%>/admin/bookList.do" aria-expanded="false">
								 <i class="mdi mdi-book-multiple"></i> <span class="nav-dropdown-item">도서 통합 리스트</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-book"></i> <span class="nav-dropdown-item">사용 도서 관리</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-book-minus"></i> <span class="nav-dropdown-item">비사용 도서 관리</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-cart"></i> <span class="hide-menu">주문 관리</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="<%=cp%>/admin/orderList.do" aria-expanded="false">
								 <i class="mdi mdi-credit-card-multiple"></i> <span class="nav-dropdown-item">주문 통합 리스트</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-credit-card"></i> <span class="nav-dropdown-item">결제 상태 관리</span></a>
							</li>
							<li>
								<a href="map-google.html" aria-expanded="false">
								 <i class="mdi mdi-truck-delivery"></i> <span class="nav-dropdown-item">배송 상태 관리</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-credit-card-off"></i> <span class="nav-dropdown-item">주문 취소 내역</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-coin"></i> <span class="nav-dropdown-item">환불 상태 관리</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-table"></i> <span class="hide-menu">재고 관리</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-table-column-plus-after"></i> <span class="nav-dropdown-item">현재 재고 조회</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-table-column-remove"></i> <span class="nav-dropdown-item">품절 상품 관리</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-emoticon"></i> <span class="hide-menu">고객센터</span></a>
						<ul class="nav-dropdown-items">
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-information-outline"></i> <span class="nav-dropdown-item">공지사항 관리</span></a>
							</li>
							<li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-help-circle-outline"></i> <span class="nav-dropdown-item">문의 답변 관리</span></a>
							</li>
						</ul>
					</li>
					<li>
						<a class="waves-effect waves-dark" href="#" aria-expanded="false">
						 <i class="mdi mdi-chart-bar"></i> <span class="hide-menu">통계</span></a>
						<ul class="nav-dropdown-items">
							<!-- <li>
								<a href="#" aria-expanded="false">
								 <i class="mdi mdi-access-point-network"></i> <span class="nav-dropdown-item">방문자 통계</span></a>
							</li> -->
							<li>
								<a href="<%=cp%>/admin/chart/member.do" aria-expanded="false">
								 <i class="mdi mdi-human-male-female"></i> <span class="nav-dropdown-item">회원 통계</span></a>
							</li>
							<li>
								<a href="<%=cp%>/admin/chart/book.do" aria-expanded="false">
								 <i class="mdi mdi-library-books"></i> <span class="nav-dropdown-item">상품 통계</span></a>
							</li>
							<li>
								<a href="<%=cp%>/admin/chart/order.do" aria-expanded="false">
								 <i class="mdi mdi-credit-card-plus"></i> <span class="nav-dropdown-item">주문 통계</span></a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll-->
		<!-- Bottom points-->
		<div class="sidebar-footer">
			<!-- item-->
			<a href="" class="link" data-toggle="tooltip" title="Settings"><i
				class="ti-settings"></i></a>
			<!-- item-->
			<a href="" class="link" data-toggle="tooltip" title="Email"><i
				class="mdi mdi-gmail"></i></a>
			<!-- item-->
			<a href="" class="link" data-toggle="tooltip" title="Logout"><i
				class="mdi mdi-power"></i></a>
		</div>
		<!-- End Bottom points-->
	</aside>
	<!-- ============================================================== -->
	<!-- End Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
</body>

</html>
