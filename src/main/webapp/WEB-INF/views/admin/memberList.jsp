<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 관리</title>
<script>
	function deleteCheck(id) {
		var page = ${currentPage};
		alert("정말 삭제하시겠습니까?");
		document.location.href="<%=cp%>
	/admin/memberDelete.do?member_id="
				+ id + "&currentPage=" + page;
	}
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Member List</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item active">Member List</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->
		<nav class="main-navbar">
			<form class="form-inline" method="POST"
				action="/admin/default/jqadm/search/product?lang=en">
				<input class="csrf-token" type="hidden" name="_token"
					value="l5mVyaZRPdp53vmVVmSSuP02irvG7LuQi76Q86Xe" /> <i
					class="fa more"></i>

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
								href="#profile" role="tab">일반 회원</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#settings" role="tab">차단 회원</a></li>
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
													<th>ID</th>
													<th>NAME</th>
													<th>주민번호</th>
													<th>전화번호</th>
													<th>EMAIL</th>
													<th>JOIN</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr class="list-search">
													<td></td>
													<td><input class="form-control" type="text"
														name="member_id" value="" /></td>
													<td><input class="form-control" type="text"
														name="member_name" value="" /></td>
													<td><input class="form-control" type="text"
														name="member_jumin1" value="" /></td>
													<td><input class="form-control" type="text"
														name="member_phone" value="" /></td>
													<td><input class="form-control" type="text"
														name="member_email" value="" /></td>
													<td class="actions" colspan=2 style="vertical-align: middle;">
														<!-- <a class="fa fa-refresh" href="#" title="Reset"></a> -->
														<button type="submit" style="font-size: 20px;"
															class="fa fa-search" title="Search"></button>
													</td>
												</tr>

												<c:choose>
													<c:when test="${listCount==0}">
														<tr align=center>
															<td colspan=8>등록된 회원이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach var="list" items="${memberList}"
															varStatus="stat">
															<!-- 아이디와 연결되는 URL -->
															<c:url var="viewURL" value="/admin/memberDetail.do">
																<c:param name="member_id" value="${list.member_id}" />
																<c:param name="currentPage" value="${currentPage}" />
															</c:url>

															<tr>
																<td>${list.member_num}</td>
																<td><a href="${viewURL}">${list.member_id}</a></td>
																<td>${list.member_name}</td>
																<td>${list.member_jumin1}-${list.member_jumin2}</td>
																<td>${list.member_email}</td>
																<td>${list.member_mobile}</td>
																<td>${list.member_join_date}</td>
																<td><a class="mdi mdi-grease-pencil" title="Modify"
																	href="javascript:location.href='<%=cp%>/admin/memberModify.do?member_id=${list.member_id}&currentPage=${currentPage}'"></a>
																	<a class="mdi mdi-delete" title="Delete"
																	href="deleteCheck('${list.member_id}')"></a></td>
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
	</div>
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>