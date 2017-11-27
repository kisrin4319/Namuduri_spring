<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function deleteCheck(id) {
		var page = ${currentPage};
		alert("정말 삭제하시겠습니까?");
		document.location.href="<%=cp%>/admin/bookDelete.do?book_num="+id+"&currentPage="+page;
	}
	function deleteCheck2(id, num) {
		var page = ${reviewPage};
		alert("정말 삭제하시겠습니까?");
		document.location.href="<%=cp%>/admin/reviewDelete.do?review_num="+id+"&book_num="+num+"&currentPage="+page;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- ///////////////////////////////row page title/////////////////////////////////////// -->
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Book Detail</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<%=cp%>/admin/bookList.do">Book List</a></li>
					<li class="breadcrumb-item active">Book Detail</li>
				</ol>
			</div>
		</div>

		<div class="col-lg-12">
			<h2 class="detail_h2">도서 정보 상세보기</h2>
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<table class="table_detail" border=1>
							<tr>
								<th rowspan=7>이미지</th>
								<td align=center rowspan=7><img
									src="<%=cp%>/upload/${view.book_image}" width="200"
									height="300" border="0" /></td>
							</tr>
							<tr>
								<th>도서 번호</th>
								<td>${view.book_num}</td>
								<th>등록일</th>
								<td>${view.book_date}</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>${view.book_category}</td>
								<th>저자</th>
								<td>${view.book_auth}</td>
							</tr>
							<tr>
								<th>출판사</th>
								<td>${view.company_id}</td>
								<th>출판일</th>
								<td>${view.book_publish_date}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan=4>${view.book_name}</td>
							</tr>
							<tr>
								<th>가격</th>
								<td>${view.book_price}</td>
								<th>판매량</th>
								<td>${view.book_sell_count}</td>
							</tr>
							<tr>
								<th>기초 재고</th>
								<td>${view.book_base_count}</td>
								<th>현재 재고</th>
								<td>${view.book_current_count}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan=5>${view.book_content}</td>
							</tr>

							<tr>
								<th colspan=2 align=center>활성화 여부</th>
								<td class="getyn" colspan=4 align=center><c:choose>
										<c:when test="${view.book_use_yn=='0'}">비사용됨</c:when>
										<c:otherwise>사용됨</c:otherwise>
									</c:choose></td>
							</tr>
						</table>
						<div class="detail_button">
							<input class="button" type=button value="목록보기"
								onclick="javascript:location.href='<%=cp%>/admin/bookList.do?currentPage=${currentPage}'">
							<input class="button" type=button value="수정하기"
								onclick="javascript:location.href='<%=cp%>/admin/bookModify.do?book_num=${view.book_num}&currentPage=${currentPage}'">
							<input class="button" type=button value="삭제하기"
								onclick="deleteCheck(${view.book_num})" />
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<table class="review">
							<c:choose>
								<c:when test="${totalCount==0}">
									<tr>
										<td colspan=4>등록된 댓글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${review}" varStatus="stat">
										<c:url var="viewURL" value="/admin/memberDetail.do">
											<c:param name="member_id" value="${list.member_id}" />
										</c:url>
										<tr>
											<td>${list.review_num}</td>
											<td>
												<!-- member_name review에서 조인하기.. --> (<a href="${viewURL}">${list.member_id}</a>)
											</td>
											<td>${list.review_pw}</td>
											<td>${list.review_regdate}</td>
											<td rowspan="2"><input class="adminbutton" type="button" value="삭제"
												onclick="deleteCheck2(${list.review_num}, ${view.book_num})" /></td>
										</tr>
										<tr>
											<td colspan=3 style="width: 400px;">${list.review_content}</td>
											<td>${list.star_point}</td>
										</tr>
										<br>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

						<table class="paging">
							<tr>
								<td align=center colspan=8>${pagingHtml}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
</body>
</html>