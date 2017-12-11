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
				<!--ul class="nav nav-tabs">
                           <li class="active"><a href="#">Home</a></li>
                           <li><a href="#">SVN</a></li>
                           <li><a href="#">iOS</a></li>
                           <li><a href="#">VB.Net</a></li>
                           <li><a href="#">Java</a></li>
                           <li><a href="#">PHP</a></li>
                        </ul-->
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab"> 전체 </a></li>
					<li><a href="#a" data-toggle="tab">공지사항</a></li>
					<!--li class="dropdown">
                              <a href="#" id="myTabDrop1" class="dropdown-toggle" 
                                 data-toggle="dropdown">Java 
                                 <b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                 <li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a></li>
                                 <li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
                              </ul>
                           </li-->
					<li><a href="#b" data-toggle="tab">게시판</a></li>
					<li><a href="#c" data-toggle="tab">비공개 게시판</a></li>
					<li><a href="#d" data-toggle="tab">Group D</a></li>
				
					
								
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="home">
						<div class="content_accordion">
							<div class="panel-group" id="accordion">
							
							
								<div class="container">
							
								<!-- <table class="table_style02" cellspacing="0" cellpadding="0" border="0"> -->
								<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
									<colgroup>
										<col width="86px" />
										<col width="*" />
										<col width="126px" />
										<col width="126px" />
									</colgroup>
									<tbody>
										<tr>
											<!-- <th scope="col" class="title">
												<p class="th_line">번호</p> -->
											<th>번호</th>
											<th scope="col" class="title">
												<p class="th_line">제목</p>
											</th>
											<th scope="col" class="title">
												<p class="th_line">글쓴이</p>
											</th>
											<th scope="col" class="th_line_none">날 짜</th>
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
							
								<!-- <table class="table_style02" cellspacing="0" cellpadding="0" border="0"> -->
								<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
									<colgroup>
										<col width="86px" />
										<col width="*" />
										<col width="126px" />
										<col width="126px" />
									</colgroup>
									<tbody>
										<tr>
											<!-- <th scope="col" class="title">
												<p class="th_line">번호</p> -->
											<th>번호</th>
											<th scope="col" class="title">
												<p class="th_line">제목</p>
											</th>
											<th scope="col" class="title">
												<p class="th_line">글쓴이</p>
											</th>
											<th scope="col" class="th_line_none">날 짜</th>
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
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#ps">1. Political Science </a>
										</h4>
									</div>
									<div id="ps" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#agr">2. Agriculture</a>
										</h4>
									</div>
									<div id="agr" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							
								
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="c">
						<div class="content_accordion">
							<div class="panel-group" id="gc">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gc" href="#pm">1. Pure Mathematics </a>
										</h4>
									</div>
									<div id="pm" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							
							
							</div>
						</div>
						<!--accordion end-->
					</div>
					
					
					
					<div class="tab-pane fade" id="d">
						<div class="content_accordion">
							<div class="panel-group" id="gd">
							<div class="container">
							
								<!-- <table class="table_style02" cellspacing="0" cellpadding="0" border="0"> -->
								<table class="table table-hover" cellspacing="0" cellpadding="0" border="0">
									<colgroup>
										<col width="86px" />
										<col width="*" />
										<col width="126px" />
										<col width="126px" />
									</colgroup>
									<tbody>
										<tr>
											<!-- <th scope="col" class="title">
												<p class="th_line">번호</p> -->
											<th>번호</th>
											<th scope="col" class="title">
												<p class="th_line">제목</p>
											</th>
											<th scope="col" class="title">
												<p class="th_line">글쓴이</p>
											</th>
											<th scope="col" class="th_line_none">날 짜</th>
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
															<td class="td_line_none align_left">
															<c:if test="re_level != 0">
																<c:forEach var="i" begin="${re_level}" end="0">&nbsp;</c:forEach>→
															</c:if> 
															<c:if test="${list.board_type ==2}">
																<font size='2' color='black'><b>[공지]</b><a href="${viewURL}">${list.board_title}</a></font>
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
				
				</div>
			
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	
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