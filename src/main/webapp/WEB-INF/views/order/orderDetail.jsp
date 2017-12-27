<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ORDER DETAIL</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
a.list-group-item {
	height: auto;
	min-height: 220px;
}

.control-label {
	padding-left: 0px;
	padding-right: 0px;
}

label[for=f_name] {
	margin-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
}

div.col-xs-8 {
	padding-right: 0px;
}
</style>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">ORDER DETAIL</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
		</li>
		<li>
			<a title="Go to MY PAGE" href="<%=cp%>/mypage.do">MY PAGE</a>
		</li>
	</ul>
	<div class="shopping-area section-padding">
		<div class="container center-block">
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
			<h3 style="margin-left: 15px;">주문자 정보</h3>
			<div class="col-md-9 col-sm-9 col-xs-12 center-block" style="border-width: 1px;border-style: solid;border-color: rgb(221, 221, 221); border-image: initial; ">
				<div class="form-group">
					
					<label class="col-sm-2 col-md-2 col-xs-6" for="f_name" style="margin-bottom: 0px;"> ID : </label>
					<div class="col-sm-2 col-md-2 col-xs-6">${memberInfo.member_id }</div>
					<label class="col-sm-2 col-md-2 col-xs-6" for="f_name" style="margin-bottom: 0px;"> 핸드폰 : </label>
					<div class="col-sm-2 col-md-2 col-xs-6">${memberInfo.member_mobile }</div>
					<label class="col-sm-2 col-md-2 col-xs-6" for="f_name" style="margin-bottom: 0px;"> 전화번호 : </label>
					<div class="col-sm-2 col-md-2 col-xs-6">${memberInfo.member_phone }</div>
				</div>
			</div>
			<div class="col-md-9 col-sm-9 col-xs-12 center-block" style="margin-bottom: 5px;"> 
				<c:forEach var="item" items="${ memberOrderDetail }">
					<div class="list-group"">
						<a href="#" class="list-group-item">
							<div class="media col-sm-3 col-md-3 hidden-xs">
								<figure class="pull-left">
									<img src="<%=cp%>/upload/${ item.BOOK_IMAGE }" style="height: 200px;" />
								</figure>
							</div>
							<div class="col-sm-9 col-md-9 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
								<div class="form-group">
									<label class="col-sm-3 col-md-2 col-xs-4 control-label" for="f_name" style="top: 5px;"> 주문 번호 : </label>
									<div class="col-sm-9 col-md-10 col-xs-8">
										<input type="text" class="form-control" value="${ item.ORDER_TRADE_NUM }" style="border-style: none;" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-md-2 col-xs-4 control-label" for="f_name" style="top: 5px;"> 도서명 : </label>
									<div class="col-sm-9 col-md-10 col-xs-8">
										<input type="text" class="form-control" value="${ item.ORDER_BOOK_NAME }" style="border-style: none;" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-md-2 col-xs-4 control-label" for="f_name" style="top: 5px;"> 주문 수량 : </label>
									<div class="col-sm-9 col-md-10 col-xs-8">
										<input type="text" class="form-control" value="${ item.ORDER_BOOK_COUNT }권" style="border-style: none;" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-md-2 col-xs-4 control-label" for="f_name" style="top: 5px;"> 가격 : </label>
									<div class="col-sm-9 col-md-10 col-xs-8">
										<input type="text" class="form-control" value="${ item.ORDER_BOOK_COUNT * item.ORDER_BOOK_PRICE }원" style="border-style: none;" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-md-2 col-xs-4 control-label" for="f_name" style="top: 5px;"> 주문 상태 : </label>
									<div class="col-sm-9 col-md-10 col-xs-8">
										<c:if test="${ item.ORDER_TRANS_STATUS == 'ST01' }">
											<input type="text" class="form-control" value="배송 준비 중" style="border-style: none;" />
										</c:if>
										<c:if test="${ item.ORDER_TRANS_STATUS == 'ST02' }">
											<input type="text" class="form-control" value="배송 중" style="border-style: none;" />
										</c:if>
										<c:if test="${ item.ORDER_TRANS_STATUS == 'ST03' }">
											<input type="text" class="form-control" value="배송 완료" style="border-style: none;" />
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-md-2 col-xs-4 control-label" for="f_name" style="top: 5px; border-style: none;"> 주문 날짜 : </label>
									<div class="col-sm-9 col-md-10 col-xs-8">
										<input type="text" class="form-control" value="<fmt:formatDate value="${ item.ORDER_REGDATE }" pattern="yyyy-MM-dd" />" style="border-style: none;" />
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				<h3>수취인 정보</h3>
				<div class="col-md-9 col-sm-9 col-xs-12 center-block" style="margin-top: 5px; padding-left: 0px; border-width: 1px;border-style: solid;border-color: rgb(221, 221, 221); border-image: initial; float: initial; width: -webkit-fill-available; text-align: -webkit-center;">
					<div class="form-group">
						<label class="col-sm-2 col-md-2 col-xs-6" for="f_name"> 받으실 분 : </label>
						<div class="col-sm-2 col-md-2">${orderModel.order_receive_name }</div>
						<label class="col-sm-2 col-md-2 col-xs-6" for="f_name" style="padding-right: 0px; padding-left: 0px;"> 휴대폰번호 : </label>
						<div class="col-sm-2 col-md-2">${orderModel.order_receive_phone }</div>
						<label class="col-sm-2 col-md-2 col-xs-6" for="f_name"> 전화번호 : </label>
						<div class="col-sm-2 col-md-2">${orderModel.order_receive_mobile }</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12 center-block" style="padding-left: 0px; padding-right: 0px; border-width: 1px;border-style: solid;border-color: rgb(221, 221, 221); border-image: initial; text-align: -webkit-center; width: -webkit-fill-available;">
					<div class="form-group">
						<label class="col-sm-2 col-md-2 col-xs-12" for="f_name"> 주 소 : </label>
						<div class="col-sm-5 col-md-5 col-xs-12" style="padding-left: 0px; padding-right: 0px;">${orderModel.order_receive_addr1 }</div>
						<div class="col-sm-5 col-md-5 col-xs-12" style="padding-left: 0px; padding-right: 0px;">${orderModel.order_receive_addr2 }</div>
					</div>
				</div>
			</div>
			<div class="center-block">
				<button name="submitcreate" id="submitcreate" class="btn-default" onclick="javascript:location.href='http://localhost:8080/namuduri/order/orderListCheckView.do'" style="float: right;">
					<span>
						<i class="fa fa-user left"></i>
						CLOSE
					</span>
				</button>
			</div>
		</div>
	</div>
</body>
</html>