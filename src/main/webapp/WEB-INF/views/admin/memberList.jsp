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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
var page = ${currentPage};
function deleteCheck(id) {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.location.href=
			"<%=cp%>/admin/memberDelete.do?member_id=" + id + "&currentPage=" + page;
	}else{
		return false;
	}
}
function update(id){
	document.location.href=
		"<%=cp%>/admin/memberInfo.do?member_id=" + id+ "&currentPage=" + page;
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
				<h3 class="text-themecolor">Member List</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<%=cp%>/admin/main.do">Home</a></li>
					<li class="breadcrumb-item active">Member List</li>
				</ol>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

		<div class="col-lg-12">
			<div class="card">
				<!-- 사용 방법 도움말 같은거 추가해야겠다.. -->
				<div class="card-block">
					<div class="table-responsive">
						<!-- 상세 검색 -->
						<form class="form-inline" method="POST">
						<table class="table">
							<tr>
								<th>기간별 검색 : </th>
								<td style="text-align:left;">
								<input type="text" class="form-control" name="date_min" id="datepicker" placeholder="부터"> ~ 
								<input type="text" class="form-control" name="date_max" id="datepicker2" placeholder="까지"></td>
								<td><label style="float:left;">회원 구분 : </label>
								<input type="radio" name="active" checked="checked" value="0">전체 &nbsp;
								<input type="radio" name="active" value="1">활성화 회원 &nbsp;
								<input type="radio" name="active" value="2">차단된 회원</td>
							</tr>
							<tr>
								<th>항목별 검색 : </th>
								<td><div class="input-group">
									<select name="searchNum" class="form-control col-md-3">
										<option value="0">전체</option>
										<option value="1">ID</option>
										<option value="2">이름</option>
										<option value="3">EMAIL</option>
										<option value="4">전화번호</option>
										<option value="5">주민번호</option>
									</select> <input class="form-control col-md-9" type="text"
										name="searchKeyword">
									<button class="fa fa-search" style="padding-left: 10px;"></button>
								</div></td>
								<td></td>
							</tr>
						</table>
						</form>
						<div class="form-group"></div>
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
										<c:forEach var="list" items="${memberList}" varStatus="stat">
											<!-- 아이디와 연결되는 URL -->
											<c:url var="viewURL" value="/admin/memberInfo.do">
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
													href="javascript:update('${list.member_id}')"></a> <a
													class="mdi mdi-delete" title="Delete"
													href="javascript:deleteCheck('${list.member_id}')"></a></td>
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
	<footer class="footer"> © 2017 Material Pro Admin by
		wrappixel.com </footer>
</body>
</html>