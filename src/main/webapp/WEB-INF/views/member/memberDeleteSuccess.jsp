<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 성공</title>
<body>
<%session.invalidate(); %>
<script language="javascript">
		confirm("회원 탈퇴가 정상적으로 처리되었습니다. 이용해 주셔서 감사합니다.")
		location.href = "main.do";
</script>

</body>
</html>