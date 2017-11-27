<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function deleteCheck(id) {
		var page = ${currentPage};
		alert("정말 삭제하시겠습니까?");
		document.location.href="<%=cp%>/admin/bookDelete.do?book_num=" + id + "&currentPage=" + page;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Book List</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item active">Book List</li>
				</ol>
			</div>
		</div>
		<!-- 검색창 영역 -->
		<div class="searcharea">
			<form>
				<div class="search_input">
					<select name="searchNum" class="searchNum">
						<option value="0">카테고리</option>
						<option value="1">도서명</option>
						<option value="2">저자</option>
						<option value="3">출판사</option>
						<option value="4">내용</option>
					</select> <input class="searchKeyword" type="text" name="searchKeyword">
					<input class="searchbutton" name="submit" type="submit" value="검색">
				</div>
			</form>
		</div>
		<div class="row">
			<!-- column -->
			<div class="col-lg-12">
				<div class="card">
					<div class="card-block">

						<div class="table-responsive">
							<table class="table">
								<thead>
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
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${listCount==0}">
											<tr align=center>
												<td colspan=8>등록된 도서가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${booksList}" varStatus="stat">
												<c:url var="viewURL" value="/admin/bookDetail.do">
													<c:param name="book_num" value="${list.book_num}" />
													<c:param name="currentPage" value="${currentPage}" />
												</c:url>
												<tr>
													<td>${list.book_num}</td>
													<td><img src="<%=cp%>/upload/${list.book_image}"
														width="100" height="130" border="0" /></td>
													<td><a href="${viewURL}">${list.book_name}</a></td>
													<td>${list.book_category}</td>
													<td>${list.book_auth}</td>
													<td>${list.company_id}</td>
													<td>${list.book_price}</td>
													<td><b>${list.book_current_count}</b>/${list.book_base_count}</td>
													<td align=center><input class="adminbutton2"
														type=button value="수정"
														onclick="javascript:location.href='<%=cp%>/admin/bookModify.do?book_num=${list.book_num}&currentPage=${currentPage}'" />
														<br> <br> <input class="adminbutton2"
														type=button value="삭제"
														onclick="deleteCheck('${list.book_num}')" /></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<table class="paging">
			<tr>
				<td align=center colspan=8>${pagingHtml}</td>
			</tr>
		</table>

		<div class="detail_button">
			<form>
				<input class="button" type=button value="도서 등록하기"
					onclick="javascript:location.href='<%=cp%>/admin/bookWrite.do'" />
			</form>
		</div>
	</div>
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>