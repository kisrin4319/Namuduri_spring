<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				"<%=cp%> /admin/bookDelete.do?book_num=" + id + "&currentPage=" + page;
		}else{
			return false;
		}
	}
	function update(id){
		document.location.href="<%=cp%>/admin/bookDetail.do?member_id=" + id + "&currentPage=" + page;
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

		<nav class="main-navbar">
			<form class="form-inline" method="POST"
				action="/admin/default/jqadm/search/product?lang=en">
				<i class="fa more"></i>

				<div class="input-group">
					<select class="custom-select filter-key" name="filter[key][0]">
						<option value="product.label" data-type="string">
						Label					</option>
					</select> <select class="custom-select filter-operator" name="filter[op][0]">
						<option value="=~">
					=~&nbsp;&nbsp;starts with				</option>
					</select> <input type="text" class="form-control filter-value"
						name="filter[val][0]" value="">
					<button class="input-group-addon btn btn-primary fa fa-search"></button>
				</div>
			</form>
		</nav>
	</div>
	<div class="col-lg-12">
		<!-- 검색창 영역 -->
		<!-- <div class="searcharea">
				<form>
					<div class="search_input">
						<select name="searchNum" class="searchNum">
							<option value="0">ID</option>
							<option value="1">이름</option>
							<option value="2">EMAIL</option>
							<option value="3">전화번호</option>
							<option value="4">휴대폰번호</option>
							<option value="5">주민번호 앞자리</option>
						</select> <input class="searchKeyword" type="text" name="searchKeyword">
						<input class="searchbutton" name="submit" type="submit" value="검색">
					</div>
				</form>
			</div> -->
		<div class="card">
			<div class="card-block">
				<div class="table-responsive">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs profile-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#home" role="tab">전체</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#profile" role="tab">사용 도서</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#settings" role="tab">비사용 도서</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- first tab -->
						<div class="tab-pane active" id="home" role="tabpanel">
							<div class="card-block">
								<form class="list list-product" method="POST">
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
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr class="list-search">
												<td colspan=2><input class="insertButton" type=button
													value="도서 등록하기"
													onclick="javascript:location.href='<%=cp%>/admin/bookWrite.do'" />
												</td>
												<td><input class="form-control" type="text"
													name="book_name" value="" /></td>
												<td><input class="form-control" type="text"
													name="book_category" value="" /></td>
												<td><input class="form-control" type="text"
													name="book_auth" value="" /></td>
												<td><input class="form-control" type="text"
													name="book_comapny" value="" /></td>
												<td colspan=2></td>
												<td class="actions" style="vertical-align: middle;">
													<!-- <a class="fa fa-refresh" href="#" title="Reset"></a> -->
													<button type="submit" style="font-size: 20px;"
														class="fa fa-search" title="Search"></button>
												</td>
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
															<c:param name="book_num" value="${list.book_num}" />
															<c:param name="currentPage" value="${currentPage}" />
														</c:url>
														<tr>
															<td class="num">${list.book_num}</td>
															<td><img src="<%=cp%>/upload/${list.book_image}"
																width="100" height="130" border="0" /></td>
															<td><a href="${viewURL}">${list.book_name}</a></td>
															<td>${list.book_category}</td>
															<td>${list.book_auth}</td>
															<td>${list.company_id}</td>
															<td>${list.book_price}</td>
															<td><b>${list.book_current_count}</b>/${list.book_base_count}</td>
															<td><a class="mdi mdi-grease-pencil" title="Modify"
																href="javascript:update('${list.book_num}')"></a>
																<a class="mdi mdi-delete" title="Delete"
																href="javascript:deleteCheck('${list.book_num}')"></a></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</form>
								<table class="paging">
									<tr align=center>
										<td colspan=8>${pagingHtml}</td>
									</tr>
								</table>
							</div>
						</div>
						<!--second tab-->
						<div class="tab-pane" id="profile" role="tabpanel">
							<div class="card-block"></div>
						</div>
						<!-- third tab -->
						<div class="tab-pane" id="settings" role="tabpanel">
							<div class="card-block"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>