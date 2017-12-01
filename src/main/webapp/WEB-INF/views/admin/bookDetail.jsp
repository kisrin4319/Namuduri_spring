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
		<div class="row">
			<div class="col-lg-12">
				<h3>Book Information</h3>
				<div class="card">
					<div class="card-block">
						<form class="form-horizontal form-material">
							<div class="row">
								<div class="col-lg-4" style="margin: auto; text-align: center;">
									<img class="img-fluid" src="<%=cp%>/upload/${view.book_image}" />
								</div>
								<div class="col-lg-8">
									<div class="form-group"></div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-4">
													<b>#</b> ${view.book_num}
												</div>
												<div class="col-md-8">
													${view.book_date} <b>등록</b>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-12">Book Name</label>
										<div class="col-md-12">
											<input type="text" class="form-control form-control-line"
												value="${view.book_name}">
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">Category</label>
												<div class="col-md-12">
													<input type="text" value="${view.book_category}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">Author</label>
												<div class="col-md-12">
													<input type="text" value="${view.book_auth}"
														class="form-control form-control-line">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">Company</label>
												<div class="col-md-12">
													<input type="text" value="${view.company_id}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">Publish Date</label>
												<div class="col-md-12">
													<input type="text" value="${view.book_publish_date}"
														class="form-control form-control-line">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-3">
												<label class="col-md-12">Price</label>
												<div class="col-md-12">
													<input type="text" value="${view.book_price}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-md-12"><b>판매량</b></label>
												<div class="col-md-12">
													<input type="text" value="${view.book_sell_count}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-md-12"><b>현재 재고</b></label>
												<div class="col-md-12">
													<input type="text" value="${view.book_current_count}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-md-12"><b>기초 재고</b></label>
												<div class="col-md-12">
													<input type="text" value="${view.book_base_count}"
														class="form-control form-control-line">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-12">Content</label>
								<div class="form-group"></div>
								<div class="col-md-12">
									<textarea rows="20" class="form-control form-control-line">${view.book_content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12" style="text-align: center;">
									<div class="row">
										<label class="col-sm-4"><b>활성화
												여부</b></label>
										<div class="col-sm-8">
											<input type="radio" name="book_use_yn" id="book_use_yn"
												value="1"
												${view.book_use_yn == '1' ? 'checked="checked"' : '' }>사용
											<input type="radio" name="book_use_yn" id="book_use_yn"
												value="0"
												${view.book_use_yn == '0' ? 'checked="checked"' : '' }>비사용
										</div>
									</div>

								</div>
							</div>
							<div class="form-group"></div>
							<div class="form-group">
								<div class="col-sm-12" style="text-align: center;">
									<button class="btn btn-warning"
										onclick="javascript:location.href='<%=cp%>/admin/bookModify.do?book_num=${view.book_num}&currentPage=${currentPage}'">Update
										Profile</button>&nbsp;
									<button class="btn btn-danger"
										onclick="deleteCheck(${view.book_num})">Delete
										Profile</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<h3>Book Review</h3>
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<table class="table list-items review">
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
												<td rowspan="2">
													<a class="mdi mdi-delete" title="Delete" onclick="deleteCheck2(${list.review_num}, ${view.book_num})"></a>
												</td>
											</tr>
											
										<tr>
											<td colspan=3 style="width: 400px;">${list.review_content}</td>
											<td>${list.star_point}</td>
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