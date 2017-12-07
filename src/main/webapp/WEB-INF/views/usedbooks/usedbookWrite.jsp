<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shop || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/usedBook.css" type="text/css">
<script type="text/javascript">
	function searchBook() {
		if (document.searchForm.searchKeyword.value == "") {
			alert("책 이름을 입력하세요.");
			return;
		}
		document.searchForm.submit();
	}

	function sendInfo(book_num, book_name, book_category, book_price, book_image, company_id, book_auth) {

		var image = "<%=cp%>/upload/"+book_image;
		
		document.writeForm.book_num.value = book_num;
		document.writeForm.book_name.value = book_name;
		document.writeForm.book_category.value = book_category;
		document.writeForm.book_price.value = book_price;
		document.writeForm.book_image.value = book_image;
		document.writeForm.company_id.value = company_id;
		document.writeForm.book_auth.value = book_auth;
		
		fn_changeImg(image);
	}
	
	function fn_changeImg(image) {		
		var c_image = document.getElementById('image');		
		c_image.src = image;		
	}
</script>
<style type="text/css">
.btn-success {
	color: #fff;
	background-color: #5bc0de;
	border-color: #46b8da;
}
</style>
</head>
<body>
	<!-- Shop Area Start -->
	<div class="container">
		<h1 class="well" style="text-align: -webkit-center;">Used Book Registration Form</h1>
		<div class="col-lg-12 well">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<!-- Search Field -->
					<form name="searchForm" method="post" action="usedBookWriteForm.do">
						<h1 class="text-center">Search Title</h1>
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" type="text" name="searchKeyword" placeholder="Search" required />
								<input type="hidden" name="check" value="n">
								<span class="input-group-btn">
									<button class="btn btn-success" type="button" onclick="searchBook()">
										<span class="glyphicon glyphicon-search" aria-hidden="true">
											<span style="margin-left: 10px;">Search</span>
										</span>
									</button>
								</span>
							</div>
						</div>
						<c:if test="${booksList eq null }">
							검색된 결과가 없습니다.
						</c:if>
						<c:if test="${booksList ne null }">
							<ul class="list-group">
								<c:forEach var="list" items="${booksList }">
									<li class="list-group-item">
										<a href="javascript:sendInfo('${list.book_num }','${list.book_name }','${list.book_category }','${list.book_price }','${list.book_image }','${list.company_id }','${list.book_auth }')">${list.book_name }</a>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</form>
					<!-- End of Search Form -->
				</div>
				<form name="writeForm" action="usedBookWrite.do" method="post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>BOOK NUMBER</label>
								<input type="text" name="book_num" placeholder="Book Number Here.." class="form-control" readonly>
							</div>
							<div class="col-sm-6 form-group">
								<label>BOOK_NAME</label>
								<input type="text" name="book_name" placeholder="Book Name Here.." class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label>BOOK_CATEGORY</label>
							<input type="text" name="book_category" placeholder="Book Category Here.." class="form-control" readonly>
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>BOOK_IMAGE</label>
								<input type="text" name="book_image" placeholder="Book Image Here.." class="form-control" readonly>
								<img id="image" src="" width="200px" height="300px" style="display: block; margin-left: auto; margin-right: auto;" />
							</div>
							<div class="col-sm-4 form-group">
								<label>BOOK_AUTH</label>
								<input type="text" name="book_auth" placeholder="Book Auth Here.." class="form-control" readonly>
							</div>
							<div class="col-sm-4 form-group">
								<label>COMPANY_ID</label>
								<input type="text" name="company_id" placeholder="Company ID Here.." class="form-control" readonly>
							</div>
							<div class="col-sm-8 form-group">
								<label>ORIGIN PRICE</label>
								<input type="text" name="book_price" placeholder="Origin Price Here.." class="form-control" readonly>
							</div>
							<div class="col-sm-8 form-group">
								<label>NEW PRICE</label>
								<input type="text" name="book_new_price" placeholder="Enter New Price Here.." class="form-control">
							</div>
							<div class="col-sm-8 form-group">
								<label>BOOK_STATUS</label>
								<input type="text" name="used_book_status" placeholder="Enter Book Status Here.." class="form-control">
							</div>
							<div class="col-sm-8 form-group">
								<label>MEMBER_ID</label>
								<input type="text" name="member_id" placeholder="Member Id Here.." class="form-control" value="${member_id }" readonly>
							</div>
						</div>
						<button type="submit" class="btn btn-lg btn-info">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
</body>
</html>