<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기 성공</title>
</head>
<body>
<script type="text/javascript">
	alert('당신의 비밀번호는' +  '${mresultClass.member_pw}'  + '입니다.');
	opener.parent.location = "loginForm.do";
	window.close();
</script>
</body>
</html>