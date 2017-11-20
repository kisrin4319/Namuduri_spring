<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/adminheader.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
<div id="header">
	<div class="navigation_bar">

 	<ul class="gnb_main">
 		<li class="section_logo" style="width: 250px;"><a href="<s:url action='adminMain'/>">Namuduri</a></li>
		<li class="section_title" style="width: 85px;"><a href="<s:url action='adminMemberList'/>" class="text">회원 관리</a></li>
		<li class="section_title" style="width: 85px;"><a href="<s:url action='adminTextbookList'/>" class="text">상품 관리</a></li>
		<li class="section_title" style="width: 85px;"><a href="<s:url action='adminOrderCheck'/>" class="text">주문 관리</a></li>
	</ul>

	<ul class="gnb_sub">
		<li><a href="main.do">홈페이지로 나가기</a></li>
		<li><a href="logOut.do">로그아웃</a></li>
	</ul>
	
	</div>
</div><!-- header -->
</body>
</html>