<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>WishList || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/venobox/venobox.css" type="text/css" media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/preview.css" type="text/css" media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/checkBox.css">
<!-- modernizr css -->
<script src="<%=cp%>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>
<style type="text/css">
a.list-group-item {
	height: auto;
	min-height: 220px;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-3 col-xs-12">
				<div class="shop-widget">
					<div class="shop-widget-top">
						<aside class="widget widget-categories">
							<h2 class="sidebar-title text-center">CATEGORY</h2>
							<ul class="sidebar-menu">
								<li>
									<a href="<%=cp%>/order/orderListCheckView.do">
										<i class="fa fa-angle-double-right"></i>
										주문/배송 조회
									</a>
								</li>
								<li>
									<a href="<%=cp%>/member/memberModifyView.do">
										<i class="fa fa-angle-double-right"></i>
										회원 정보수정
									</a>
								</li>
								<li>
									<a href="<%=cp%>/member/memberDeleteView.do">
										<i class="fa fa-angle-double-right"></i>
										회원 탈퇴
									</a>
								</li>
								<li>
									<a href="<%=cp%>/eFeelogView.do">
										<i class="fa fa-angle-double-right"></i>
										eFeelog
									</a>
								</li>
							</ul>
						</aside>
					</div>
				</div>
			</div>
			<div class="col-md-9 col-sm-9 col-xs-12">
				<h2 class="text-center">주문 상세 페이지</h2>
				<div class="list-group">
					<c:forEach var="item" items="${ memberOrderDetail }">
						<a href="#" class="list-group-item">
							<div class="media col-md-3">
								<figure class="pull-left">
									<img src="<%=cp%>/upload/${ item.BOOK_IMAGE }" />
								</figure>
							</div>
							<div class="col-md-6">
								<p class="list-group-item-text">
									주문 번호 : ${ item.ORDER_TRADE_NUM }
									<br>
									<br>
									도 서 명 : ${ item.ORDER_BOOK_NAME }
									<br>
									<br>
									주문 상태 :
									<c:if test="${ item.ORDER_TRANS_STATUS == 'ST01' }">
										배송 준비중
										</c:if>
									<c:if test="${ item.ORDER_TRANS_STATUS == 'ST02' }">
										배송 중
										</c:if>
									<c:if test="${ item.ORDER_TRANS_STATUS == 'ST03' }">
										배송 완료
										</c:if>
									<br>
									<br>
									주문 날짜 : ${ item.ORDER_REGDATE } ${ item.ORDER_BOOK_COUNT }권 ${ item.ORDER_BOOK_COUNT * item.ORDER_BOOK_PRICE }원
								</p>
							</div>
							<div class="col-md-3 text-center">
								<h2>
									받으실 분
									<small> ${ item.ORDER_RECEIVE_NAME } </small>
								</h2>
								<p>
									받으실 분 : ${ item.ORDER_RECEIVE_NAME }
									<br />
									휴대폰번호 : ${ item.ORDER_RECEIVE_PHONE }
									<br />
									전화번호 : ${ item.ORDER_RECEIVE_MOBILE }
									<br />
									주 소 : ${ item.ORDER_RECEIVE_ADDR1 }&nbsp;
								</p>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>