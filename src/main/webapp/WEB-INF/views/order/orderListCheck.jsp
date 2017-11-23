<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/default_ink_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/layout_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/myroom.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/order_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style2_ssl.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function check(type, num){
		document.getElementById('order_trade_num').value = num;
		if(type == 'cancel'){
			document.getElementById('orderListCheckForm').action = 'orderCancel.do';
			document.getElementById('orderListCheckForm').submit();
		}
	}
</script>
</head>
<body>

	<div class="content_middle" style="width: 800px; margin-right: 100px;">
		<div id="myroom_contents">
			<!-- 고객 공통 컨텐츠 -->
			<div class="out_myroom_gradearea">
				<div class="user_section">
					<div class="user_name">
						<p>"${session.member_id}"	님 안녕하세요.</p>
						<%-- <property value="${session.member_id}" />	님 안녕하세요. --%>
					</div>
				</div>
				<font size="2" style="text-align: center">주문/배송 내역을 조회 할수 있는
					페이지입니다.</font>
			</div>
			<!--// 고객 공통 컨텐츠 -->
			<h2 class="bul_green20">
				<span>주문/배송조회</span>
			</h2>

			<form name="orderListCheckForm" id="orderListCheckForm" method="post">
				<!-- 주문내역시작 -->
				<input type="hidden" id="order_trade_num" name="order_trade_num" />
				<table class="table_myroom td_font_12 margin_top10"
					summary="주문번호, 주문금액, 상품정보, 주문상태를 알 수 있는 주문 내역 테이블 입니다.">
					<caption>주문 내역</caption>
					<colgroup>
						<col width="14%" />
						<col width="10%" />
						<col width="10%" />
						<col width="5%" />
						<col width="15%" />
						<col width="14%" />
					</colgroup>
					<tbody>
						<tr>
							<th class="first" scope="col">주문번호</th>
							<th scope="col">주문날짜</th>
							<th scope="col">결제상태</th>
							<th scope="col">배송번호</th>
							<th scope="col">배송상태</th>
							<th scope="col">주문취소</th>
						</tr>
							<%-- <c:set value="orderlist"></c:set> --%>
						<!-- <iterator value="orderlist" status="stat"> -->
							<!-- 주무번호와 연결되는 URL -->
							<c:url var="viewOrderURL" value="orderDetailView">
								<c:param name="order_trade_num" value="${order_trade_num}" />
								<c:param name="curretPage" value="${currentPage}" />	
							</c:url>
							
							<c:forEach var="item" items="${ orderModel }">
							<tr>
								<td height="50" align="center">
									<a href ="${viewOrderURL}" value ="${order_trade_num}"></a>
								${ item.order_trade_num }
								</td>
								<td align="center" value="${order_regdate}"></td>								<td align="center">
									<c:if test="payment_status =='PS01'">
										결제 대기중
									</c:if>
									<c:catch>
										결제 완료
									</c:catch>
								</td>
								<td align="center" value="${order_trans_num}"></td>
								<td align="center">
									<c:if test="order_trans_status == 'ST01'">
										배송 준비중
									</c:if>
									<c:if test="order_trans_status == 'ST02'">
										배송 중
									</c:if>
									<c:if test="order_trans_status == 'ST03'">
										배송 완료
									</c:if></td>
								<td align="center">
								<input type="button" value="주문취소하기" align="middle"onclick="check('cancel', 'value = "${order_trade_num}"')" /></td>
							</tr>
							</c:forEach>
							
						<!-- </iterator> -->
						<c:if test="list.size()==0">
							<tr align="center">
								<td colspan="8">주문 내역이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
					<tr align="center">
						<td colspan="8" ${pagingHtml} escape="false"></td>
					</tr>
				</table>
				<!-- 주문내역종료 -->
			</form>

			<h2 class="bul_green20 margin_top30">
				<span>주문/배송안내</span>
			</h2>
			<div class="myroom_orderguide" id="orderGuideList">
				<div class="detail">
					<img
						src="https://simage.kyobobook.co.kr/ink/images/myroom/img_orderguide_01.gif"
						alt="일반도서 주문/배송 안내" />
					<div class="hide_text">
						<ol>
							<li>주문접수 : 결제전상태입니다. 10일이내 미입금시 주문 자동 취소됩니다.</li>
							<li>결제완료 : 결제가 완료되어 주문처리가 진행됩니다.</li>
							<li>상품준비중 : 상품을 준비중에 있습니다. 상풍준비중에 재고가 부족할 경우 출판사 발주 되거나,
								품절/절판이 발생 할 수 있습니다.</li>
							<li>출고작업중 : 준비된 상품 찾기 및 추가 준비, 포장작업을 진행중에 있습니다.</li>
							<li>발송완료 : 포장된 상품을 교보문고 물류센터에서 택배사로 인계하는 단계입니다.</li>
							<li>배송완료 : 주문하신 상품이 고객님께 전달된 상태입니다.</li>
						</ol>
					</div>
					<!-- .hide_text-->

					<ul class="list_normal">
						<li><span class="font_blue02">주문취소는 주문/배송 조회 목록 및
								주문상세페이지에서 가능하며, 배송지변경 및 교환/반품 신청은 주문상세페이지에서 가능합니다.</span><br /> (상품별
							주문 상태에 따라 주문취소/배송지변경, 교환/반품 신청 버튼이 제공되오니 각 상품별 주문상태를 확인하세요.)<br /></li>
						<li>상품준비중 재고가 부족할 경우 출판사 발주가 진행되며, 품절/절판시엔 메일 및 SMS로 안내 드립니다.</li>
						<li>택배사로 상품 전달 후(교보문고 물류센터에서 택배사로 인계후) 배송조회가 되며, 보통 1~2일 내에
							배송이 완료 됩니다.<br /> (배송방법 및 배송지역에 따라 배송 소요기간이 조금씩 다를 수 있습니다.)
						</li>
						<li>배송완료 후 교환/반품 신청이 가능합니다.</li>
						<li>음반/DVD만 주문은 교보핫트랙스에서 배송되며, 반품/교환은 1:1상담&gt;반품/교환/환불 게시판
							또는 고객센터로 별도 문의 하셔야 합니다.<br /> (단,도서+음반/DVD 주문은 배송완료후 교환/반품 신청
							가능합니다)
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>