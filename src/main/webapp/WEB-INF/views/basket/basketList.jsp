<?xml version="1.0" encoding="UTF-8" ?>
<%
	String cp = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Namuduri</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/content.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/layout.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
		<div id="route">
			<div>
				<span> <a href="#">Home</a>
				</span> <span>장바구니</span>
			</div>
		</div>
		<div id="container">
			<!-- 본문 시작 : start -->
			<div id="content">
				<div class="contents">
					<div class="order-page">
						<div class="step-top none-btm-bd">
							<h2>장바구니</h2>
							<div>
								<span class="this" title="현재페이지"> <strong>01</strong> 장바구니
								</span> <span> <strong>02</strong> 주문서작성/결제
								</span> <span class="end"> <strong>03</strong> 주문완료
								</span>
							</div>
						</div>
						<form name="frm">
							<!-- 장바구니 상품리스트 시작 -->
							<div class="table1 type1">
								<table>
									<thead>
										<tr>
											<th align="center" scope="col" width="12%"><input type="checkbox" id="checkAll" onchange="fn_checkSum()" /> 전체 선택 /해제</th>
											<th align="center" scope="col">상품/옵션 정보</th>
											<th align="center" scope="col">수량</th>
											<th align="center" scope="col">카테고리</th>
											<th align="center" scope="col">상품금액</th>
											<th align="center" scope="col">주문/삭제</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${basketList.size() == 0 }">
											<strong> <font size="3">장바구니에 담겨있는 상품이 없습니다.</font>
											</strong>
										</c:when>
										<c:otherwise>
											<tbody>
												<c:forEach var="row" items="${basketList }" varStatus="i">
													<input type="hidden" id="basket_num" name="basket_num" value="${row.basket_num }" />
													<input type="hidden" id="basket_book_num" name="basket_book_num" value="${row.basket_book_num}" />
													<tr>
														<td><input type="checkbox" name="RowCheck" value="${row.basket_num }" id="${row.basket_book_price*row.basket_book_count }" onchange="fn_checkSum()" /></td>
														<td class="gi this-product"><span> <a href="#this" id="bookDetail"> <img src="<%=cp %>/upload/${row.basket_book_image }" width="40" alt="${row.basket_book_name }" title="${row.basket_book_name }" class="middle" class="imgsize-s" /> &nbsp;${row.basket_book_name } <br />
															</a>
														</span></td>
														<td class="ta-c count this-product"><input type="text" name="book_count" maxlength="2" id="${row.basket_num }" value="${row.basket_book_count}" size="1" align="bottom" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode: disabled;' />
															<button type="button" class="normal-btn small1 js-goods-cnt-change" onclick="fn_basketModify(${row.basket_num})">
																<em>수정</em>
															</button></td>
														<td align="center"><strong>${row.book_category }</strong></td>
														<td class="ta-c this-product"><strong class="price"> <fmt:formatNumber pattern="###,###,###" value="${row.basket_book_price*row.basket_book_count}" groupingUsed="true" /> 원
														</strong>
															<p class="add_currency"></p></td>
														<td align="center"><a href="#this" onclick="goOrder(${row.basket_book_num}, ${row.basket_book_count})" class="skinbtn point1 cart-orderselect" style="width: 85px; height: 45px; line-height: 50px; background-color: #5e6b9f; color: #ffffff">바로구매</a> <a href="#this" id="delete" onclick="fn_basketDelete(${basket_num})" class="skinbtn point1 cart-orderselect" style="width: 85px; height: 45px; line-height: 50px;"> 삭&nbsp;제 <input type="hidden" value="${row.basket_num}" />
														</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</c:otherwise>
									</c:choose>
								</table>
								<!-- 장바구니 상품리스트 끝 -->
							</div>
							<div class="list_button_wrap">
								<!-- start 페이징 -->
								<div class="list_paging align_center" id="eventPaging">
									<div class="list_paging">${pagingHtml}</div>
								</div>
							</div>
						</form>
						<div style="text-align: left">
							<a class="btn-move-home" onclick="javascript:location.href='<%=cp%>/books/booksList.do'">도서 목록으로</a>
						</div>
						<div class="price-box">
							<div>
								<div>
									<p>
										<span class="detail"> 총 <em id="totalGoodsCnt"> <input type="text" id="CheckCount" value="0" size="1" style="text-align: right; border: 0; vertical-align: baseline; font-size: medium;" />
										</em> 개의 상품금액 <strong id="totalGoodsPrice"></strong>
										</span> <span id="deliveryCalculateNone"> <img src="<%=cp%>/img/basket/icon/plus.png" alt="더하기" /> 배송비 <strong id="totalDeliveryCharge"><input type="text" id="fee" value="0" size="4" style="text-align: right; border: 0; vertical-align: baseline; font-size: medium;" /></strong> 원
										</span> <span class="total"> <img src="<%=cp%>/img/basket/icon/total.png" alt="합계" /> <strong id="totalSettlePrice"> <input type="text" id="sum" value="0" style="border: 0; font-size: x-large; text-align: center; vertical-align: baseline; font-weight: unset;" size="10" />
										</strong> 원
										</span>
									</p>
									<div class="add_currency">
										<em id="totalSettlePriceAdd"></em>
									</div>
									<p></p>
									<span id="deliveryChargeText" />
								</div>
							</div>
						</div>
						<div class="btn-justify">
							<div>
								<button type="button" class="skinbtn default cart-cartdelete" onclick="fn_selectDelete();">
									<em>선택 삭제</em>
								</button>
								<a href="#this" id="deleteAll" class="skinbtn default cart-cartdelete">전체 삭제</a>
							</div>
							<div>
								<button type="button" class="skinbtn point2 cart-orderall" onclick="fn_selectOrder();">
									<em>선택 상품 주문</em>
								</button>
								<button type="button" class="skinbtn point2 cart-orderall" onclick="javascript:location.href='<%=cp%>/order/totalOrder.do'">
									<em>전체 상품 주문</em>
								</button>
							</div>
						</div>
					</div>
					<hr />
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	$(document).ready(function() {
    	
	  //전체 선택 체크박스 클릭
	  $("#checkAll").click(function(){
	    //전체 선택 체크박스가 체크된 상태일 경우
	    if($("#checkAll").prop("checked")){
	      //해당 화면에 전체 checkbox들을 체크해준다.
	      $("input[type=checkbox]").prop("checked",true);
	    }
	    //전체 선택 체크박스가 해제된 경우
	    else{
	      //해당 화면에 전체 checkbox들의 체크를 해제시킨다.
	      $("input[type=checkbox]").prop("checked",false);
	    }	     
	    });
   
	  $("#deleteAll").on("click",function(e){ //전체 삭제 하기 버튼
	    e.preventDefault();
	  fn_basketDeleteAll();
    });
  });
	
	function fn_basketModify(basket_num) { 
	  // basket_num과 basket_book_price를 넘겨준다.
	  var comSubmit = new ComSubmit();
	  var num = basket_num;
	  var count = document.getElementById(basket_num).value;

	  
	  if (confirm("변경 하시겠습니까?")) {
	    comSubmit.setUrl("<c:url value = '/basket/basketModify.do' />");
	     location.href='<%=cp%>/basket/basketModify.do?basket_num='+num+'&basket_book_count='+count;
	     
	     //document.frm.submit();
	  } else {
	     alert("취소되었습니다");
	  }	  
	}

	function fn_basketDelete(basket_num) {
	  var comSubmit = new ComSubmit();
	  if (confirm("삭제하시겠습니까?")) {
	    comSubmit.setUrl("<c:url value= '/basket/basketDelete.do' />");
	    comSubmit.addParam("basket_num",basket_num);
	    comSubmit.submit();
	  } else {
	     alert("취소되었습니다");
	  }
	  
	}
	function fn_selectDelete() {
	  
	  var RowCheck = document.getElementsByName('RowCheck');
	  var Count = 0;
	 
	  for(var i=0; i<RowCheck.length;i++){
  	  if(RowCheck[i].checked){ Count++; }
  	  }
	  
	  if(!Count){
	    alert("1개 이상 체크 박스를 선택 해주세요");
	    return false;
	  }
	  else {
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value = '/basket/basketCheckDelete.do' />");
	    comSubmit.submit();
	  }
	}

	function fn_basketDeleteAll() {
	  var comSubmit = new ComSubmit();
	  if(confirm("전체 삭제 하시겠습니까?")){
	    comSubmit.setUrl("<c:url value = '/basket/basketDeleteAll.do' />");
	    comSubmit.submit();
	  } else {
	    alert("취소되었습니다.");
	  }
	}
	function fn_checkCount() {
	var count = 0;
    	var RowCheck = document.getElementsByName('RowCheck');
    	for(var i=0; i<RowCheck.length;i++){
    	  if(RowCheck[i].checked){
    	    count++;
    	  }
    	}
    	CheckCount.value = count;
  }
	function fn_checkSum() {
    	var sumValue =0;
    	var feeValue =0;
    	var RowCheck = document.getElementsByName('RowCheck');
    	for(var i =0 ; i<RowCheck.length;i++){
    	  if(RowCheck[i].checked){
    	    sumValue += parseInt(RowCheck[i].id);
    	  }
    	}
    	if(sumValue <100000 && sumValue!=0){
    	  feeValue = 5000;
    	} 
    fee.value = feeValue;
    sum.value=sumValue+feeValue;
    fn_checkCount();
  }

function goOrder(basket_book_num, basket_book_count) {
  // updateAmout 펑션에 바스켓 no와 price 가격 정보를 넘겨준다.
  var num = basket_book_num;
  var amount = basket_book_count;

  
  if (confirm("주문 하시겠습니까?")) {
   location.href = '<%=cp%>/order/singleOrder.do?book_num='+num+'&order_book_count='+amount;
  } else {
     alert("취소되었습니다");
     return false;
  }
  
}

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

function fn_selectOrder() {
 	var RowCheck = document.getElementsByName('RowCheck');
 	var Count = 0;
	
 	for(var i=0; i<RowCheck.length;i++){
	  if(RowCheck[i].checked){ Count++; }
	  }
 	
 	if(!Count){
 	  alert("1개 이상 체크 박스를 선택 해주세요");
 	  return false;
 	  }
 	else {
	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value = '/order/selectOrder.do' />");
	   comSubmit.submit();
 	  }
}
</script>
</body>
</html>