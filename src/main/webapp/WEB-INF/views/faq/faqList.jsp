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
<style type="text/css">
.content_accordion {
	margin: 20px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					FAQ 게시판
					<!--small>Statistics Overview</small-->
				</h1>
				<ul id="myTab" class="nav nav-tabs">
					<li class="active">
						<a href="#home" data-toggle="tab">전체</a>
					</li>
					<li>
						<a href="#a" data-toggle="tab">배송 문의</a>
					</li>
					<li>
						<a href="#b" data-toggle="tab">도서 문의</a>
					</li>
					<li>
						<a href="#c" data-toggle="tab">기타 문의</a>
					</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="home">
						<div class="content_accordion">
							<div class="panel-group" id="accordion">
								<div class="container">
									<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
										<colgroup>
											<col width="86px" />
											<col width="*" />
											<col width="126px" />
											<col width="126px" />
										</colgroup>
										<tbody>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>날 짜</th>
											</tr>
											<c:choose>
												<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
												<c:otherwise>
													<form name="faqform" id="faqform">
														<c:forEach var="list" items="${faqList }" varStatus="stat">
															<c:url var="viewURL" value="/faq/faqDetail.do">
																<c:param name="faq_num" value="${list.faq_num}" />
															</c:url>
															<a href="${viewURL }"></a>
															<tr>
																<td class="td_line_none">${list.faq_num}</td>
																<td class="td_line_none align_left">
																	<c:if test="${list.faq_category == 1}">
																		<font size='2' color='black'>
																			<b>[배송]</b>
																			<a href="${viewURL}">${list.faq_title}</a>
																		</font>
																	</c:if>
																	<c:if test="${list.faq_category == 2}">
																		<font size='2' color='black'>
																			<b>[도서]</b>
																			<a href="${viewURL}">${list.faq_title}</a>
																		</font>
																	</c:if>
																	<c:if test="${list.faq_category == 3}">
																		<font size='2' color='black'>
																			<b>[기타]</b>
																			<a href="${viewURL}">${list.faq_title}</a>
																		</font>
																	</c:if>
																</td>
																<td class="td_line_none">${list.member_id}</td>
																<td class="td_line_none">${list.readcount}</td>
																<td class="td_line_none">${list.faq_regdate}</td>
															</tr>
														</c:forEach>
													</form>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="a">
						<div class="content_accordion">
							<div class="panel-group" id="ga">
								<div class="container">
									<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
										<colgroup>
											<col width="86px" />
											<col width="*" />
											<col width="126px" />
											<col width="126px" />
										</colgroup>
										<tbody>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>날 짜</th>
											</tr>
											<c:choose>
												<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
												<c:otherwise>
													<form name="faqform" id="faqform">
														<c:forEach var="list" items="${AfaqList }" varStatus="stat">
															<c:url var="viewURL" value="/faq/faqDetail.do">
																<c:param name="faq_num" value="${list.faq_num}" />
															</c:url>
															<a href="${viewURL }"></a>
															<tr>
																<td class="td_line_none">${list.faq_num}</td>
																<td class="td_line_none align_left">
																	<c:if test="${list.faq_category == 1}">
																		<font size='2' color='black'>
																			<b>[배송]</b>
																			<a href="${viewURL}">${list.faq_title}</a>
																		</font>
																	</c:if>
																</td>
																<td class="td_line_none">${list.member_id}</td>
																<td class="td_line_none">${list.readcount}</td>
																<td class="td_line_none">${list.faq_regdate}</td>
															</tr>
														</c:forEach>
													</form>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="b">
						<div class="content_accordion">
							<div class="panel-group" id="gb">
								<div class="container">
									<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
										<colgroup>
											<col width="86px" />
											<col width="*" />
											<col width="126px" />
											<col width="126px" />
										</colgroup>
										<tbody>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>조회수</th>
												<th>날 짜</th>
											</tr>
											<c:choose>
												<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
												<c:otherwise>
													<form name="faqform" id="faqform">
														<c:forEach var="list" items="${BfaqList }" varStatus="stat">
															<c:url var="viewURL" value="/faq/faqDetail.do">
																<c:param name="faq_num" value="${list.faq_num}" />
															</c:url>
															<a href="${viewURL }"></a>
															<tr>
																<td class="td_line_none">${list.faq_num}</td>
																<td class="td_line_none align_left">
																	<c:if test="${list.faq_category == 2}">
																		<font size='2' color='black'>
																			<b>[도서]</b>
																			<a href="${viewURL}">${list.faq_title}</a>
																		</font>
																	</c:if>
																</td>
																<td class="td_line_none">${list.member_id}</td>
																<td class="td_line_none">${list.readcount}</td>
																<td class="td_line_none">${list.faq_regdate}</td>
															</tr>
														</c:forEach>
													</form>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="c">
						<div class="content_accordion">
							<div class="panel-group" id="gc">
								<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
									<colgroup>
										<col width="86px" />
										<col width="*" />
										<col width="126px" />
										<col width="126px" />
									</colgroup>
									<tbody>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>글쓴이</th>
											<th>조회수</th>
											<th>날 짜</th>
										</tr>
										<c:choose>
											<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
											<c:otherwise>
												<form name="faqform" id="faqform">
													<c:forEach var="list" items="${CfaqList }" varStatus="stat">
														<c:url var="viewURL" value="/faq/faqDetail.do">
															<c:param name="faq_num" value="${list.faq_num}" />
														</c:url>
														<a href="${viewURL }"></a>
														<tr>
															<td class="td_line_none">${list.faq_num}</td>
															<td class="td_line_none align_left">
																<c:if test="${list.faq_category == 3}">
																	<font size='2' color='black'>
																		<b>[기타]</b>
																		<a href="${viewURL}">${list.faq_title}</a>
																	</font>
																</c:if>
															</td>
															<td class="td_line_none">${list.member_id}</td>
															<td class="td_line_none">${list.readcount}</td>
															<td class="td_line_none">${list.faq_regdate}</td>
														</tr>
													</c:forEach>
												</form>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--accordion end-->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	<table class="table_style03" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td id="search">
				<form>
					<select name="searchNum">
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select>
					<input class="text" type="text" name="isSearch" />
					<input name="submit" type="submit" value="검색" class="Bsearch" />
				</form>
			</td>
			<c:if test="${member_id eq 'admin' }">
				<button class="btn btn-primary" onclick="location.href='<%=cp%>/faq/faqWrite.do'">글쓰기</button>
			</c:if>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<div class="paging">${pagingHtml}</div>
			</td>
		</tr>
	</table>
</body>
</html>