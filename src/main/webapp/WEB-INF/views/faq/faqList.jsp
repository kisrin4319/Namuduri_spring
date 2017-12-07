<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>질문답변 게시판</title>
<link rel="stylesheet" href="<%=cp%>/css/board.css" type="text/css" />

</head>
<body>
	<h2 class="cscenter_h2">고객센터</h2>
	<h3 class="bul_green">질문답변 게시판</h3>
	
	<table class="table_style02" cellspacing="0" cellpadding="0" border="0">
		<colgroup>
			<col width="86px" />
			<col width="*" />
			<col width="126px" />
			<col width="126px" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="col" class="title">
					<p class="th_line">번호</p>
				</th>
				<th scope="col" class="title">
					<p class="th_line">제목</p>
				</th>
				<th scope="col" class="title">
					<p class="th_line">글쓴이</p>
				</th>
				<th scope="col" class="th_line_none">날 짜</th>
			</tr>
			<c:choose>
				<c:when test="${listCount==0 }">
				등록된 게시글이 없습니다.
			</c:when>
				<c:otherwise>
					<form name="faqform" id="faqform">
						<c:forEach var="list" items="${faqList }" varStatus="stat">
							<c:url var="viewURL" value="/faq/faqDetail.do">
								<c:param name="faq_num" value="${list.faq_num}" />
							</c:url>
							<a href="${viewURL }"></a>
							<tr>
								<td class="td_line_none">${list.faq_num}</td>
								<td class="td_line_none">${list.faq_title}</td>
								<td class="td_line_none">${list.member_id}</td>
								<td class="td_line_none">${list.faq_regdate}</td>
							</tr>
						</c:forEach>
					</form>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<table class="table_style03" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<%--<td id="search">
				<form>
					<select name="searchNum">
						<option value="0">글쓴이</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select> <input class="text" type="text" name="isSearch" /> <input name="submit" type="submit" value="검색" class="Bsearch" />
				</form>
			</td> --%> 
			<td id="Bbutton"><input class="Bbutton" type="button" value="글쓰기" onclick="javascript:location.href='<%=cp%>/faq/faqWrite.do'" /></td>
		</tr>
		<tr>
			<td colspan="5" align="center"><div class="paging">${pagingHtml}</div></td>
		</tr>
	</table>
</body>
</html>
