<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질문답변 게시판</title>
<link rel="stylesheet" href="<%=cp %>/css/board.css" type="text/css" />
</head>
<body>
	<h2 class="cscenter_h2">고객센터</h2>
	<h3 class="bul_green">FAQ 게시판</h3>
	<br />
	<table class="faqView" width="770" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th width="100"><b>번호</b></th>
			<td style="height: 38px;">${faqModel.faq_num}</td>
			<th width="100"><b>글쓴이</b></th>
			<td style="height: 38px;">${faqModel.member_id}</td>
			<th width="100"><b>조회수</b></th>
			<td style="height: 30px;">${faqModel.readcount}</td>
			<th width="100"><b>날짜</b></th>
			<td style="height: 25px;">${faqModel.faq_regdate}</td>
		</tr>
		<tr>
			<th width="100"><b>제목</b></th>
			<td colspan="5" width="770" style="height: 38px;">${faqModel.faq_title}</td>
		</tr>
		<tr>
			<th width="100"><b>내용</b></th>
			<td colspan="5" width="770" style="height: 70px;">${faqModel.faq_content }</td>
		</tr>
	</table>
	<div id="Bbutton">
		<c:url var="modifyURL" value="modifyForm">
			<c:param name="faq_num" value="faq_num" />
		</c:url>
		<c:url var="deleteURL" value="/faq/faqDelete.do">
			<c:param name="faq_num" value="faq_num" />
		</c:url>
		
			<c:if test="${member_id eq 'admin'}">
				<input name="list" type="button" value="수정" class="Bbutton" onClick="javascript:location.href='<%=cp%>/faq/faqModify.do?faq_num=${faq_num}&currentPage=${currentPage}'">
				<input name="list" type="button" value="삭제" class="Bbutton" onClick="javascript:location.href='<%=cp%>/faq/faqDelete.do?faq_num=${faq_num}&currentPage=${currentPage}'">
				<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='<%=cp%>/faq/faqList.do?currentPage=${currentPage}'">
			</c:if>
			<c:if test="${member_id ne 'admin'}">
				<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='<%=cp%>/faq/faqList.do?currentPage=${currentPage}'">
			</c:if>
		
	</div>
</body>
</html>
