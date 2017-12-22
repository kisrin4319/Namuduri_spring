<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/order.css">
</head>
<body>
<h2 style="text-align: -webkit-center; padding-top: 30px;">ORDER COMPLETE</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">MAIN</a>
		</li>
		<li>
			<a href="<%=cp%>/books/booksList.do" style="font-style: oblique;">SHOP</a>
		</li>
	</ul>
	<hr>
<div class="container">
        <div class="row text-center">
            <div class="col-md-12">
               <p>
        		 <img class="img-responsive" alt="iamgurdeeposahan" src="${pageContext.request.contextPath}/img/checkmark.png" style="width: 71px; border-radius: 43px; margin-left: auto;margin-right: auto;display: block;">
      			 <h4>주문이 정상적으로 접수되었습니다</h4>
      			</p>
            </div>
           </div>
            <div class="col-md-6" style="margin-top: 100px;float: inherit;display:  block;margin-left:  auto;margin-right:  auto;padding-top: 60px;">
                <div class="pricing-table">
                    <div class="panel panel-primary" style="border: none;text-align:  unset;float: unset;">
                        <div class="controle-header panel-heading panel-heading-landing">
                            <h1 class="panel-title panel-title-landing">
                                THANK YOU
                            </h1>
                        </div>
                        <div class="panel-body panel-body-landing">
                            <table class="table" align="center">
                                <tr>
                                    <td width="50px"><i class="fa fa-check"></i></td>
                                    <td style="text-align: left;">주문번호: ${order.order_trade_num}</td>
                                </tr>
                                <tr>
                                    <td width="50px"><i class="fa fa-check"></i></td>
                                    <td style="text-align: left;">주문일자: <fmt:formatDate value="${order.order_regdate}" pattern="yyyy-MM-dd" /></td>
                                </tr>
                                <tr>
                                	<td width="50px"><i class="fa fa-check"></i></td>
									<c:choose>
										<c:when test="${size == 1}">
											<td style="text-align: left;">주문상품: ${order_book_name}</td>
										</c:when>
										<c:otherwise>
											<td style="text-align: left;">주문상품: ${order_book_name}&nbsp;외 ${size-1}권</td>
										</c:otherwise>
									</c:choose>
                                </tr>
                                <tr>
                                    <td width="50px"><i class="fa fa-check"></i></td>
                                    <td style="text-align: left;">
                                    	 입금금액 : <fmt:formatNumber value="${order.order_receive_moneysum}" pattern="###,###,###" /> 원
                                    </td>
                                </tr>
                                <tr>
                                	<td width="50px"><i class="fa fa-check"></i></td>
                                	<td style="text-align: left;">주문자명: ${order.order_trade_payer}</td>
                                </tr>
                                <tr>
                                	<td width="50px"><i class="fa fa-check"></i></td>
                                	<td style="text-align: left;">연락처: ${order.order_receive_mobile}</td>
                                </tr>  
                                <tr>
                                	<td width="50px"><i class="fa fa-check"></i></td>
                                	<td style="text-align: left;">배송정보: [${order.order_receive_zipcode}]<br/> 
                                	${order.order_receive_addr1}&nbsp; ${order.order_receive_addr2}</td>
                                </tr>
                                <tr>
                                	<td width="50px"><i class="fa fa-check"></i></td>
                                	<td style="text-align: left;">남기실 말씀: ${order.order_receive_memo}</td>
                                </tr>                                     
                            </table>
                        </div>
                        <div class="panel-footer panel-footer-landing" style="text-align:  -webkit-center;">
                            <a href="<%=cp%>/main.do"><button type="button" class="btn btn-info" style="font-style: oblique; border-bottom: 0px; border-top: 0px; border-left: 0px; border-right: 0px; width: 80px; height: 30px;">MAIN</button></a>
							<a href="<%=cp%>/mypage.do"><button type="button" class="btn btn-info" style="font-style: oblique; border-bottom: 0px; border-top: 0px; border-left: 0px; border-right: 0px; width: 80px; height: 30px;">MY PAGE</button></a>
                        </div>
                    </div>
                </div>
            </div>
    </div>

</body>
</html>