<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.HashMap" %>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MY PAGE</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link href ="<%=cp%>/css/default_ink_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/layout_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/myroom.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/order_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/style_ssl.css" rel="stylesheet" type="text/css" />
<link href ="<%=cp%>/css/style2_ssl.css" rel="stylesheet" type="text/css" /> --%>
<!-- <style>
.jb-center {
        text-align: center;
      }
</style> -->
</head>
<body>
	
	<h2 style="text-align: -webkit-center; padding-top: 30px;">MY PAGE</h2>
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
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">주문/배송 조회</p>								
											</a>
										</li>
										<li>
											<a href="<%=cp%>/member/memberModifyView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">회원 정보수정</p>
											</a>
										</li>
										<li>
											<a href="<%=cp%>/member/memberDeleteView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">회원 탈퇴</p>
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
									<th><div class="user_name">${ member_id } 님 안녕하세요.</div></th>
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
									<col width="10%"/>
									<col width="15%"/>
									<col width="14%"/>
								</colgroup>
								<tr>
									<th class="first" scope="col"><p class="text-center">주문번호</p></th>
									<th scope="col"><p class="text-center">주문날짜</p></th>
									<th scope="col"><p class="text-center">결제상태</p></th>
									<th scope="col"><p class="text-center">결제방법</p></th>
									<th scope="col"><p class="text-center">배송번호</p></th>
									<th scope="col"><p class="text-center">주문상태</p></th>
								</tr>
							</thead>
							<tbody>
								<c:url var="viewOrderURL" value="orderDetailView.do">
									<c:param name="order_trade_num" value="${order_trade_num}"/>
									<c:param name="curretPage" value="${currentPage}" />
								</c:url>
								
								<c:if test="${ fn:length(orderModel) != '0' }">
								<c:forEach var="item" items="${ orderModel }">
								<tr>
									<td height="50" align="center">
										<a href ="${viewOrderURL}">${ item.order_trade_num }</a>	
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
									<td align="center">
										<c:if test="${ order_trade_status =='TR01' }">
											무통장 입금
										</c:if>
										<c:catch>
											카드 결제
										</c:catch>${ order_trade_status }
									</td>
									<td align="center">${item.order_trans_num}</td>
									
									<td align="center">
										<c:if test="${ item.order_trans_status == 'ST01' }">
											배송 준비중
										</c:if>
										<c:if test="${ order_trans_status == 'ST02' }">
											배송 중
										</c:if>
										<c:if test="${ order_trans_status == 'ST03' }">
											배송 완료
										</c:if>
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
							<td colspan="8">${ pagingHtml }</td>
						</tr>
						
						</table>
						</div>
					</div>
				
				</div>
				<%-- <div class="row">
				<div class="col-xs-12">
					<div class="jb-center">
			            <ul class="pagination">
			              	${ pagingHtml }
			            </ul>
			        </div>
		        </div>
		        </div> --%>
			</div>
		</div>
			
</body>
<%-- <body>		
	<div class="content_middle" style="width:800px;margin-right:100px;"> 
	<div id="myroom_contents">
		<!-- 고객 공통 컨텐츠 -->
		<div class="out_myroom_gradearea">
			<div class="user_section">
				<div class="user_name"><p>${member_id}</p> 님 안녕하세요.</div>
			</div>
			<font size ="2" style ="text-align: center">mypage</font>
		</div>
		<!--// 고객 공통 컨텐츠 -->
		<h2 class="bul_green20">
			<span>주문/배송조회</span>
		</h2>
		
		<form name="orderListCheckForm" id="orderListCheckForm" method="post">
			<!-- 주문내역시작 -->
			<input type="hidden" id="order_trade_num" name="order_trade_num" />
				<table class="table_myroom td_font_12 margin_top10"	summary="주문번호, 주문금액, 상품정보, 주문상태를 알 수 있는 주문 내역 테이블 입니다.">
					<caption>주문 내역</caption>
						<colgroup>
							<col width="14%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="15%" />
							<col width="14%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="first" scope="col">주문번호</th>
								<th scope="col">주문날짜</th>
								<th scope="col">결제상태</th>
								<th scope="col">결제방법</th>
								<th scope="col">배송번호</th>
								<th scope="col">주문상태</th>
							</tr>
						<!-- <s:iterator value="orderlist" status="stat"> -->
							<!-- 주무번호와 연결되는 URL -->
							<c:url var="viewOrderURL" value="orderDetailView.do">
								<c:param name="order_trade_num" value="${order_trade_num}"/>
								<c:param name="curretPage" value="${currentPage}" />
							</c:url>
							
							<c:forEach var="item" items="${ orderModel }">
							<tr>
								<td height="50" align="center">
									<a href ="${viewOrderURL}">${ item.order_trade_num }</a>	
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
								<td align="center">
									<c:if test="${ order_trade_status =='TR01' }">
										무통장 입금
									</c:if>
									<c:catch>
										카드 결제
									</c:catch>${ order_trade_status }
								</td>
								<td align="center">${item.order_trans_num}</td>
								
								<td align="center">
									<c:if test="${ item.order_trans_status == 'ST01' }">
										배송 준비중
									</c:if>
									<c:if test="${ order_trans_status == 'ST02' }">
										배송 중
									</c:if>
									<c:if test="${ order_trans_status == 'ST03' }">
										배송 완료
									</c:if>
								</td>
								</tr>
							</c:forEach>
						<!-- </s:iterator> -->
						<c:if test="list.size()==0">
							<tr align="center">
								<td colspan="8">주문 내역이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
					<tr align="center">
						<td colspan="8" value="pagingHtml" escape="false"></td>
					</tr>
			</table>
			<!-- 주문내역종료 -->
		</form>

		<h2 class="bul_green20 margin_top30">
			<span>주문/배송안내</span>
		</h2>
		<img align="middle" src="<%=cp%>/mypage/image/mypage.JPG" />
		</div>
	</div>	
</body> --%>
</html>