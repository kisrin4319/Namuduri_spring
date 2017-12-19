<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ORDERLIST</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	function check(num){ 
			$.ajax({
            	url:'/namuduri/order/memberOrderCancel.do',
            	type:'post',
            	data:{order_trade_num : num},
            	//async:false,
            	success:function(result){
            		if(result == '1'){
            			alert('주문번호' +  num  +  '이 취소되었습니다.');
            			location.reload();
            		}
           	 	}          	 
        	});
		}
</script>
<style type="text/css">
/* generic */
.list ul:nth-child(odd) {
	background-color: #ddd;
}

.list ul:nth-child(even) {
	background-color: #fff;
}

/* big */
@media screen and (min-width:600px) {
	.list {
		display: table;
		margin: 1em;
	}
	.list ul {
		display: table-row;
	}
	.list ul:first-child li {
		background-color: #444;
		color: #fff;
	}
	.list ul>li {
		display: table-cell;
		padding: .5em 1em;
	}
}

/* small */
@media screen and (max-width:599px) {
	.list ul {
		border: solid 1px #ccc;
		display: block;
		list-style: none;
		margin: 1em;
		padding: .5em 1em;
	}
	.list ul:first-child {
		display: none;
	}
	.list ul>li {
		display: block;
		padding: .25em 0;
	}
	.list ul:nth-child(odd)>li+li {
		border-top: solid 1px #ccc;
	}
	.list ul:nth-child(even)>li+li {
		border-top: solid 1px #eee;
	}
	.list ul>li:before {
		color: #000;
		content: attr(data-label);
		display: inline-block;
		font-size: 75%;
		font-weight: bold;
		text-transform: capitalize;
		vertical-align: top;
		width: 50%;
	}
	.list p {
		margin: -1em 0 0 50%;
	}
}

/* tiny */
@media screen and (max-width:349px) {
	.list ul>li:before {
		display: block;
	}
	.list p {
		margin: 0;
	}
}
</style>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">ORDER LIST</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
		</li>
		<li>
			<a title="Go to Books" href="<%=cp%>/mypage.do">MY PAGE</a>
		</li>
	</ul>
	<div class="shopping-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-3 col-xs-12">
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
				<div class="col-md-9 col-sm-9 col-xs-12" style="padding-left: 0px;">
					<p style="padding-left: 15px;">주문/배송 내역을 조회 할수 있는 페이지입니다.</p>
					<div class="list" style="width: 110%;">
						<ul>
							<li>주문 번호</li>
							<li>배송 번호</li>
							<li>배송 상태</li>
							<li>주문 날짜</li>
							<li>결제 상태</li>
							<li>주문 취소</li>
						</ul>
						<c:if test="${ fn:length(orderModel) != '0' }">
							<c:forEach var="item" items="${ orderModel }">
								<c:url var="viewOrderURL" value="/order/memberOrderDetailView.do">
									<c:param name="order_trade_num" value="${item.order_trade_num}" />
									<c:param name="curretPage" value="${currentPage}" />
								</c:url>
								<ul>
									<li data-label="주문 번호" onclick="orderDetail('${item.order_trade_num}')">
										<a href="${viewOrderURL}">${ item.order_trade_num }</a>
									</li>
									<li data-label="배송 번호">${item.order_trans_num}</li>
									<li data-label="배송 상태">
									<c:if test="${ item.order_trans_status == 'ST01' }">
										<span class="label label-primary">배송 준비중</span>										
									</c:if>
										<c:if test="${ item.order_trans_status == 'ST02' }">
										<span class="label label-warning">배송 중</span>
									</c:if>
										<c:if test="${ item.order_trans_status == 'ST03' }">
										<span class="label label-success">배송 완료</span>
									</c:if>
									</li>
									<li data-label="주문 날짜"><fmt:formatDate value="${ item.order_regdate }" pattern="yyyy/MM/dd"/></li>
									<li data-label="결제 상태">
										<c:if test="${ item.payment_status =='PS01' }">
										결제 대기중
									</c:if>
										<c:if test="${ item.payment_status =='PS02' }">
										결제 완료
									</c:if>
									</li>
									<li data-label="주문 취소">
										<p>
											<input type="button" class="btn btn-danger" value="주문취소" onclick="check(${item.order_trade_num});" />
										</p>
									</li>
								</ul>
							</c:forEach>
						</c:if>
						<c:if test="${ fn:length(orderModel) == '0' }">
							<tr align="center">
								<td colspan="8">주문 내역이 없습니다.</td>
							</tr>
						</c:if>
						<div class="paging" style ="text-align: center">
						${pagingHtml}
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>