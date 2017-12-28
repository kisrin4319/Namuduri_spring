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
var page = ${currentPage};
var stat = '${status}';

function updateCheck(){
	if(confirm("변경 사항을 저장하시겠습니까?")){
		var frm = document.bookForm;
		frm.action = "<%=cp%>/admin/bookDetail.do?currentPage="+page;
		frm.submit();
	}else{
		return false;
	}
}
function deleteCheck(id) {
	if(confirm("정말 삭제하시겠습니까?")){
		document.location.href="<%=cp%>/admin/bookDelete.do?status="+stat+"&book_num="+id+"&currentPage="+page;
	}else{
		return false;
	}
}
function deleteCheck2(id) {
	var page2 = ${reviewPage};
	var num = ${view.book_num}
	if(confirm("정말 삭제하시겠습니까?")){
		document.location.href="<%=cp%>/admin/reviewDelete.do?status="+stat+"&review_num="+id+"&book_num="+num+"&currentPage="+page2;
	}else{
		return false;
	}
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
					<c:choose>
						<c:when test="${view.book_num==0}">
							<li class="breadcrumb-item active">Book Write</li>
						</c:when>
						<c:otherwise>
							<li class="breadcrumb-item"><a href="<%=cp%>/admin/bookList/${status}.do">Book List</a></li>
							<li class="breadcrumb-item active">Book Detail</li>
						</c:otherwise>
					</c:choose>
				</ol>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>Book Information</h3>
				<div class="card">
					<div class="card-block">
						<form class="form-horizontal form-material" name="bookForm" method="POST" onsubmit="return updateCheck()" enctype="multipart/form-data">
							<input type="hidden" name="book_num" value="${view.book_num }" />
							<div class="row">
								<div class="col-lg-4" style="margin: auto; text-align: center;">
									<c:if test="${view.book_num==0}">
										<input type="file" class="fileinput" name="book_image"/>
										<input type="hidden" name="book_image" value="">
									</c:if>
									<c:if test="${view.book_num!=0}">
										<div class="col-sm-10"><img class="img-fluid" src="<%=cp%>/upload/${view.book_image}" /></div>
										<input type="hidden" name="book_image" value="${view.book_image}">
										<div class="col-sm-2"><input type="file" class="fileinput" name="book_image"/></div>
									</c:if>
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
											<input type="text" name="book_name" class="form-control form-control-line"
												value="${view.book_name}">
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-6">
												<label class="col-md-6">Category</label>
												<div class="col-md-12">
													<input type="text" name="book_category" value="${view.book_category}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">Author</label>
												<div class="col-md-12">
													<input type="text" name="book_auth" value="${view.book_auth}"
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
													<input type="text" name="company_id" value="${view.company_id}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-md-6">Publish Date</label>
												<div class="col-md-12">
													<input type="text" name="book_publish_date" value="${view.book_publish_date}"
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
													<input type="text" name="book_price" value="${view.book_price}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-md-12"><b>판매량</b></label>
												<div class="col-md-12">
													<input type="text" name="book_sell_count" value="${view.book_sell_count}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-md-12"><b>현재 재고</b></label>
												<div class="col-md-12">
													<input type="text" name="book_current_count" value="${view.book_current_count}"
														class="form-control form-control-line">
												</div>
											</div>
											<div class="col-md-3">
												<label class="col-md-12"><b>기초 재고</b></label>
												<div class="col-md-12">
													<input type="text" name="book_base_count" value="${view.book_base_count}"
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
									<textarea rows="20" name="book_content" class="form-control form-control-line">${view.book_content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12" style="text-align: center;">
									<div class="row">
										<label class="col-sm-4"><b>활성화 여부</b></label>
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
									<c:choose>
										<c:when test="${view.book_num==0}">
											<button class="btn btn-success">Write</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-warning">Update</button>
											&nbsp;
											<a class="btn btn-danger"
												href="javascript:deleteCheck(${view.book_num})">Delete</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${view.book_num!=0}">
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
											<c:param name="status" value="all"/>
											<c:param name="member_id" value="${list.member_id}" />
										</c:url>
										<tr>
											<td>${list.review_num}</td>
											<td>
												<!-- member_name review에서 조인하기.. --> (<a href="${viewURL}">${list.member_id}</a>)
											</td>
											<td>${list.review_pw}</td>
											<td>${list.review_regdate}</td>
											<td rowspan="2"><a class="mdi mdi-delete" title="Delete"
												href="javascript:deleteCheck2(${list.review_num})"></a></td>
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
		</c:if>
	</div>
</body>
</html>