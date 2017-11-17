<?xml version="1.0" encoding="UTF-8" ?>
<% String cp = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">

	function locationURL() {
		alert("성공적으로 작성 했습니다.");
		window.opener.parent.location.href ="<%=cp%>/books/bookDetail.do?book_num=${book_num}";
		window.close();
	}
</script>
</head>
<body>
	<script>
		locationURL()
	</script>
</body>
</html>