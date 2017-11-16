<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/adminPage.css" rel="stylesheet" type="text/css" />
<title>회원 정보 수정</title>
</head>
<body>
<div class="detail">
<h2 class="detail_h2">회원 정보 수정</h2>
<form action="adminModifyMember.do" method="post">
	<s:hidden name="member_id" value="%{resultClass.member_id}"/>
	<s:hidden name="currentPage" value="%{currentPage}"/>
<table border=1 cellspacing=0 cellpadding=0 class="table_detail">
	<tr>
		<th width=15%>회원 번호</th>
		<td width=35%><s:property value="resultClass.member_num"/></td>
		<th width=15%>가입일</th>
		<td width=35%><s:property value="resultClass.member_join_date"/></td>
	</tr>
	<tr>
		<th>ID</th>
		<td><s:property value="resultClass.member_id"/></td>
		<th>비밀번호</th>
		<td class="short"><input type=text name="member_pw" value="${resultClass.member_pw}"/></td>
	</tr>
	<tr>
		<th width=15%>이름</th>
		<td class="short" width=35%><input type=text name="member_name" value="${resultClass.member_name}"/></td>
		<th width=15%>주민번호</th>
		<td class="short" width=35%><input type=text name="member_jumin1" value="${resultClass.member_jumin1}"/>-<input type=text name="member_jumin2" value="${resultClass.member_jumin2}"/></td>
	</tr>
	<tr>
		<th width=15%>E-MAIL</th>
		<td class="middel" width=35%><input type=text name="member_email" value="${resultClass.member_email}"/></td>
		<th width=15%>E-MAIL 수신여부</th>
		<td class="getyn" width=35%>
			<input type="radio" name="member_email_get" id="member_email_get" value="1" 
				${resultClass.member_email_get == '1' ? 'checked="checked"' : '' }>수신
			<input type="radio" name="member_email_get" id="member_email_get" value="0" 
				${resultClass.member_email_get == '0' ? 'checked="checked"' : '' }>비수신
		</td>
	</tr>
	<tr>
		<th width=15%>집 전화 번호</th>
		<td class="middel" width=35%><input type=text name="member_phone" value="${resultClass.member_phone}"/></td>
		<th width=15%>휴대전화 번호</th>
		<td class="middel" width=35%><input type=text name="member_mobile" value="${resultClass.member_mobile}"/></td>
	</tr>
	<tr>
		<th width=15%>우편번호</th>
		<td width=85% colspan=3><input type=text name="member_zipcode" value="${resultClass.member_zipcode}"/>
			<input class="searchbutton" type="button" value="검색"/></td>
	</tr>
	<tr>
		<th  width=15%>주소</th>
		<td class="long" width=85% colspan=3><input type=text name="member_addr1" value="${resultClass.member_addr1}"/>&nbsp;<input type=text name="member_addr2" value="${resultClass.member_addr2}"/></td>
	</tr>
</table>
<br>
<h2>환불 정보 수정</h2>
<table border=1 cellspacing=0 cellpadding=0 class="table_detail">
	<tr>
		<th width=15%>은행명</th>
		<td width=35%><input type=text name="member_bankname" value="${resultClass.member_bankname}"/></td>
		<th width=15%>예금주</th>
		<td width=35%><input type=text name="member_account_holder" value="${resultClass.member_account_holder}"/></td>
	</tr>
	<tr>
		<th width=15%>환불계좌</th>
		<td class="long" width=85% colspan=3><input type=text name="member_refund_account" value="${resultClass.member_refund_account}"/></td>
	</tr>
</table>
<br>
<div class="detail_button">
<input class="button" type=button value="목록보기" onclick="javascript:location.href='adminMemberList.do?currentPage=<s:property value="currentPage"/>'">
<input class="button" type="submit" value="수정하기"/>
</div>
</form>
</div>
</body>
</html>