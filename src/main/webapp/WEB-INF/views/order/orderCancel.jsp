<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 취소</title>
</head>
<body>
<script type="text/javascript">
	alert('주문번호' +  '${oresultClass.order_trade_num}' +  '이 취소되었습니다.');
	location.href = "mypage.do";
</script>
</body>
</html>