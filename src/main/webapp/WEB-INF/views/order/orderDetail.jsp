<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>주문 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/default_ink_ssl.css" rel="stylesheet" type="text/css" />
<link href="css/layout_ssl.css" rel="stylesheet" type="text/css" />
<link href="css/myroom.css" rel="stylesheet" type="text/css" />
<link href="css/order_ssl.css" rel="stylesheet" type="text/css" />
<link href="css/style_ssl.css" rel="stylesheet" type="text/css" />
<link href="css/style2_ssl.css" rel="stylesheet" type="text/css" />
</head>
<body>
		
<div class="content_middle" style="width: 800px; margin-right: 100px;">
	<div id="myroom_contents">
	<h2 class="bul_green20">
			<span>주문자 정보</span>
	</h2>
	<table class="table_myroom td_font_12 margin_top10">
		<tr>
			<td width="100">주 문 자</td>
			<td colspan="3" width="500"><s:property value="mresultClass.member_id"/></td>
		</tr>
		<tr>
			<td width="40">휴대폰번호</td>
			<td width="80"><s:property value="mresultClass.member_phone"/></td>
			<td width="40">이메일</td>
			<td width="80"><s:property value="mresultClass.member_email"/></td>
		</tr>
	</table><br>
		
		<h2 class="bul_green20">
				<span>주문 정보</span>
		</h2>
		
	<table class="table_myroom td_font_12" style="margin-top: -15px;">
		<caption>상세 내역</caption>
		<colgroup>
			<col width="14%" />
			<col width="20%" />
			<col width="20%" />
			<col width="5%" />
			<col width="15%" />
		</colgroup>
		
			<tr>
				<th class="first" scope="col">번호</th>
				<th scope="col">상품이미지</th>
				<th scope="col">상품 정보</th>
				<th scope="col">수량</th>
				<th scope="col">금액</th>
			</tr>
		<s:iterator value ="orderlist" status ="stat">
		<tr align="center">
			
			<td><s:property value ="#stat.index+1"/></td>
		
			<td width="100" height="50"><img src="/namuduri/admin/upload/<s:property value="goods_image"/>"style="width: 130px;height: 120px;"/></td>
			<td align="left" width="270">
			주문 번호 : <s:property value="order_trade_num"/><br><br>
			도 서 명 : <s:property value="order_goods_name"/><br><br>
			주문 상태 : 
			<s:if test="order_trans_status == 'ST01'">
			배송 준비중
			</s:if>
			<s:elseif test="order_trans_status == 'ST02'">
				배송 중
			</s:elseif>
			<s:else>
				배송 완료
			</s:else>
			<br><br>
			주문 날짜 : <s:property value="order_regdate"/><br><br>
			</td>
			<td><s:property value="order_goods_count"/>권</td><br>
			<td><s:property value="order_goods_count*order_goods_price"/>원</td>
	
		</tr>
		</s:iterator>
	</table>
	<br><br>
	<table class="table_myroom td_font_12 margin_top10">
		<tr>
			<td width="100">받으실 분</td>
			<td colspan="3" width="500"><s:property value="oresultClass.order_receive_name"/></td>
		</tr>
		<tr>
			<td width="40">휴대폰번호</td>
			<td width="80"><s:property value="oresultClass.order_receive_phone"/></td>
			<td width="40">전화번호</td>
			<td width="80"><s:property value="oresultClass.order_receive_mobile"/></td>
		</tr>
		<tr>
			<td width="100">주  소</td>
			<td colspan="3" width="500"><s:property value="oresultClass.order_receive_addr1"/>&nbsp;</td>
		</tr>	
	</table>
	<br>
	<input type=button value="닫기" align="middle" onclick="javascript:location.href='http://localhost:8080/namuduri/orderListCheck.do'"/>
	</div>
</div>
</body>
</html>