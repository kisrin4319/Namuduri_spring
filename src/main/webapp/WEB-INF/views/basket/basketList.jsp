<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shopping Cart || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Add your site or application content here -->
	<h2 style="text-align: -webkit-center; padding-top: 30px;">SHOPPING CART</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
		</li>
		<li>
			<a title="Go to Wishlist" href="<%=cp%>/wish/wishList.do" style="font-style: oblique;">Wishlist</a>
		</li>
	</ul>
	<!-- Cart Area Start -->
	<div class="shopping-cart-area section-padding" style="padding-top: 20px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="wishlist-table-area table-responsive">
						<form name="basketform" id="basketform">
							<table>
								<thead>
									<tr>
										<th class="product-edit">
											<div class="checkbox checkbox-primary">
												<input type="checkbox" id="checkbox2" name="AllCheck" onchange="fn_checkSum()" />
												<label for="checkbox2"> All Check </label>
											</div>
										</th>
										<th class="product-image">Image</th>
										<th class="t-product-name">Product Name</th>
										<th class="product-unit-price">Unit Price</th>
										<th class="product-edit">Category</th>
										<th class="product-quantity">Quantity</th>
										<th class="product-subtotal">Subtotal</th>
										<th class="product-edit">Buy Now</th>
										<th class="product-remove">Remove</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${basketList.size() ne 0 }">
										<c:forEach var="row" items="${basketList }" varStatus="i">
											<input type="hidden" id="basket_num" name="basket_num" value="${row.basket_num }" />
											<input type="hidden" id="basket_book_num" name="basket_book_num" value="${row.basket_book_num}" />
											<input type ="hidden" id="c_code" name="c_code" value="" />
											<tr>
												<td class="product-edit">
													<div class="checkbox checkbox-primary">
														<p>
															<input type="checkbox" name="RowCheck" value="${row.basket_num }" id="${row.basket_book_price*row.basket_book_count }" onchange="fn_checkSum()" />
															<label for="checkbox"></label>
														</p>
													</div>
												</td>
												<td class="product-image">
													<a href="javascript:;" onclick="fn_bookDetail(${row.basket_book_num})">
														<img src="<%=cp %>/upload/${row.basket_book_image }" alt="" width="104px" height="104px">
													</a>
												</td>
												<td class="t-product-name">
													<h3>
														<a href="javascript:;" onclick="fn_bookDetail(${row.basket_book_num})">${row.basket_book_name }</a>
													</h3>
												</td>
												<td class="product-unit-price">
													<p>
														<fmt:formatNumber pattern="###,###,###" value="${row.basket_book_price}" groupingUsed="true" />
														원
													</p>
												</td>
												<td class="product-edit">
													<p>${row.book_category }</p>
												</td>
												<td class="product-quantity product-cart-details">
													<input type="text" name="book_count" maxlength="2" id="${row.basket_num }" value="${row.basket_book_count}" size="1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode: disabled; ' />
													<button type="button" class="btn-info" onclick="fn_basketModify(${row.basket_num})" style="background-color:#32b5f3;">
														<em>EDIT</em>
													</button>
												</td>
												<td class="product-quantity">
													<p>
														<fmt:formatNumber pattern="###,###,###" value="${row.basket_book_price*row.basket_book_count}" groupingUsed="true" />
														원
													</p>
												</td>
												<td class="product-edit">
													<p>
														<a href="javascript:;" onclick="singleOrder(${row.basket_book_num}, ${row.basket_book_count}, ${row.basket_num})" class="right-shoping-cart">BUY NOW</a>
													</p>
												</td>
												<td class="product-remove">
													<a href="javascript:;" onclick="fn_basketDelete(${row.basket_num})">
														<i class="flaticon-delete"></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
								<c:if test="${basketList.size() eq 0 }">
									<strong>
										<font size="3">장바구니에 담겨있는 상품이 없습니다.</font>
									</strong>
								</c:if>
							</table>
						</form>
					</div>
					<div class="shopingcart-bottom-area">
						<a class="left-shoping-cart" href="javascript:;">CONTINUE SHOPPING</a>
						<div class="shopingcart-bottom-area pull-right">
							<a class="right-shoping-cart" href="javascript:;" id="deleteAll">CLEAR SHOPPING CART</a>
							<a class="right-shoping-cart" href="javascript:;" onclick="fn_selectDelete()">CLEAR SELECTED SHOPPING CART</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart Area End -->
	<!-- Discount Area Start -->
	<div class="discount-area">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="discount-main-area">
						<div class="discount-top">
							<h3>DISCOUNT CODE</h3>
							<p>Enter your coupon code if have one</p>
						</div>
						<div class="discount-middle">
							<input type="text" placeholder="" id="coupon_code" name="coupon_code">
							<a class="" href="javscript:;" onclick="couponCheck(); this.onclick='';">APPLY COUPON</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="subtotal-main-area">
						<div class="subtotal-area">
							<h2>
								SUBTOTAL
								<span>
									<input type="text" id="SubTotal" value="0" style="border: 0; font-size: x-large; text-align: center; vertical-align: baseline; font-weight: unset;" size="6" readOnly />
									원
								</span>
							</h2>
						</div>
						<div class="subtotal-area">
							<input type="hidden" id="fee" value="0" size="4" />
							<h2>
								GRAND TOTAL
								<span>
									<input type="text" id="sum" value="0" style="border: 0; font-size: x-large; text-align: center; vertical-align: baseline; font-weight: unset;" size="6" readOnly />
									원
								</span>
							</h2>
						</div>
						<c:if test="${basketList.size() ne 0 }">
							<a href="javascript:;" onclick="fn_selectOrder()">SELECTED CHECKOUT</a>
							<a href="javascript:;" onclick="fn_totalOrder()">CHECKOUT</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Discount Area End -->
	<script src="<%=cp%>/bootstrap/js/custom.js"></script>
	<script type="text/javascript">
	function couponCheck() {
    
	  var inputed = $("#coupon_code").val();
	  c_code.value = inputed;
	  $.ajax({
	    data : {
	      coupon_code : inputed
	    },
	    url : "<%=cp%>/coupon/couponCheck.do",
	    success : function(data){
	      if(data != "0"){
	        couponUse();
	      }
	    }
	  });
  }
	function couponUse() {
    	var inputed = $("#coupon_code").val();
    	$.ajax({
    	  data :{
    	    coupon_code : inputed
    	  },
    	  url : "<%=cp%>/coupon/couponUse.do",
    	  success : function(data) {
          if(sum.value-data < 0){
            alert("할인 쿠폰을 적용할수 없습니다.");
          } else{
            var x = sum.value.replace(/,/g,'');
            
            sum.value = parseInt(x)-data;
            fn_format(sum);
          }
        }
    	});
  }
	</script>
</body>
</html>