<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.points_table thead {
	width: 100%;
}

.points_table tbody {
	height: 562px;
	overflow-y: auto;
	width: 100%;
}

.points_table thead tr {
	width: 99%;
}

.points_table tr {
	width: 100%;
}

.points_table thead, .points_table tbody, .points_table tr,
	.points_table td, .points_table th {
	display: inline-block;
}

.points_table thead {
	background: #5bc0de;
	color: #fff;
}

.points_table tbody td, .points_table thead>tr>th {
	float: left;
	border-bottom-width: 0;
}

.points_table>tbody>tr>td, .points_table>tbody>tr>th, .points_table>tfoot>tr>td,
	.points_table>tfoot>tr>th, .points_table>thead>tr>td, .points_table>thead>tr>th
	{
	height: 50px;
	text-align: center;
	line-height: 32px;
}

.odd {
	background: #ffffff;
	color: #000;
}

.even {
	background: #efefef;
	color: #000;
}

.points_table_scrollbar {
	height: 612px;
	width: 873px;
	overflow-y: scroll;
}

.points_table_scrollbar::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.9);
	border-radius: 10px;
	background-color: #444444;
}

.points_table_scrollbar::-webkit-scrollbar {
	width: 1%;
	min-width: 5px;
	background-color: lightcoral;
}

.points_table_scrollbar::-webkit-scrollbar-thumb {
	border-radius: 10px;
	background-color: lightcoral;
	background-image: -webkit-linear-gradient(90deg, transparent, rgba(0, 0, 0, 0.4)
		50%, transparent, transparent)
}

*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}

h1 {
	color: #ccc;
	text-align: center;
}

/*Fun begins*/
.tab_container {
	width: 90%;
	margin: 0 auto;
	padding-top: 70px;
	position: relative;
}

input, section {
	clear: both;
	padding-top: 10px;
	display: none;
}

label {
	font-weight: 700;
	font-size: 18px;
	display: block;
	float: left;
	width: 20%;
	padding: 1.5em;
	color: #757575;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	background: #f0f0f0;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~
	#content3, #tab4:checked ~ #content4, #tab5:checked ~ #content5 {
	display: block;
	padding: 20px;
	background: #fff;
	color: #999;
	border-bottom: 2px solid #f0f0f0;
}

.tab_container .tab-content p, .tab_container .tab-content h3 {
	-webkit-animation: fadeInScale 0.7s ease-in-out;
	-moz-animation: fadeInScale 0.7s ease-in-out;
	animation: fadeInScale 0.7s ease-in-out;
}

.tab_container .tab-content h3 {
	text-align: center;
}

.tab_container [id^="tab"]:checked+label {
	background: #fff;
	box-shadow: inset 0 3px lightcoral;;
}

.tab_container [id^="tab"]:checked+label .fa {
	color: #0CE;
}
label .fa {
	font-size: 1.3em;
	margin: 0 0.4em 0 0;
}

/*Media query*/
@media only screen and (max-width: 930px) {
	label span {
		font-size: 14px;
	}
	label .fa {
		font-size: 14px;
	}
}

@media only screen and (max-width: 768px) {
	label span {
		display: none;
	}
	label .fa {
		font-size: 16px;
	}
	.tab_container {
		width: 98%;
	}
}

table {
	table-layout: fixed;
}

/*Content Animation*/
@
keyframes fadeInScale { 0% {
	transform: scale(0.9);
	opacity: 0;
}
100%
{
transform
:scale(1)
;


opacity
:
1;


}
}

.btn-info {
background-color: lightcoral;
border: lightcoral;
}
.btn-info:hover {
background-color: lightcoral;
border: lightcoral;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 style="text-align: -webkit-center; padding-top: 30px;">FAQ</h2>
			<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
				<li>
					<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
				</li>
				<li>
					<a title="Go to Shopping" href="<%=cp%>/books/booksList.do" style="font-style: oblique;">SHOP</a>
				</li>
			</ul>
			<hr>
			<div class="tab_container" style="padding-top: 30px;">
				<input id="tab1" type="radio" name="tabs" checked>
				<label for="tab1">
					<i class="fa fa-folder-open-o" style="color: lightcoral;"></i>
					<span>ALL</span>
				</label>
				<input id="tab2" type="radio" name="tabs">
				<label for="tab2">
					<i class="fa fa-folder-open-o" style="color: lightcoral; margin-right: 0px;"></i>
					<span>DELIVERY</span>
				</label>
				<input id="tab3" type="radio" name="tabs">
				<label for="tab3">
					<i class="fa fa-folder-open-o" style="color: lightcoral;"></i>
					<span>BOOK</span>
				</label>
				<input id="tab4" type="radio" name="tabs">
				<label for="tab4">
					<i class="fa fa-folder-open-o" style="color: lightcoral;"></i>
					<span>ETC</span>
				</label>
				<input id="tab5" type="radio" name="tabs">
				<label for="tab5">
					<c:if test="${member_id eq 'admin'}">
						<i class="fa fa-pencil-square-o" style="color: lightcoral;"></i>
						<span style="color: lightcoral;">WRITE</span>
					</c:if>
					<c:if test="${member_id ne 'admin'}">
						<i class="fa fa-folder-open-o" style="color: lightcoral;"></i>
						<span>MEMBER</span>
					</c:if>
				</label>
				<section id="content1" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
					<table class="points_table" style="width: 100%;">
						<tbody class="points_table_scrollbar" style="height: 500px;">
							<tr style="background-color: lightcoral; width: 100%;">
								<td class="col-md-1 col-sm-1 hidden-xs" align="center" style="color: white;">#</td>
								<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
								<td class="col-md-4 col-sm-4 col-xs-5" style="color: white;">TITLE</td>
								<td class="col-md-1 col-sm-1 col-xs-2" style="color: white;">NAME</td>
								<td class="col-md-2 col-sm-1 hidden-xs" style="color: white;">VIEWS</td>
								<td class="col-md-2 col-sm-3 hidden-xs" style="color: white;">DATE</td>
							</tr>
							<c:choose>
								<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
								<c:otherwise>
									<form name="faqform1" id="faqform1">
										<c:forEach var="list" items="${faqList}" varStatus="stat">
											<c:url var="viewURL" value="/faq/faqDetail.do">
												<c:param name="faq_num" value="${list.faq_num}" />
											</c:url>
											<a href="${viewURL }"></a>
											<c:if test="${stat.index % 2 ==0}">
												<tr class="odd">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">
														<c:if test="${list.faq_category == 1}">배송</c:if>
														<c:if test="${list.faq_category == 2}">도서</c:if>
														<c:if test="${list.faq_category == 3}">기타</c:if>
														<c:if test="${list.faq_category == 4}">회원</c:if>
													</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
											<c:if test="${stat.index % 2 ==1}">
												<tr class="even">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">
														<c:if test="${list.faq_category == 1}">배송</c:if>
														<c:if test="${list.faq_category == 2}">도서</c:if>
														<c:if test="${list.faq_category == 3}">기타</c:if>
													</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</form>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<p style="text-align: center;">${pagingHtml}</p>
				</section>
				<section id="content2" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
					<table class="points_table">
						<tbody class="points_table_scrollbar" style="height: 500px;">
							<tr style="background-color: lightcoral;">
								<td class="col-md-1 col-sm-1 hidden-xs" style="color: white;">#</td>
								<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
								<td class="col-md-4 col-sm-4 col-xs-5" style="color: white;">TITLE</td>
								<td class="col-md-1 col-sm-1 col-xs-2" style="color: white;">NAME</td>
								<td class="col-md-2 col-sm-1 hidden-xs" style="color: white;">VIEWS</td>
								<td class="col-md-2 col-sm-3 hidden-xs" style="color: white;">DATE</td>
							</tr>
							<c:choose>
								<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
								<c:otherwise>
									<form name="faqform2" id="faqform2">
										<c:forEach var="list" items="${AfaqList}" varStatus="stat">
											<c:url var="viewURL" value="/faq/faqDetail.do">
												<c:param name="faq_num" value="${list.faq_num}" />
											</c:url>
											<a href="${viewURL }"></a>
											<c:if test="${stat.index % 2 ==0}">
												<tr class="odd">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">배송</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
											<c:if test="${stat.index % 2 ==1}">
												<tr class="even">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">배송</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</form>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				</section>
				<!-- NOTICE TAB END -->
				<!-- NORMAL TAB START -->
				<section id="content3" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
					<table class="points_table">
						<tbody class="points_table_scrollbar" style="height: 500px;">
							<tr style="background-color: lightcoral;">
								<td class="col-md-1 col-sm-1 hidden-xs" style="color: white;">#</td>
								<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
								<td class="col-md-4 col-sm-4 col-xs-5" style="color: white;">TITLE</td>
								<td class="col-md-1 col-sm-1 col-xs-2" style="color: white;">NAME</td>
								<td class="col-md-2 col-sm-1 hidden-xs" style="color: white;">VIEWS</td>
								<td class="col-md-2 col-sm-3 hidden-xs" style="color: white;">DATE</td>
							</tr>
							<c:choose>
								<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
								<c:otherwise>
									<form name="faqform3" id="faqform3">
										<c:forEach var="list" items="${BfaqList}" varStatus="stat">
											<c:url var="viewURL" value="/faq/faqDetail.do">
												<c:param name="faq_num" value="${list.faq_num}" />
											</c:url>
											<a href="${viewURL }"></a>
											<c:if test="${stat.index % 2 ==0}">
												<tr class="odd">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">도서</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
											<c:if test="${stat.index % 2 ==1}">
												<tr class="even">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">도서</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</form>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				</section>
				<section id="content4" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
					<table class="points_table">
						<tbody class="points_table_scrollbar" style="height: 500px;">
							<tr style="background-color: lightcoral;">
								<td class="col-md-1 col-sm-1 hidden-xs" style="color: white;">#</td>
								<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
								<td class="col-md-4 col-sm-4 col-xs-5" style="color: white;">TITLE</td>
								<td class="col-md-1 col-sm-1 col-xs-2" style="color: white;">NAME</td>
								<td class="col-md-2 col-sm-1 hidden-xs" style="color: white;">VIEWS</td>
								<td class="col-md-2 col-sm-3 hidden-xs" style="color: white;">DATE</td>
							</tr>
							<c:choose>
								<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
								<c:otherwise>
									<form name="faqform4" id="faqform4">
										<c:forEach var="list" items="${CfaqList}" varStatus="stat">
											<c:url var="viewURL" value="/faq/faqDetail.do">
												<c:param name="faq_num" value="${list.faq_num}" />
											</c:url>
											<a href="${viewURL }"></a>
											<c:if test="${stat.index % 2 ==0}">
												<tr class="odd">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">기타</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
											<c:if test="${stat.index % 2 ==1}">
												<tr class="even">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">기타</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</form>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				</section>
				<section id="content5" class="tab-content" style="padding-right: 0px; padding-left: 0px; height: 630px;">
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
					<table class="points_table" style="width: 100%;">
						<tbody class="points_table_scrollbar" style="height: 500px;">
							<tr style="background-color: lightcoral;" style="width: 100%;">
								<td class="col-md-1 col-sm-1 hidden-xs" style="color: white;">#</td>
								<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
								<td class="col-md-4 col-sm-4 col-xs-5" style="color: white;">TITLE</td>
								<td class="col-md-1 col-sm-1 col-xs-2" style="color: white;">NAME</td>
								<td class="col-md-2 col-sm-1 hidden-xs" style="color: white;">VIEWS</td>
								<td class="col-md-2 col-sm-3 hidden-xs" style="color: white;">DATE</td>
							</tr>
							<c:choose>
								<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
								<c:otherwise>
									<form name="faqform5" id="faqform5">
										<c:forEach var="list" items="${DfaqList}" varStatus="stat">
											<c:url var="viewURL" value="/faq/faqDetail.do">
												<c:param name="faq_num" value="${list.faq_num}" />
											</c:url>
											<a href="${viewURL }"></a>
											<c:if test="${stat.index % 2 ==0}">
												<tr class="odd">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">기타</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
											<c:if test="${stat.index % 2 ==1}">
												<tr class="even">
													<td class="col-md-1 col-sm-1 hidden-xs">${list.faq_num}</td>
													<td class="col-md-2 col-sm-2 col-xs-3">기타</td>
													<td class="col-md-4 col-sm-4 col-xs-5">
														<a href="${viewURL}">${list.faq_title}</a>
													</td>
													<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
													<td class="col-md-2 col-sm-1 hidden-xs">${list.readcount}</td>
													<td class="col-md-2 col-sm-3 hidden-xs">
														<fmt:formatDate value="${list.faq_regdate}" pattern="yy-MM-dd" />
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</form>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				</section>
			</div>
		</div>
		<br />
		<form>
			<div class="col-md-8 col-sm-8 col-xs-12 input-group" style="margin-left: auto; margin-right: auto;">
				<div class="input-group-btn search-panel" style="padding-bottom: 10px;">
					<select class="form-control" name="searchNum" style="width: 80px; padding-left: 0px; padding-right: 0px;">
						<option value="0">작성자</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select>
				</div>
				<input type="text" class="form-control" name="isSearch" placeholder="Search.." id="isSearch" value="">
				<span class="input-group-btn" style="padding-bottom: 10px;">
					<button class="btn btn-info" type="submit">  Search  </button>
				</span>
			</div>
		</form>
	</div>
</body>
</html>