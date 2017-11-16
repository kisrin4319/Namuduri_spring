<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/adminPage.css" rel="stylesheet" type="text/css" />
<title>회원 정보 관리</title>
</head>
<body>

<div class="searcharea">
<form>
<div class="search_input">
	<select name="searchNum" class="searchNum">
		<option value="0">ID</option>
		<option value="1">이름</option>
		<option value="2">EMAIL</option>
		<option value="3">전화번호</option>
		<option value="4">휴대폰번호</option>
	</select>
	<input class="searchKeyword" type="text" name="searchKeyword">
	<input class="searchbutton" name="submit" type="submit" value="검색">
</div>
</form>
</div>


<!-- 회원 리스트 출력 -->
<div class="list">
<table class="table_list">
<tr>
	<th width=5%>번호</th>
	<th width=5%>아이디</th>
	<th width=5%>이름</th>
	<th width=20%>주민번호</th>
	<th width=20%>이메일</th>
	<th width=20%>전화번호</th>
	<th width=10%>가입일</th>
	<th width=15% align=center>관리</th>
</tr>
<!-- iterator로 회원 리스트 출력 -->
<s:iterator value="list" status="stat">
<!-- 아이디와 연결되는 URL -->
	<s:url id="viewURL" action="adminViewMember">
		<s:param name="member_id">
			<s:property value="member_id"/>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
	</s:url>
	
	<tr>
		<td><s:property value="member_num"/></td>
		<td><s:a href="%{viewURL}"><s:property value="member_id"/></s:a></td>
		<td><s:property value="member_name"/></td>
		<td><s:property value="member_jumin1"/>-<s:property value="member_jumin2"/></td>
		<td><s:property value="member_email"/></td>
		<td><s:property value="member_mobile"/></td>
		<td><s:property value="member_join_date"/></td>
		<td>
		<input class="adminbutton" type=button value="수정" onclick="javascript:location.href='adminModifyForm.do?member_id=<s:property value="member_id"/>&currentPage=<s:property value="currentPage"/>'"/>
		<input class="adminbutton" type=button value="삭제" onclick="javascript:location.href='adminDeleteMember.do?member_id=<s:property value="member_id"/>&currentPage=<s:property value="currentPage"/>'"/></td>
	</tr>
</s:iterator>

<s:if test="list.size()==0">
<tr align=center>
	<td colspan=8>등록된 회원이 없습니다.</td>
</tr>
</s:if>
</table>


<table class="paging">
<tr align=center>
	<td colspan=8><s:property value="pagingHtml" escape="false"/></td>
</tr>
</table>

</div>

</body>
</html>