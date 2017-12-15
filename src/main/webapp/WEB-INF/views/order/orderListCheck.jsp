<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ORDERLIST</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link href="<%=cp%>/css/default_ink_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/layout_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/myroom.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/order_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style_ssl.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style2_ssl.css" rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript">
	function check(num){
		
		//$('#order_trade_num').val(num);
 
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
	
	/* function orderDetail(order_trade_num){
		$('#current').val(page);
		$('order_trade_num').val(order_trade_num);
		
		var f = $('#orderListCheckForm')
		
		f.action = "/order/memberOrderDetailView.do";
		f.submit();
	} */
</script>
</head>
<body>

	<h2 style="text-align: -webkit-center; padding-top: 30px;">ORDER LIST</h2>
		<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
			<li>
				<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
			</li>
			<li>
				<a title="Go to Books" href="<%=cp%>/books/booksList.do">BOOKS</a>
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
					<div class="col-md-9 col-sm-12 hidden-xs">
						<div class="mainmenu text-center">
						<table class="table">
							<thead>
								<tr>
									<th>주문/배송 내역을 조회 할수 있는 페이지입니다.</th>
								</tr>
							</thead>
						</table>
						<input type="hidden" id="order_trade_num" name="order_trade_num"/>
						<table class="table table-striped">
							<thead>
								<colgroup>
									<col width="14%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="5%"/>
									<col width="15%"/>
									<col width="14%"/>
								</colgroup>
								<tr>
									<th class="first" scope="col"><p class="text-center">주문번호</p></th>
									<th scope="col"><p class="text-center">주문날짜</p></th>
									<th scope="col"><p class="text-center">결제상태</p></th>
									<th scope="col"><p class="text-center">배송번호</p></th>
									<th scope="col"><p class="text-center">배송상태</p></th>
									<th scope="col"><p class="text-center">주문취소</p></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ fn:length(orderModel) != '0' }">
								<c:forEach var="item" items="${ orderModel }">
							<tr>
								<c:url var="viewOrderURL" value="/order/memberOrderDetailView.do">
									<c:param name="order_trade_num" value="${item.order_trade_num}" />
									<c:param name="curretPage" value="${currentPage}" />	
								</c:url>
								<td height="50" align="center" onclick="orderDetail('${item.order_trade_num}')">
									<a href ="${viewOrderURL}" >${ item.order_trade_num }</a>
								</td>
								<td align="center">${ item.order_regdate }</td>
															
								<td align="center">
									<c:if test="${ item.payment_status =='PS01' }">
										결제 대기중
									</c:if>
									<c:if test="${ item.payment_status =='PS02' }">
										결제 완료
									</c:if>
								</td> 
								<td align="center">${item.order_trans_num}</td>
								
								<td align="center">
									<c:if test="${ item.order_trans_status == 'ST01' }">
										배송 준비중
									</c:if>
									<c:if test="${ item.order_trans_status == 'ST02' }">
										배송 중
									</c:if>
									<c:if test="${ item.order_trans_status == 'ST03' }">
										배송 완료
									</c:if>
								</td>
								<td align="center">
									<input type="button" value="주문취소" align="middle" onclick="check(${item.order_trade_num});" />
								</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${ fn:length(orderModel) == '0' }">
							<tr align="center">
								<td colspan="8">주문 내역이 없습니다.</td>
							</tr>
							</c:if>
							</tbody>
							<tr align="center">
								<td colspan="8">${pagingHtml}</td>
							</tr>
						</table>
						<table class="table">
							<thead>
								<tr>
									<th>주문/배송 안내</th>
								</tr>
							</thead>
						</table>
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
				</div>
			</div>
		</div>
	<%-- <div class="content_middle" style="width: 800px; margin-right: 100px;">
		<div id="myroom_contents">
			<!-- 고객 공통 컨텐츠 -->
			<div class="out_myroom_gradearea">
				<div class="user_section">
					<div class="user_name"><p>${memberInfo.member_id}	님 안녕하세요.</p>
						<property value="${session.member_id}" />	님 안녕하세요.
					</div>
				</div>
				<font size="2" style="text-align: center">주문/배송 내역을 조회 할수 있는
					페이지입니다.</font>
			</div>
			<!--// 고객 공통 컨텐츠 -->
			<h2 class="bul_green20">
				<span>주문/배송조회</span>
			</h2>

			<form name="orderListCheckForm" id="orderListCheckForm">
				<!-- 주문내역시작 -->
				
				<input type="hidden" id="order_trade_num" name="order_trade_num" />
				<input type="hidden" id="current" name="current" />
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
							<c:set value="orderlist"></c:set>
						<!-- <iterator value="orderlist" status="stat"> -->
							<!-- 주무번호와 연결되는 URL -->
							
							
							<c:forEach var="item" items="${ orderModel }">
							<tr>
								<c:url var="viewOrderURL" value="/order/memberOrderDetailView.do">
									<c:param name="order_trade_num" value="${item.order_trade_num}" />
									<c:param name="curretPage" value="${currentPage}" />	
								</c:url>
								<td height="50" align="center" onclick="orderDetail('${item.order_trade_num}')">
									<a href ="${viewOrderURL}" >${ item.order_trade_num }</a>
									${ item.order_trade_num }
								</td>
								<td align="center">${ item.order_regdate }</td>
															
								<td align="center">
									<c:if test="${ item.payment_status =='PS01' }">
										결제 대기중
									</c:if>
									<c:if test="${ item.payment_status =='PS02' }">
										결제 완료
									</c:if>
								</td>
								<td align="center">${item.order_trans_num}</td>
								
								<td align="center">
									<c:if test="${ item.order_trans_status == 'ST01' }">
										배송 준비중
									</c:if>
									<c:if test="${ item.order_trans_status == 'ST02' }">
										배송 중
									</c:if>
									<c:if test="${ item.order_trans_status == 'ST03' }">
										배송 완료
									</c:if>
								</td>
								<td align="center">
								<input type="button" value="주문취소하기" align="middle" onclick="check(${item.order_trade_num});" /></td>
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
	</div> --%>
</body>
</html>