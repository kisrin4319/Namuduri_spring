<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="<%=cp%>/css/style1.css" type="text/css" />
<link rel="stylesheet" href="<%=cp%>/css/button.css" type="text/css" />
</head>
<body style="width: 540px; height: 215px;">
	<div id="popup_type01" style="width: 500px;">
		<div class="popup_wrap">
			<!-- title -->
			<div class="tit" style="height: 33px;">
				<h1 class="title_h_cartlist">비밀번호 확인</h1>
			</div>
			<div class="popup_container" style="padding-bottom: 50px; padding-top: 50px; padding-left: 100px;">
				<form action="checkAction.do" method="post">
					<input type="hidden" name="board_num" value="${board_num}" />
					<input type="hidden" name="currentPage" value="${currentPage}" />
					<input type="hidden" name="ref" value ="${ref }" />
					<tbody>
						<tr>
							<td width="100" bgcolor="#F4F4F4">
								<p id="fon">&nbsp;&nbsp;&nbsp;비밀번호 입력</p>
							</td>
							<td width="300" bgcolor="#FFFFFF">
								&nbsp;&nbsp;
								<input type="text" name="board_pw" maxlength="40">
								&nbsp;&nbsp;
								<input name="submit" type="submit" value="확인" class="inputb" style="width: 34px; height: 24px;">
							</td>
						</tr>
						<tr bgcolor="#777777">
							<td height="1" colspan="2"></td>
						</tr>
					</tbody>
				</form>
			</div>
		</div>
	</div>
</body>
</html>