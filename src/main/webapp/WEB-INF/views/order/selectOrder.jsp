<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Checkout || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">ORDER</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
		</li>
		<li>
			<a href="<%=cp%>/books/booksList.do" style="font-style: oblique;">SHOP</a>
		</li>
	</ul>
	<hr>
	<!-- Check Out Area Start -->
	<div class="check-out-area section-padding">
		<div class="container">
			<div class="row">
				<form name="orderform" id="orderform" method="post">
					<input type="hidden" name="order_receive_moneysum" value="${sumMoney}" />
					<input type="hidden" name="bookMoney" value="${bookMoney}" />
					<input type="hidden" name="c_code" value="${coupon_code }" />
					<div class="col-md-8">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											<span>1</span>
											Checkout Method
										</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-6 col-sm-6">
												<div class="checkout-collapse-inner">
													<h2 class="collapse-title">CHECKOUT AS A GUEST OR REGISTER</h2>
													<h4 class="collapse-sub-title">Register with us for future convenience:</h4>
													<input type="hidden" name="order_receive_moneysum" value="${sumMoney}" />
													<div class="check-register">
														<input type="radio" name="choice" onclick="deldata();" />
														<label>Direct input</label>
													</div>
													<div class="check-register">
														<input type="radio" name="choice" onclick="senddata();" />
														<label>Same As Member</label>
													</div>
													<p>Register and save time!</p>
													<p>Register with us for future convenience:</p>
													<p>Fast and easy check out</p>
													<p>Easy access to your order history and status</p>
													<button class="btn btn-default btn-checkout" data-toggle="collapse" href="#collapseTwo" data-parent="#accordion" aria-expanded="false">CONTINUE</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
											<span>2</span>
											Billing Information
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-12">
												<div class="shop-select">
													<label>
														Country
														<span class="required">*</span>
													</label>
													<select>
														<option value="volvo">SOUTH KOREA</option>
														<option value="saab">Algeria</option>
														<option value="mercedes">Afghanistan</option>
														<option value="audi">Ghana</option>
														<option value="audi2">Albania</option>
														<option value="audi3">Bahrain</option>
														<option value="audi4">Colombia</option>
														<option value="audi5">Dominican Republic</option>
													</select>
												</div>
											</div>
											<div class="col-md-6">
												<p class="form-row">
													<input type="text" name="order_receive_name" value="" placeholder="First Name *">
												</p>
											</div>
											<div class="col-md-12">
												<p class="form-row">
													<input type="text" name="order_receive_addr1" value="" placeholder="Street address">
												</p>
											</div>
											<div class="col-md-12">
												<p class="form-row">
													<input type="text" name="order_receive_addr2" value="" placeholder="Town / City">
												</p>
											</div>
											<div class="col-md-6">
												<p class="form-row">
													<input type="text" name="order_receive_zipcode" value="" placeholder="Postcode / Zip">
												</p>
											</div>
											<div class="col-md-6">
												<p class="form-row">
													<input type="text" name="order_email" value="" placeholder="Email Address *">
												</p>
											</div>
											<div class="col-md-6">
												<p class="form-row">
													<input type="text" id="order_receive_phone" name="order_receive_phone" placeholder="Phone *">
												</p>
											</div>
											<div class="col-md-12">
												<div id="cbox_info">
													<p class="form-row form-row-phone">
														<label>
															Mobile
															<span class="required">*</span>
														</label>
														<input type="text" id="order_receive_mobile" name="order_receive_mobile" value="" placeholder="Mobile *">
													</p>
												</div>
											</div>
										</div>
										<button class="btn btn-default btn-checkout" data-toggle="collapse" href="#collapseThree" data-parent="#accordion" aria-expanded="false" style="margin-top: 15px;">CONTINUE</button>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
											<span>3</span>
											Shopping Method
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">
										<div class="different-address">
											<div class="order-notes">
												<label>Order Notes</label>
												<textarea placeholder="Notes about your order, e.g. special notes for delivery." rows="10" cols="30" name="order_receive_memo"></textarea>
											</div>
										</div>
										<button class="btn btn-default btn-checkout" data-toggle="collapse" href="#collapseFour" data-parent="#accordion" aria-expanded="false" style="margin-top: 5px;">CONTINUE</button>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingFour">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
											<span>4</span>
											Order Review
										</a>
									</h4>
								</div>
								<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
									<div class="panel-body no-padding">
										<div class="order-review" id="checkout-review">
											<div class="table-responsive" id="checkout-review-table-wrapper">
												<table class="data-table" id="checkout-review-table">
													<thead>
														<tr>
															<th colspan="1" style="width: 20%;">Image</th>
															<th rowspan="2">Product Name</th>
															<th colspan="1">Price</th>
															<th rowspan="1">Qty</th>
															<th colspan="1">Subtotal</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="check" items="${selectList}">
															<tr>
																<input type="hidden" name="basket_num" value="${check.basket_num}" />
																<td style="text-align: center;">
																	<span class="cart-price">
																		<span class="check-price">
																			<img src="<%=cp%>/upload/${check.basket_book_image}" width="40" alt="${check.basket_book_name}" title="${check.basket_book_name}" />
																		</span>
																	</span>
																</td>
																<td>
																	<h3 class="product-name">${check.basket_book_name}</h3>
																</td>
																<td>
																	<span class="cart-price">
																		<span class="check-price">
																			<fmt:formatNumber value="${check.basket_book_price}" pattern="###,###,###" />
																			원
																		</span>
																	</span>
																</td>
																<td>${check.basket_book_count}</td>
																<!-- sub total starts here -->
																<td>
																	<span class="cart-price">
																		<span class="check-price">
																			<fmt:formatNumber value="${check.basket_book_price * check.basket_book_count}" pattern="###,###,###" />
																			원
																		</span>
																	</span>
																</td>
															</tr>
														</c:forEach>
													</tbody>
													<tfoot>
														<tr>
															<td colspan="4">Subtotal</td>
															<td>
																<span class="check-price">
																	<fmt:formatNumber value="${bookMoney}" pattern="###,###,###" />
																	원
																</span>
															</td>
														</tr>
														<tr>
															<td colspan="4">Fee</td>
															<td>
																<span class="check-price">
																	<fmt:formatNumber value="${deliveryFee}" pattern="#,###" />
																	원
																</span>
															</td>
														</tr>
														<tr>
															<td colspan="4">
																Point(
																<fmt:formatNumber pattern="#,###" value="${memberModel.member_point}" />
																P)
															</td>
															<td>
																<span class="check-price">
																	-
																	<input type="text" size="1" name="point" id="point" value="0" style="text-align: end;">
																	<input type="button" value="USE" onclick="usePoint();">
																</span>
															</td>
														</tr>
														<tr>
															<td colspan="4">
																<strong>Grand Total</strong>
															</td>
															<td>
																<strong>
																	<span class="check-price">
																		<input type="hidden" name="grandTotal" id="grandTotal" size="3" value="${sumMoney}">
																		<input type="text" name="tempTotal" id="tempTotal" size="3" value="${sumMoney}" style="text-align: end;" readonly>
																		원
																	</span>
																</strong>
															</td>
														</tr>
													</tfoot>
												</table>
											</div>
											<div id="checkout-review-submit">
												<div class="cart-btn-3" id="review-buttons-container">
													<p class="left">
														Forgot an Item?
														<a href="#">Edit Your Cart</a>
													</p>
													<button type="button" title="Place Order" class="btn btn-default" onclick="checkIt()">
														<span>Place Order</span>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div class="col-md-offset-1 col-md-3">
					<div class="checkout-widget">
						<h2 class="widget-title">YOUR CHECKOUT PROGRESS</h2>
						<ul>
							<li>
								<a href="#">
									<i class="fa fa-minus"></i>
									Billing Address
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-minus"></i>
									Shipping Address
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-minus"></i>
									Shipping Method
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-minus"></i>
									Payment Method
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Check Out Area End -->
	<script type="text/javascript">

var name = "${memberModel.member_name}";
var zipcode ="${memberModel.member_zipcode}";
var addr1 = "${memberModel.member_addr1}";
var addr2 = "${memberModel.member_addr2}";
var phone = "${memberModel.member_phone}";
var mobile = "${memberModel.member_mobile}";

   function checkIt() {
   var orderform = document.getElementById("orderform");
      if (!orderform.order_receive_name.value) {
         alert("수취인 이름을 입력하세요");
         orderform.order_receive_name.focus();
         return false;
      } else if (!orderform.order_receive_phone.value) {
         alert("수취인 전화번호를 입력하세요");
         orderform.order_receive_phone.focus();
         return false;
      } else if (!orderform.order_receive_zipcode.value) {
         alert("수취인 우편번호를 입력하세요");
         orderform.order_receive_zipcode.focus();
         return false;
      } else if (!orderform.order_receive_addr1.value) {
         alert("수취인 주소를 입력하세요");
         orderform.order_receive_addr1.focus();
         return false;
      } else if (!orderform.order_receive_addr2.value) {
         alert("수취인 상세주소를 입력하세요");
         orderform.order_receive_addr2.focus();
         return false;
      } else {
        	proc();
      }
   }
   function senddata() {
      var orderform = document.getElementById("orderform");
      
      orderform.order_receive_name.value = "${memberModel.member_name}";
      orderform.order_receive_zipcode.value = "${memberModel.member_zipcode}";
      orderform.order_receive_addr1.value = "${memberModel.member_addr1}";
      orderform.order_receive_addr2.value = "${memberModel.member_addr2}";
      orderform.order_receive_phone.value = "${memberModel.member_phone}";
      orderform.order_receive_mobile.value = "${memberModel.member_mobile}";
      orderform.order_email.value="${memberModel.member_email }";
   }

   function deldata() {
      var orderform = document.getElementById("orderform");
      
      orderform.order_receive_name.value = "";
      orderform.order_receive_zipcode.value = "";
      orderform.order_receive_addr1.value = "";
      orderform.order_receive_addr2.value = "";
      orderform.order_receive_phone.value = "";
      orderform.order_receive_mobile.value = "";
      orderform.order_email.value="";
   }

   function orderzipCheck() {
      var url = '<%=cp%>/order/zipCheck.do';
      window.open(url, "post", "toolbar=no,width=605,height=247,directoris=no,status=yes,scrollbars=yes,menubar=no");
    }

	function usePoint() {
		  var use = confirm("포인트를 사용하시겠습니까?")
		  var point = document.getElementById("point").value;
		  var grandtotal = document.getElementById("grandTotal").value;
		  var temptotal = document.getElementById("tempTotal").value;
		  if(use==true) {
			tempTotal.value = grandtotal-point;
			fn_format(tempTotal)
			} else {
			  return false;
			  }
		  }

    function fn_format(obj) {
      var x = obj.value.replace(/[^0-9]/g, '');
      obj.value = x.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

    function proc() {
      var orderform = document.getElementById("orderform");
      var IMP = window.IMP; // 생략가능
      IMP.init('imp19784906'); // 가맹점 식별 코드
      IMP.request_pay({
      pg : 'kakao', // 결제방식
      pay_method : 'card', // 결제 수단
      merchant_uid : 'merchant_' + new Date().getTime(),
      name : '주문명: 결제 테스트', // order 테이블에 들어갈 주문명 혹은 주문 번호
      amount : '${sumMoney}', // 결제 금액
      buyer_email : '${memberModel.member_email}', // 구매자 email
      buyer_name : '${memberModel.member_name}', // 구매자 이름
      buyer_tel : '${memberModel.member_mobile}', // 구매자 전화번호
      buyer_addr : '${memberModel.member_addr1}' + '${memberModel.member_addr2}', // 구매자 주소
      buyer_postcode : '${memberModel.member_zipcode}', // 구매자 우편번호
      }, function(rsp) {
        if (rsp.success) { // 성공시
          var msg = '결제가 완료되었습니다.';
          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.amount;
          msg += '카드 승인번호 : ' + 123123123;

        } else { // 실패시
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
          orderform.action = "<%=cp%>/order/selectOrder.do";
          orderform.submit();
        }
      });       
    }
	</script>
</body>
</html>