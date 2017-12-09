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
img.resize {
	width: 220px;
	height: 280px;
}

img.top2 {
	width: 104px;
	height: 104px;
}
</style>
</head>
<body>
	<div class="shopping-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
							<aside class="widget widget-categories">
								<h2 class="sidebar-title text-center">CATEGORY</h2>
								<ul class="sidebar-menu" style="text-align: left;">
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=단편소설"> <i class="fa fa-angle-double-right"></i> short story
									</a></li>
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=장편소설"> <i class="fa fa-angle-double-right"></i> feature novel
									</a></li>
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=자기계발"> <i class="fa fa-angle-double-right"></i> self-development
									</a></li>
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=시/에세이"> <i class="fa fa-angle-double-right"></i> poem & essay
									</a></li>
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=어린이(초등)"> <i class="fa fa-angle-double-right"></i> kids & schoolchild
									</a></li>
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=중/고등참고서"> <i class="fa fa-angle-double-right"></i> teenager
									</a></li>
									<li style="margin-left: 35px;"><a href="<%=cp%>/books/usedBooksList.do?book_category=취업/참고서"> <i class="fa fa-angle-double-right"></i> job applicants
									</a></li>
								</ul>
							</aside>
							<aside class="widget shop-filter">
								<h2 class="sidebar-title text-center">PRICE SLIDER</h2>
								<div class="info-widget">
									<div class="price-filter">
										<div id="slider-range"></div>
										<div class="price-slider-amount">
											<input type="text" id="price" name="price" placeholder="Add Your Price" />
											<div class="widget-buttom">
												<input type="button" value="Filter" onclick="fn_slider()" /> <input type="reset" value="CLEAR" />
											</div>
										</div>
									</div>
								</div>
							</aside>
						</div>
						<div class="shop-widget-bottom">
							<aside class="widget widget-seller">
								<h2 class="sidebar-title" style="margin-bottom: 5px;">TOP SELLERS</h2>
								<c:forEach var="top" items="${top2}">
									<div class="single-seller">
										<div class="seller-img">
											<a href="<%=cp%>/books/bookDetail.do?book_num=${top.book_num}"> <img class="top2" src="${pageContext.request.contextPath}/upload/${top.book_image}" alt="${top.book_name}" />
											</a>
										</div>
										<div class="seller-details">
											<a href="<%=cp%>/books/bookDetail.do?book_num=${top.book_num}">
												<h5>${top.book_name}</h5>
											</a>
											<h5>
												<fmt:formatNumber pattern="###,###,###" value="${top.book_price}" />
												원
											</h5>
											<ul>
												<c:if test="${top.star_point == 0}">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</c:if>
												<c:if test="${top.star_point == 1}">
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</c:if>
												<c:if test="${top.star_point == 2}">
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</c:if>
												<c:if test="${top.star_point == 3}">
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</c:if>
												<c:if test="${top.star_point == 4}">
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star"></i>
												</c:if>
												<c:if test="${top.star_point == 5}">
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
													<i class="fa fa-star icolor"></i>
												</c:if>
											</ul>
										</div>
									</div>
								</c:forEach>
							</aside>
						</div>
					</div>
				</div>
				<!-- Shop Area Start -->
				<div class="col-md-9 col-sm-9 col-xs-12">
					<h1 class="well" style="text-align: -webkit-center;">Used Book Registration Form</h1>
					<div class="col-lg-12 well">
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<!-- Search Field -->
								<form name="searchForm" method="post" action="usedBookWriteForm.do">
									<h1 class="text-center">Search Title</h1>
									<div class="form-group">
										<div class="input-group">
											<input class="form-control" type="text" name="searchKeyword" placeholder="Search" required /> <input type="hidden" name="check" value="n"> <span class="input-group-btn">
												<button class="btn btn-success" type="button" onclick="searchBook()">
													<span class="glyphicon glyphicon-search" aria-hidden="true"> <span style="margin-left: 10px;">Search</span>
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
												<li class="list-group-item"><a href="javascript:sendInfo('${list.book_num }','${list.book_name }','${list.book_category }','${list.book_price }','${list.book_image }','${list.company_id }','${list.book_auth }')">${list.book_name }</a></li>
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
											<label>BOOK NUMBER</label> <input type="text" name="book_num" placeholder="Book Number Here.." class="form-control" readonly>
										</div>
										<div class="col-sm-6 form-group">
											<label>BOOK_NAME</label> <input type="text" name="book_name" placeholder="Book Name Here.." class="form-control" readonly>
										</div>
									</div>
									<div class="form-group">
										<label>BOOK_CATEGORY</label> <input type="text" name="book_category" placeholder="Book Category Here.." class="form-control" readonly>
									</div>
									<div class="row">
										<div class="col-sm-4 form-group">
											<label>BOOK_IMAGE</label> <input type="text" name="book_image" placeholder="Book Image Here.." class="form-control" readonly> <img id="image" src="" width="200px" height="300px" style="display: block; margin-left: auto; margin-right: auto;" />
										</div>
										<div class="col-sm-4 form-group">
											<label>BOOK_AUTH</label> <input type="text" name="book_auth" placeholder="Book Auth Here.." class="form-control" readonly>
										</div>
										<div class="col-sm-4 form-group">
											<label>COMPANY_ID</label> <input type="text" name="company_id" placeholder="Company ID Here.." class="form-control" readonly>
										</div>
										<div class="col-sm-8 form-group">
											<label>ORIGIN PRICE</label> <input type="text" name="book_price" placeholder="Origin Price Here.." class="form-control" readonly>
										</div>
										<div class="col-sm-8 form-group">
											<label>NEW PRICE</label> <input type="text" name="book_new_price" placeholder="Enter New Price Here.." class="form-control">
										</div>
										<div class="col-sm-8 form-group">
											<label>BOOK_STATUS</label>
											<div class="checkbox checkbox-primary">
												<p>
													<input type="checkbox" id="used_book_status" name="used_book_status" value="최상" /> <label for="checkbox">최상</label>
												</p>
												<p>
													<input type="checkbox" id="used_book_status" name="used_book_status" value="상" /> <label for="checkbox">상</label>
												</p>
												<p>
													<input type="checkbox" id="used_book_status" name="used_book_status" value="중" /> <label for="checkbox">중</label>
												</p>
												<p>
													<input type="checkbox" id="used_book_status" name="used_book_status" value="허" /> <label for="checkbox">하</label>
												</p>
												<p>
													<input type="checkbox" id="used_book_status" name="used_book_status" value="최하" /> <label for="checkbox">최하</label>
												</p>
											</div>
										</div>
										<div class="col-sm-8 form-group">
											<label>MEMBER_ID</label> <input type="text" name="member_id" placeholder="Member Id Here.." class="form-control" value="${member_id }" readonly>
										</div>
									</div>
									<button type="submit" class="btn btn-lg btn-info">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<script type="text/javascript">
$(document).ready(function() {
    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
    $('input[type="checkbox"][name="group"]').click(function(){
        //클릭 이벤트 발생한 요소가 체크 상태인 경우
        if ($(this).prop('checked')) {
            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
            $('input[type="checkbox"][name="group"]').prop('checked', false);
            $(this).prop('checked', true);
        }
    });
});
</script>
</body>
</html>