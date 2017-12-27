<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var page = ${currentPage};
	function deleteCheck(id) {
		if(confirm("정말 삭제하시겠습니까?")){
			document.location.href=
				"<%=cp%>/admin/bookDelete.do?book_num=" + id + "&currentPage=" + page;
		}else{
			return false;
		}
	}
	function update(id){
		document.location.href=
			"<%=cp%>/admin/bookDetail.do?book_num=" + id+ "&currentPage=" + page;
	}

	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
	});
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
		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<!-- 검색창 영역 -->
						<form class="form-inline" method="POST">
							<table class="table">
								<tr>
									<th>기간별 검색 :</th>
									<td style="text-align: left;" colspan=2>
										<input type="text" class="form-control" name="date_min" id="datepicker" placeholder="부터">
										~ <input type="text" class="form-control" name="date_max" id="datepicker2"
											placeholder="까지">
									</td>
									<th>가격별 검색 :</th>
									<td style="text-align: left;" colspan=2>
										<input type="text" class="form-control" name="price_min" placeholder="부터">
										~ <input type="text" class="form-control" name="price_max" placeholder="까지">
									</td>
								</tr>
								<tr>
									<th>항목별 검색 :</th>
									<td colspan=3>
										<div class="input-group">
											<select name="searchNum" class="form-control col-md-3">
												<option value="0">전체</option>
												<option value="1">도서명</option>
												<option value="2">카테고리</option>
												<option value="3">저자</option>
												<option value="4">출판사</option>
											</select>
											<input class="form-control col-md-9" type="text" name="searchKeyword">
											<button class="fa fa-search" style="padding-left: 10px;"></button>
										</div>
									</td>
									<c:if test="${status eq 'all'}">
									<th>도서 구분 :</th>
									<td>
										<input type="radio" name="active" checked="checked" value="0">전체 &nbsp; <input
											type="radio" name="active" value="1">사용 도서 &nbsp; <input type="radio"
											name="active" value="2">비사용 도서
									</td>
									</c:if>
								</tr>
							</table>
						</form>
						<div class="form-group"></div>
						<table class="list-items table table-hover table-striped">
							<thead class="list-header">
								<tr>
									<th>#</th>
									<th></th>
									<th>NAME</th>
									<th>CATEGORY</th>
									<th>AUTH</th>
									<th>COMPANY</th>
									<th>가격</th>
									<th>재고</th>
									<th>도서상태</th>
									<th></th>
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
												<td class="num">${list.book_num}</td>
												<td>
													<img src="<%=cp%>/upload/${list.book_image}" width="100" height="130" border="0" />
												</td>
												<td>
													<a href="${viewURL}">${list.book_name}</a>
												</td>
												<td>${list.book_category}</td>
												<td>${list.book_auth}</td>
												<td>${list.company_id}</td>
												<td>${list.book_price}</td>
												<td><b>${list.book_current_count}</b>/${list.book_base_count}</td>
												<td>${list.book_use_yn == '1' ? '사용' : '비사용' }</td>
												<td>
													<a class="mdi mdi-grease-pencil" title="Modify"
														href="javascript:update('${list.book_num}')"></a> 
														<a class="mdi mdi-delete" title="Delete" 
														href="javascript:deleteCheck('${list.book_num}')"></a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<table class="paging">
							<tr align=center>
								<td colspan=8>${pagingHtml}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>