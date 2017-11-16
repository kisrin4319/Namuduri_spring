<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/adminPage.css" rel="stylesheet" type="text/css" />
<title>관리자 페이지</title>
</head>
<body>
<div class="main">
<table align="center" class="admin_main">
<tr align="center"><td class="main_title"><img src="/namuduri/images/adminPage/admin-main-image.jpg"/></td></tr>
<tr>
<td class="menu" style="padding-top: 10%;">
<a href="<%=cp%>/admin/memberList.do"><img src="/namuduri/images/adminPage/member-menu-image.jpg" width="230" height="100"/></a>
&nbsp;&nbsp;
<a href="<%=cp%>/admin/bookList.do"><img src="/namuduri/images/adminPage/textbook-menu-image.jpg" width="230" height="100"/></a>
&nbsp;&nbsp;
<a href="<%=cp%>/admin/orderList.do"><img src="/namuduri/images/adminPage/order-menu-image.jpg" width="230" height="100"/></a>
</td>
</tr>
</table>
</div>
</body>
</html>