<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">CHART</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<li class="breadcrumb-item active">Book Chart</li>
				</ol>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<div class="card-block">
							<label class="h4">최근 7일 판매량 기준 도서 판매 순위</label>
							<div class="row">
								<div class="row col-lg-12">
									<c:forEach var="list" items="${weekBookSelling}" varStatus="stat" begin="0" end="3" step="1">
										<div class="col col-lg-3">
											<div class="single-banner">
												<div class="product-wrapper">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}"
														class="single-banner-image-wrapper"> 
														<img src="<%=cp%>/upload/${list.book_image}">
													</a>
												</div>
												<div class="banner-bottom text-center">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}">${list.book_name} </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="row col-lg-12">
									<c:forEach var="list" items="${weekBookSelling}" varStatus="stat" begin="4" end="7" step="1">
										<div class="col col-lg-3">
											<div class="single-banner">
												<div class="product-wrapper">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}"
														class="single-banner-image-wrapper"> <img alt=""
														src="<%=cp%>/upload/${list.book_image}">
													</a>
												</div>
												<div class="banner-bottom text-center">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}">${list.book_name} </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="card-block">
							<label class="h4">저번 달 판매량 기준 도서 판매 순위</label>
							<div class="row">
								<div class="row col-lg-12">
									<c:forEach var="list" items="${monthBookSelling}" varStatus="stat" begin="0" end="3"
										step="1">
										<div class="col col-lg-3">
											<div class="single-banner">
												<div class="product-wrapper">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}"
														class="single-banner-image-wrapper"> <img alt=""
														src="<%=cp%>/upload/${list.book_image}">
													</a>
												</div>
												<div class="banner-bottom text-center">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}">${list.book_name} </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="row col-lg-12">
									<c:forEach var="list" items="${monthBookSelling}" varStatus="stat" begin="4" end="7"
										step="1">
										<div class="col col-lg-3">
											<div class="single-banner">
												<div class="product-wrapper">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}"
														class="single-banner-image-wrapper"> <img alt=""
														src="<%=cp%>/upload/${list.book_image}">
													</a>
												</div>
												<div class="banner-bottom text-center">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}">${list.book_name} </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="card-block">
							<label class="h4">전체 판매량 기준 도서 판매 순위</label>
							<div class="row">
								<div class="row col-lg-12">
									<c:forEach var="list" items="${bookSelling}" varStatus="stat" begin="0" end="3"
										step="1">
										<div class="col col-lg-3">
											<div class="single-banner">
												<div class="product-wrapper">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}"
														class="single-banner-image-wrapper"> <img alt=""
														src="<%=cp%>/upload/${list.book_image}">
													</a>
												</div>
												<div class="banner-bottom text-center">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}">${list.book_name} </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="row col-lg-12">
									<c:forEach var="list" items="${bookSelling}" varStatus="stat" begin="4" end="7"
										step="1">
										<div class="col col-lg-3">
											<div class="single-banner">
												<div class="product-wrapper">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}"
														class="single-banner-image-wrapper"> <img alt=""
														src="<%=cp%>/upload/${list.book_image}">
													</a>
												</div>
												<div class="banner-bottom text-center">
													<a href="<%=cp%>/admin/bookDetail.do?book_num=${list.book_num}">${list.book_name} </a>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

	</div>
	<footer class="footer"> © 2017 Material Pro Admin by wrappixel.com </footer>
</body>
</html>