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
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
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
<!-- modernizr css -->
<script src="<%=cp %>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- Add your site or application content here -->
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>SHOPPING CART</h2>
						<ul class="breadcrumbs-list">
							<li>
								<a title="Return to Home" href="index.html">Home</a>
							</li>
							<li>Shopping Cart</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area Start -->
	<!-- Cart Area Start -->
	<div class="shopping-cart-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="wishlist-table-area table-responsive">
						<table>
							<thead>
								<tr>
									<th class="product-edit">
										<input type="checkbox" id="checkAll" onchange="fn_checkSum()" />
										All Check
									</th>
									<th class="product-image">Image</th>
									<th class="t-product-name">Product Name</th>
									<th class="product-unit-price">Unit Price</th>
									<th class="product-edit">Category</th>
									<th class="product-quantity">Quantity</th>
									<th class="product-subtotal">Subtotal</th>
									<th class="product-remove">Remove</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${basketList.size()==0 }">
										<strong>
											<font size="3">장바구니에 담겨있는 상품이 없습니다.</font>
										</strong>
									</c:when>
									<c:otherwise>
										<c:forEach var="row" items="${basketList }" varStatus="i">
											<tr>
												<td class="product-edit">
													<p>
														<input type="checkbox" name="RowCheck" value="${row.basket_num }" id="${row.basket_book_price*row.basket_book_count }" onchange="fn_checkSum()" />
													</p>
												</td>
												<td class="product-image">
													<a href="#">
														<img src="<%=cp %>/upload/${row.basket_book_image }" alt="" width="104px" height="104px">
													</a>
												</td>
												<td class="t-product-name">
													<h3>
														<a href="#">${row.basket_book_name }</a>
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
													<input type="text" name="book_count" maxlength="2" id="${row.basket_num }" value="${row.basket_book_count}" size="1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode: disabled;' />
													<button type="button" class="normal-btn small1 js-goods-cnt-change" onclick="fn_basketModify(${row.basket_num})">
														<em>수정</em>
													</button>
												</td>
												<td class="product-quantity">
													<p>
														<fmt:formatNumber pattern="###,###,###" value="${row.basket_book_price*row.basket_book_count}" groupingUsed="true" />
														원
													</p>
												</td>
												<td class="product-remove">
													<a href="#">
														<i class="flaticon-delete"></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="shopingcart-bottom-area">
						<a class="left-shoping-cart" href="#">CONTINUE SHOPPING</a>
						<div class="shopingcart-bottom-area pull-right">
							<a class="right-shoping-cart" href="#" id="deleteAll">CLEAR SHOPPING CART</a>
							<a class="right-shoping-cart" href="#">UPDATE SHOPPING CART</a>
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
							<input type="text" placeholder="">
							<a class="" href="#">APPLY COUPON</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="subtotal-main-area">
						<div class="subtotal-area">
							<h2>
								SUBTOTAL
								<span>$ 200</span>
							</h2>
						</div>
						<div class="subtotal-area">
							<h2>
								GRAND TOTAL
								<span>$ 200</span>
							</h2>
						</div>
						<a href="#">CHECKOUT</a>
						<p>Checkout With Multiple Addresses</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Discount Area End -->
	<script type="text/javascript">
	$(document).ready(function(){
	  
	  //전체 선택 체크박스 클릭
	  $("#checkAll").click(function () {
      //전체 선택 체크박스가 체크된 상태일 경우
      if($("#checkAll").prop("checked")){
        //해당 화면에 전체 checkbox들을 체크해준다.
        $("input[type=checkbox]").prop("checked",true);
      } else{
        $("input[type=checkbox]").prop("checked",false);
      }
    });
	  
	  $(".left-shoping-cart").click(function(e) {
	    	e.preventDefault();
      	location.href ='<%=cp%>/books/booksList.do';
    });
	  
	  $("#deleteAll").on("click",function(e){ //전체 삭제 하기 버튼
	    e.preventDefault();
	    location.href = '<%=cp%>/basket/basketDeleteAll.do';
    });
	  
	});
	
	function onlyNumber(event){
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.keyCode;
	   if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	      return;
	   else
	      return false;
	}
	function removeChar(event) {
	   event = event || window.event;
	   var keyID = (event.which) ? event.which : event.keyCode;
	   if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	      return;
	   else
	      event.target.value = event.target.value.replace(/[^0-9]/g, ""); 
	}
	
	</script>
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="<%=cp %>/bootstrap/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="<%=cp %>/bootstrap/js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="<%=cp %>/bootstrap/js/owl.carousel.min.js"></script>
	<!-- jquery-ui js -->
	<script src="<%=cp %>/bootstrap/js/jquery-ui.min.js"></script>
	<!-- jquery Counterup js -->
	<script src="<%=cp %>/bootstrap/js/jquery.counterup.min.js"></script>
	<script src="<%=cp %>/bootstrap/js/waypoints.min.js"></script>
	<!-- jquery countdown js -->
	<script src="<%=cp %>/bootstrap/js/jquery.countdown.min.js"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="<%=cp %>/bootstrap/venobox/venobox.min.js"></script>
	<!-- jquery Meanmenu js -->
	<script src="<%=cp %>/bootstrap/js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="<%=cp %>/bootstrap/js/wow.min.js"></script>
	<script>
    new WOW().init();
  </script>
	<!-- scrollUp JS -->
	<script src="<%=cp %>/bootstrap/js/jquery.scrollUp.min.js"></script>
	<!-- plugins js -->
	<script src="<%=cp %>/bootstrap/js/plugins.js"></script>
	<!-- Nivo slider js -->
	<script src="<%=cp %>/bootstrap/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="<%=cp %>/bootstrap/lib/home.js" type="text/javascript"></script>
	<!-- main js -->
	<script src="<%=cp %>/bootstrap/js/main.js"></script>
</body>
</html>