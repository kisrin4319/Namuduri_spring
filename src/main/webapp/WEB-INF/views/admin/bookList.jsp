<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=cp%>/css/adminPage.css" rel="stylesheet" type="text/css" />
<title>도서 정보 관리</title>
</head>
<body>
<div class="searcharea">
<form >
<!-- 검색 창 -->
	<select name="searchNum" class="searchNum">
		<option value="0">도서명</option>
		<option value="1">저자</option>
		<option value="2">출판사</option>
	</select>
	<input class="searchKeyword" type="text" name="searchKeyword">
	<input class="searchbutton" name="submit" type="submit" value="검색">
</form>
</div>

<!-- 도서 리스트 출력 -->
<div class="list">
<table class="table_list">
<tr>
	<th width=3%><b>번호</b></th>
	<th width=5%><b>&nbsp;</b></th>
	<th width=20%><b>도서명</b></th>
	<th width=8%><b>카테고리</b></th>
	<th width=10%><b>저자</b></th>
	<th width=10%><b>출판사</b></th>
	<th width=8%><b>가격</b></th>
	<th width=8%><b>재고</b></th>
	<th width=30% align=center><b>관리</b></th>
</tr>
<c:choose>
	<c:when test="${listCount==0}">
		<tr align=center>
			<td colspan=8>등록된 도서가 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="list" items="${booksList}" varStatus="stat">
			<c:url var="viewURL" value="/admin/bookDetail.do">
				<c:param name="book_num" value="${list.book_num}"/>
				<c:param name="currentPage" value="${currentPage}"/>
			</c:url>
			<tr>
				<td>${list.book_num}</td>
				<td><img src="<%=cp%>/upload/${list.book_image}" width="100" height="130" border="0"/></td>
				<td><a href="${viewURL}">${list.book_name}</a></td>
				<td>${list.book_category}</td>
				<td>${list.book_auth}</td>
				<td>${list.company_id}</td>
				<td>${list.book_price}</td>
				<td><b>${list.book_current_count}</b>/${list.book_base_count}</td>
				<td align=center>
				<input class="adminbutton2" type=button value="수정" 
					onclick="javascript:location.href='<%=cp%>/admin/bookModify.do?book_num=${list.book_num}&currentPage=${currentPage}'"/>
				<br><br>
				<input class="adminbutton2" type=button value="삭제" 
					onclick="javascript:location.href='<%=cp%>/admin/bookDelete.do?book_num=${list.book_num}&currentPage=${currentPage}'"/></td>
			</tr>
		</c:forEach>	
	</c:otherwise>
</c:choose>
</table>


<table class="paging">
<tr>
	<td align=center colspan=8>${pagingHtml}</td>
</tr>
</table>

<div class="detail_button">
<form><input class="button" type=button value="도서 등록하기" onclick="javascript:location.href='<%=cp%>/admin/bookWrite.do'"/></form>
</div>
</div>
</body>
</html>