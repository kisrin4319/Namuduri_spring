<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	padding: 8px;
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
	background-color: #5bc0de;
}

.points_table_scrollbar::-webkit-scrollbar-thumb {
	border-radius: 10px;
	background-color: #5bc0de;
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
	box-shadow: inset 0 3px #0CE;
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
transform:scale(1);
opacity 1;
}
}
</style>
<script type="text/javascript">
  function open_win_noresizable(url, member_id) {
    var oWin = window.open(url, member_id, "scrollbars=no, status=no, resizable=no, width=500, height=350");
  }
  function checkForm(board_num) {
    var bb = board_num;
    javascript: open_win_noresizable('checkForm.do?board_num=' + board_num + '&currentPage=${currentPage}&ref=${boardModel.ref }', 'type')
  }
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 style="text-align: -webkit-center; padding-top: 30px;">Q&A</h2>
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
					<i class="fa fa-folder-open-o"></i>
					<span>ALL</span>
				</label>
				<input id="tab2" type="radio" name="tabs">
				<label for="tab2">
					<i class="fa fa-folder-open-o"></i>
					<span>NOTICE</span>
				</label>
				<input id="tab3" type="radio" name="tabs">
				<label for="tab3">
					<i class="fa fa-folder-open-o"></i>
					<span>BOARD</span>
				</label>
				<input id="tab4" type="radio" name="tabs">
				<label for="tab4">
					<i class="fa fa-folder-open-o"></i>
					<span>SECRET</span>
				</label>
				<input id="tab5" type="radio" name="tabs">
				<label for="tab5" onclick="javascript:location.href='<%=cp%>/board/boardWrite.do'">
					<i class="fa fa-pencil-square-o"></i>
					<span style="color: #5bc0de;">WRITE</span>
				</label>
				<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" var="toDay"/>
				<section id="content1" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
						<table class="points_table" style="width: 100%">
							<tbody class="points_table_scrollbar" style="height: 500px;">
								<tr style="background-color: #5bc0de; width: 100%">
									<td class="col-md-2 col-sm-2 hidden-xs" style="color: white;">#</td>
									<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
									<td class="col-md-4 col-sm-4 col-xs-6" style="color: white;">TITLE</td>
									<td class="col-md-1 col-sm-1 col-xs-1" style="color: white;">NAME</td>
									<td class="col-md-3 col-sm-3 hidden-xs" style="color: white;">DATE</td>
								</tr>
								<c:choose>
									<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
									<c:otherwise>
										<form name="boardform" id="boardform">
											<c:forEach var="list" items="${boardList}" varStatus="stat">
												<c:url var="viewURL" value="/board/boardDetail.do">
													<c:param name="board_num" value="${list.board_num}" />
												</c:url>
												<fmt:formatDate value="${list.board_regdate }" pattern="yyyy-MM-dd" var ="RegDay"/>
												<a href="${viewURL }"></a>
												<c:if test="${stat.index % 2 ==0}">
													<tr class="odd">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<c:choose>
														<c:when test="${list.board_type == 2}">
														<td class="col-md-2 col-sm-2 col-xs-3" style="color: lightcoral; font-weight: 600;">
														</c:when>
														<c:otherwise>
														<td class="col-md-2 col-sm-2 col-xs-3">
														</c:otherwise>
														</c:choose>
															<c:if test="${list.board_type == 0}">문의</c:if>
															<c:if test="${list.board_type == 1}">
																<img src="<%=cp%>/img/secret.gif" style="margin-top: 10px;" />
															</c:if>
															<c:if test="${list.board_type == 2}">공지</c:if>
														</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<c:choose>
																<c:when test="${list.board_type ==1}">
																	<input type="hidden" id="board_num" value="${list.board_num }" />
																	<c:if test="${session.member_id=='admin'}">
																		<c:if test="${list.re_step != 0}">
																			<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																		</c:if>
																		<a href="${viewURL}">${list.board_title}</a>
																			<c:if test="${toDay eq RegDay }">
																				<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																			</c:if>																		
																	</c:if>
																	<c:if test="${session.member_id!='admin'}">
																		<c:if test="${list.re_step != 0}">
																			<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																		</c:if>
																		<a href="javascript:checkForm(${list.board_num})">
																			<font color='gray'> *비공개 글 입니다</font>
																			<c:if test="${toDay eq RegDay }">
																				<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																			</c:if>																								
																		</a>
																	</c:if>
																</c:when>
																<c:otherwise>
																	<c:if test="${list.re_step != 0}">
																		<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																	</c:if>
																	<a href="${viewURL}">${list.board_title}</a>
																	<c:if test="${toDay eq RegDay }">
																		<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																	</c:if>
																</c:otherwise>
															</c:choose>
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
														</td>
													</tr>
												</c:if>
												<c:if test="${stat.index % 2 ==1}">
													<tr class="even">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<c:choose>
														<c:when test="${list.board_type == 2}">
														<td class="col-md-2 col-sm-2 col-xs-3" style="color: lightcoral; font-weight: 600;">
														</c:when>
														<c:otherwise>
														<td class="col-md-2 col-sm-2 col-xs-3">
														</c:otherwise>
														</c:choose>
															<c:if test="${list.board_type == 0}">문의</c:if>
															<c:if test="${list.board_type == 1}">
																<img src="<%=cp%>/img/secret.gif" style="margin-top: 10px;" />
															</c:if>
															<c:if test="${list.board_type == 2}">공지</c:if>
														</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<c:choose>
																<c:when test="${list.board_type ==1}">
																	<input type="hidden" id="board_num" value="${list.board_num }" />
																	<c:if test="${session.member_id=='admin'}">
																		<c:if test="${list.re_step != 0}">
																			<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																		</c:if>
																		<a href="${viewURL}">${list.board_title}</a>
																			<c:if test="${toDay eq RegDay }">
																				<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																			</c:if>																							
																	</c:if>
																	<c:if test="${session.member_id!='admin'}">
																		<c:if test="${list.re_step != 0}">
																			<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																		</c:if>
																		<a href="javascript:checkForm(${list.board_num})">
																			<font color='gray'> *비공개 글 입니다</font>
																			<c:if test="${toDay eq RegDay }">
																				<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																			</c:if>																								
																		</a>
																	</c:if>
																</c:when>
																<c:otherwise>
																	<c:if test="${list.re_step != 0}">
																		<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																	</c:if>
																	<a href="${viewURL}">${list.board_title}</a>
																	<c:if test="${toDay eq RegDay }"> 
																	 	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																	</c:if>
																</c:otherwise>
															</c:choose>
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
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
				<!-- NOTICE TAB START  -->
				<section id="content2" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
						<table class="points_table">
							<tbody class="points_table_scrollbar" style="height: 500px;">
								<tr style="background-color: #5bc0de;">
									<td class="col-md-2 col-sm-2 hidden-xs" style="color: white;">#</td>
									<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
									<td class="col-md-4 col-sm-4 col-xs-6" style="color: white;">TITLE</td>
									<td class="col-md-1 col-sm-1 col-xs-1" style="color: white;">NAME</td>
									<td class="col-md-3 col-sm-3 hidden-xs" style="color: white;">DATE</td>
								</tr>
								<c:choose>
									<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
									<c:otherwise>
										<form name="boardform" id="boardform">
											<c:forEach var="list" items="${adminBoardList}" varStatus="stat">
												<c:url var="viewURL" value="/board/boardDetail.do">
													<c:param name="board_num" value="${list.board_num}" />
												</c:url>
												<fmt:formatDate value="${list.board_regdate }" pattern="yyyy-MM-dd" var ="RegDay"/>
												<a href="${viewURL }"></a>
												<c:if test="${stat.index % 2 ==0}">
													<tr class="odd">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<td class="col-md-2 col-sm-2 col-xs-3" style="color: lightcoral; font-weight: 600;">공지</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<a href="${viewURL}">${list.board_title}</a>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
														</td>
													</tr>
												</c:if>
												<c:if test="${stat.index % 2 ==1}">
													<tr class="even">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<td class="col-md-2 col-sm-2 col-xs-3" style="color: lightcoral; font-weight: 600;">공지</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<a href="${viewURL}">${list.board_title}</a>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
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
					<p style="text-align: center;">${pagingHtml1}</p>
				</section>
				<!-- NOTICE TAB END -->
				<!-- NORMAL TAB START -->
				<section id="content3" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
						<table class="points_table">
							<tbody class="points_table_scrollbar" style="height: 500px;">
								<tr style="background-color: #5bc0de;">
									<td class="col-md-2 col-sm-2 hidden-xs" style="color: white;">#</td>
									<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
									<td class="col-md-4 col-sm-4 col-xs-6" style="color: white;">TITLE</td>
									<td class="col-md-1 col-sm-1 col-xs-1" style="color: white;">NAME</td>
									<td class="col-md-3 col-sm-3 hidden-xs" style="color: white;">DATE</td>
								</tr>
								<c:choose>
									<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
									<c:otherwise>
										<form name="boardform" id="boardform">
											<c:forEach var="list" items="${normalBoardList}" varStatus="stat">
												<c:url var="viewURL" value="/board/boardDetail.do">
													<c:param name="board_num" value="${list.board_num}" />
												</c:url>
												<fmt:formatDate value="${list.board_regdate }" pattern="yyyy-MM-dd" var ="RegDay"/>
												<a href="${viewURL }"></a>
												<c:if test="${stat.index % 2 ==0}">
													<tr class="odd">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<td class="col-md-2 col-sm-2 col-xs-3">문의</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<c:if test="${list.board_type ==0}">
																<c:if test="${list.re_step != 0}">
																	<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																</c:if>
																<a href="${viewURL}">${list.board_title}</a>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																	
															</c:if>
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
														</td>
													</tr>
												</c:if>
												<c:if test="${stat.index % 2 ==1}">
													<tr class="even">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<td class="col-md-2 col-sm-2 col-xs-3">문의</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<c:if test="${list.board_type ==0}">
																<c:if test="${list.re_step != 0}">
																	<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																</c:if>
																<a href="${viewURL}">${list.board_title}</a>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																	
															</c:if>
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
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
					<p style="text-align: center;">${pagingHtml2}</p>
				</section>
				<!-- NORMAL BOARD END  -->
				<!-- SECRET BOARD START -->
				<section id="content4" class="tab-content" style="padding-right: 0px; padding-left: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12" style="padding-right: 0px; padding-left: 0px;">
						<table class="points_table" style="width: auto;">
							<tbody class="points_table_scrollbar" style="height: 500px;">
								<tr style="background-color: #5bc0de;">
									<td class="col-md-2 col-sm-2 hidden-xs" style="color: white;">#</td>
									<td class="col-md-2 col-sm-2 col-xs-3" style="color: white;">TYPE</td>
									<td class="col-md-4 col-sm-4 col-xs-6" style="color: white;">TITLE</td>
									<td class="col-md-1 col-sm-1 col-xs-1" style="color: white;">NAME</td>
									<td class="col-md-3 col-sm-3 hidden-xs" style="color: white;">DATE</td>
								</tr>
								<c:choose>
									<c:when test="${listCount==0 }">등록된 게시글이 없습니다.</c:when>
									<c:otherwise>
										<form name="boardform" id="boardform">
											<c:forEach var="list" items="${secretBoardList}" varStatus="stat">
												<c:url var="viewURL" value="/board/boardDetail.do">
													<c:param name="board_num" value="${list.board_num}" />
												</c:url>
												<fmt:formatDate value="${list.board_regdate }" pattern="yyyy-MM-dd" var ="RegDay"/>
												<a href="${viewURL }"></a>
												<c:if test="${stat.index % 2 ==0}">
													<tr class="odd">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<td class="col-md-2 col-sm-2 col-xs-3">
															<img src="<%=cp%>/img/secret.gif" style="margin-top: 10px;" />
														</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<input type="hidden" id="board_num" value="${list.board_num }" />
															<c:if test="${session.member_id=='admin'}">
																<c:if test="${list.re_step != 0}">
																	<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																</c:if>
																<a href="${viewURL}">${list.board_title}</a>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																	
															</c:if>
															<c:if test="${session.member_id!='admin'}">
																<c:if test="${list.re_step != 0}">
																	<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																</c:if>
																<a href="javascript:checkForm(${list.board_num})">
																	<font color='gray'> *비공개 글 입니다</font>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																		
																</a>
															</c:if>
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
														</td>
													</tr>
												</c:if>
												<c:if test="${stat.index % 2 ==1}">
													<tr class="even">
														<td class="col-md-2 col-sm-2 hidden-xs">${list.board_num}</td>
														<td class="col-md-2 col-sm-2 col-xs-3">
															<img src="<%=cp%>/img/secret.gif" style="margin-top: 10px;" />
														</td>
														<td class="col-md-4 col-sm-4 col-xs-6">
															<input type="hidden" id="board_num" value="${list.board_num }" />
															<c:if test="${session.member_id=='admin'}">
																<c:if test="${list.re_step != 0}">
																	<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																</c:if>
																<a href="${viewURL}">${list.board_title}</a>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																	
															</c:if>
															<c:if test="${session.member_id!='admin'}">
																<c:if test="${list.re_step != 0}">
																	<img src="<%=cp%>/img/reply.png" style="width: 20px; height: 17px; padding-bottom: 5px;">
																</c:if>
																<a href="javascript:checkForm(${list.board_num})">
																	<font color='gray'> *비공개 글 입니다</font>
																<c:if test="${toDay eq RegDay }">
																	<img src="<%=cp%>/img/icon_board_new.png" style="margin-bottom: 3px;">
																</c:if>																		
																</a>
															</c:if>
														</td>
														<td class="col-md-1 col-sm-1 col-xs-1">${list.member_id}</td>
														<td class="col-md-3 col-sm-3 hidden-xs">
															<fmt:formatDate value="${list.board_regdate}" pattern="yy-MM-dd" />
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
					<p style="text-align: center;">${pagingHtml3}</p>
				</section>
				<!-- SECRET BOARD END  -->
				<section id="content5" class="tab-content" style="padding-right: 0px; padding-left: 0px; height: 630px;"></section>
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