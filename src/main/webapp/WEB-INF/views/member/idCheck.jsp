<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복확인</title>
<link href="<%=cp %>/css/style1.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkId(){
	opener.document.memberInfo.member_id.value="${member_id}";
	document.getElementById("${member_id}").value = opener.document.memberInfo.member_id.value;
	self.close();
	
}
</script>
</head>
<body leftmargin="0" topmargin="0" style= "overflow:hidden">
<form action="idCheck.do" method="post" name="idCheck" onsubmit="return check()">
<div id="popup_type01" style="width:350px;">
	<div class="popup_shadow">
		<div class="popup_wrap">
			<div class="tit">
				<h1 class="title_h_cartlist">아이디 중복 확인</h1>
			</div>
			<div class="popup_container">
	<table width="285" border="0" cellspacing="0" cellpadding="0" class="idChk">
		<tr align="center">
			<td height="30">
				<c:if test="${count != 0 }">
					<div class="popup_message2 popup_graybox">
						<strong class="font_blue">${member_id }</strong><br />
						<strong>이미 사용중인 아이디입니다.</strong><br />
						<span class="font_11">다른 아이디를 입력해 주세요.</span><br />
					</div>
				</c:if>
				<c:if test="${count == 0 }">
					<div class="popup_message2 popup_graybox">
						<strong class="font_blue">${member_id }</strong><br />
						<strong>사용할 수 있는 아이디입니다.</strong><br />
					</div>					
				</c:if>
				<br>
				<div class="btn_clear padding_top10"><input type="image" src="member/images/btn_confirm_popup.gif" value="닫기" onclick="window.close()" class="idChk"/></div>
			</td>
		</tr>	
	</table>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>