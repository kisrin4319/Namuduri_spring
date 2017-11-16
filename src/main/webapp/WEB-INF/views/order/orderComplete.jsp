<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 완료</title>
<link href="css/content.css?ver=1" rel="stylesheet" type="text/css" />
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css?ver=1" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/common.css?ver=1" rel="stylesheet" type="text/css" />
</head>
<body>

	<body class="body-order body-order-end pc">
	<div id="wrap">
   		<div id="route">
        	<div>
            	<span><a href="#">Home</a></span>
            	<span><b>주문완료</b></span>
        	</div>
    	</div>		 
    	<!--  본문 시작 -->
   		<div id="content">
   			<div class="contents">
   				<div class="order-page">
   					<div class="step-top"><h2>주문완료</h2><div>
                <span><strong>01</strong> 장바구니</span>
                <span><strong>02</strong> 주문서작성/결제</span>
                <span title="현재페이지" class="this end"><strong>03</strong> 주문완료</span>
            </div>
        </div>
        
        <!-- 주문 접수 완료 -->
        <div class="order-completion" style=" padding-top: 30px;">
            <strong>주문이 정상적으로 접수 되었습니다.</strong>
            <span>감사합니다.</span>
        </div>		 
   		<h3 class="fir">주문요약정보</h3>
   		<div class="table1">
   			<table>
   				<tbody>
   					<tr>
   						<th class ="ta-l">결제수단</th>
   						<td>
   							<p>
   								<strong>무통장 입금</strong><br />
   								입금은행 : <s:property value="oparamClass.order_bankname" />
   								입금계좌 : <s:property	value="oparamClass.order_bank_num" />
   								예금주명 : 나무두리(주)
   								입금금액 : <strong class ="c-red"><s:property value="order_receive_moneysum"/>원</strong>
   								입금자명 : <s:property value ="oparamClass.order_trade_payer" />
   							</p>
   						</td>
   					</tr>
   					
   					<tr>
   						<th class ="ta-l">주문번호</th>
   						<td><s:property value ="oparamClass.order_trade_num" /></td>
   					</tr>
   					
   					<tr>
                    	<th class="ta-l">주문일자</th>
                    	<td><s:property value="oparamClass.order_regdate" /></td>
               		</tr>
   					
   					<tr>
                    	<th class="ta-l">주문상품 </th>                    	
                    	<td><s:property value ="%{tresultClass.goods_name}"/>&nbsp;외 ${fn:length(basketList)-1}권</td>                    	
               		</tr>
               		
               		<tr>
                  		<th class="ta-l">주문자명</th>
                    	<td><s:property value ="oparamClass.order_receive_name" /></td>
                	</tr>
                	
                	<tr>
                  		<th class="ta-l">배송정보</th>
                    	<td>
                     	   <p>
                    	      [<s:property value ="oparamClass.order_receive_zipcode"/>] <s:property value="order_receive_addr1" />&nbsp; <s:property value="order_receive_addr2" />
                              / <s:property value ="oparamClass.order_receive_mobile "/>  
                    	    </p>
                   		</td>
              		</tr>
              		
              		<tr>
                    	<th class="ta-l">남기실 말씀</th>
                    	<td><strong><s:property value ="oparamClass.order_receive_memo" /></strong></td>
                	</tr>
                	
                	<tr>
                		<th class ="ta-l">총 결제금액</th>
                		<td><strong class ="c-red"><s:property value ="order_receive_moneysum"/></strong><span class="add_currency"></span></td>
                	</tr>
   					</tbody>
   					<colgroup>
   				  	  <col style="width:133px;"/>
                </colgroup>
   			</table>	 
   		</div>		 
   		<div class="btn">
            <a class="skinbtn point2 oe-confirm" href="main.do"><em>확인</em></a>
            <a class="skinbtn point2 oe-confirm" href="mypage.do"><em>마이페이지로</em></a>
        </div>
    </div>
    <hr />
	</div>
	</div>
	    <!-- 본문 끝 : end -->
</div>
</body>
</html>