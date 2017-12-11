<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String cp = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html class="no-js" lang="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>질문답변 게시판</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/venobox/venobox.css" type="text/css" media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/preview.css" type="text/css" media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/checkBox.css">
<!-- modernizr css -->
<script src="<%=cp%>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>

<style type="text/css">
.content_accordion {
	margin: 20px;
}
</style>
<script type="text/javascript">
	function open_win_noresizable(url, member_id) {
		var oWin = window.open(url, member_id,"scrollbars=no, status=no, resizable=no, width=500, height=200");
	}
	function checkForm(board_num) {
		var bb = board_num;
		javascript: open_win_noresizable('checkForm.do?board_num=' + board_num + '&currentPage=${currentPage}&ref=${boardModel.ref }','type')
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					질문답변 게시판
					<!--small>Statistics Overview</small-->
				</h1>
				
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab"> 전체 </a></li>
					<li><a href="#a" data-toggle="tab">공지사항</a></li>
					<li><a href="#b" data-toggle="tab">게시판</a></li>
					<li><a href="#c" data-toggle="tab">비공개 게시판</a></li>
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
											<th>날 짜</th>
										</tr>
										<c:choose>
											<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
											<c:otherwise>
												<form name="boardform" id="boardform">
													<c:forEach var="list" items="${boardList }" varStatus="stat">
														<c:url var="viewURL" value="/board/boardDetail.do">
															<c:param name="board_num" value="${list.board_num}" />
														</c:url>
														<a href="${viewURL }"></a>
														<tr>
															<td class="td_line_none">${list.board_num}</td>
															<td class="td_line_none align_left"><c:if test="re_level != 0">
																	<c:forEach var="i" begin="${re_level}" end="0">&nbsp;</c:forEach>→
															</c:if> <c:if test="${list.board_type ==2}">
																	<font size='2' color='black'><b>[공지]</b><a href="${viewURL}">${list.board_title}</a></font>
																</c:if> <c:if test="${list.board_type ==1}">
																	<input type="hidden" id="board_num" value="${list.board_num }" />
																	<c:if test="${session.member_id=='admin'}">
																		<a href="${viewURL}">${list.board_title}</a>
																	</c:if>
																	<c:if test="${session.member_id!='admin'}">
																		<c:if test="${list.re_step != 0}">
																			<c:forEach var="i" begin="${re_level}" end="0">[답변]</c:forEach>
																		</c:if>
																		<a href="javascript:checkForm(${list.board_num})"> <font color='gray'>*비공개 글 입니다</font> <img src="images/common/secret.gif" />
																		</a>
																	</c:if>
																</c:if> <c:if test="${list.board_type ==0}">
																	<a href="${viewURL}">${list.board_title}</a>
																</c:if></td>
															<td class="td_line_none">${list.member_id}</td>
															<td class="td_line_none">${list.board_regdate}</td>
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
											<th>날 짜</th>
										</tr>
										<c:choose>
											<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
											<c:otherwise>
												<form name="boardform" id="boardform">
													<c:forEach var="list" items="${adminBoardList }" varStatus="stat">
														<c:url var="viewURL" value="/board/boardDetail.do">
															<c:param name="board_num" value="${list.board_num}" />
														</c:url>
														<a href="${viewURL }"></a>
														<tr>
															<td class="td_line_none">${list.board_num}</td>
															<td class="td_line_none align_left"> 
															<c:if test="${list.board_type ==2}">
																	<font size='2' color='black'><b>[공지]</b><a href="${viewURL}">${list.board_title}</a></font>
															</c:if> 
															</td>
															<td class="td_line_none">${list.member_id}</td>
															<td class="td_line_none">${list.board_regdate}</td>
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
											<th>날 짜</th>
										</tr>
										<c:choose>
											<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
											<c:otherwise>
												<form name="boardform" id="boardform">
													<c:forEach var="list" items="${normalBoardList }" varStatus="stat">
														<c:url var="viewURL" value="/board/boardDetail.do">
															<c:param name="board_num" value="${list.board_num}" />
														</c:url>
														<a href="${viewURL }"></a>
														<tr>
															<td class="td_line_none">${list.board_num}</td>
															
															<td class="td_line_none align_left">
															
																<c:if test="${list.board_type ==0}">
																	<a href="${viewURL}">${list.board_title}</a>
																</c:if>
															</td>
															
															<td class="td_line_none">${list.member_id}</td>
															<td class="td_line_none">${list.board_regdate}</td>
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
											<th>날 짜</th>
										</tr>
										<c:choose>
											<c:when test="${listCount==0 }">
												등록된 게시글이 없습니다.
											</c:when>
											<c:otherwise>
												<form name="boardform" id="boardform">
													<c:forEach var="list" items="${secretBoardList }" varStatus="stat">
														<c:url var="viewURL" value="/board/boardDetail.do">
															<c:param name="board_num" value="${list.board_num}" />
														</c:url>
														<a href="${viewURL }"></a>
														<tr>
															<td class="td_line_none">${list.board_num}</td>
															
															<td class="td_line_none align_left"> 
															<c:if test="re_level != 0">
																<c:forEach var="i" begin="${re_level}" end="0">&nbsp;</c:forEach>→
															</c:if> 
															<c:if test="${list.board_type ==1}">
																<input type="hidden" id="board_num" value="${list.board_num }" />
																<c:if test="${session.member_id=='admin'}">
																	<a href="${viewURL}">${list.board_title}</a>
																</c:if>
																<c:if test="${session.member_id!='admin'}">
																	<c:if test="${list.re_step != 0}">
																		<c:forEach var="i" begin="${re_level}" end="0">[답변]</c:forEach>
																	</c:if>
																	<a href="javascript:checkForm(${list.board_num})"> <font color='gray'>*비공개 글 입니다</font> <img src="images/common/secret.gif" />
																	</a>
																</c:if>
															</c:if> 
															<c:if test="${list.board_type ==0}">
																<a href="${viewURL}">${list.board_title}</a>
															</c:if>
															</td>
															
															<td class="td_line_none">${list.member_id}</td>
															<td class="td_line_none">${list.board_regdate}</td>
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
						<option value="0">글쓴이</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select> <input class="text" type="text" name="isSearch" /> <input name="submit" type="submit" value="검색" class="Bsearch" />
				</form>
			</td>
			<%-- <td id="Bbutton"><input class="Bbutton" type="button" value="글쓰기" onclick="javascript:location.href='<%=cp%>/board/boardWrite.do'" /></td>
									 --%>
			<button class="btn btn-primary" onclick="location.href='<%=cp%>/board/boardWrite.do'">글쓰기</button>
		</tr>
		<tr>
			<td colspan="5" align="center"><div class="paging">${pagingHtml}</div></td>
		</tr>
	</table>
	
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="<%=cp%>/bootstrap/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="<%=cp%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="<%=cp%>/bootstrap/js/owl.carousel.min.js"></script>
	<!-- jquery-ui js -->
	<script src="<%=cp%>/bootstrap/js/jquery-ui.min.js"></script>
	<!-- jquery Counterup js -->
	<script src="<%=cp%>/bootstrap/js/jquery.counterup.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/waypoints.min.js"></script>
	<!-- jquery countdown js -->
	<script src="<%=cp%>/bootstrap/js/jquery.countdown.min.js"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="<%=cp%>/bootstrap/venobox/venobox.min.js"></script>
	<!-- jquery Meanmenu js -->
	<script src="<%=cp%>/bootstrap/js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="<%=cp%>/bootstrap/js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- scrollUp JS -->
	<script src="<%=cp%>/bootstrap/js/jquery.scrollUp.min.js"></script>
	<!-- plugins js -->
	<script src="<%=cp%>/bootstrap/js/plugins.js"></script>
	<!-- Nivo slider js -->
	<script src="<%=cp%>/bootstrap/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="<%=cp%>/bootstrap/lib/home.js" type="text/javascript"></script>
	<!-- main js -->
	<script src="<%=cp%>/bootstrap/js/main.js"></script>
</body>
</html>