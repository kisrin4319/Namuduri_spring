<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/mypage.css" rel="stylesheet" type="text/css"/>
<title>Namuduri</title>
</head>
<body>
<h2 class="mypage_font"><a href="http://localhost:8080/namuduri/mypage.do">마이페이지</a></h2>

<table id="mypage_menu">
	<tr><th colspan="2" align="left">주문관리</th></tr>
		<tr><td align="left"><a href="http://localhost:8080/namuduri/order/orderListCheckView.do">▶주문/배송조회</a></td></tr>
		
	<tr><th colspan="2" align="left">회원정보관리</th></tr>
		<tr><td align="left"><a href="http://localhost:8080/namuduri/member/memberModifyView.do">▶회원정보수정</a></td></tr>
		<tr><td align="left"><a href="http://localhost:8080/namuduri/member/memberDeleteView.do">▶회원 탈퇴</a></td></tr>
</table>

</body>
</html>