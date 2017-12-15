<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>질문답변 게시판</title>
<link rel="stylesheet" href="<%=cp%>/css/board.css" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="/resources/demos/style.css" type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function open_win_noresizable(url, member_id) {
		var oWin = window.open(url, member_id,"scrollbars=no, status=no, resizable=no, width=500, height=200");
	}
	function checkForm(board_num) {
		var bb = board_num;
		javascript: open_win_noresizable('checkForm.do?board_num=' + board_num + '&currentPage=${currentPage}&ref=${boardModel.ref }', 'type')
	}
</script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<h2 class="cscenter_h2">고객센터</h2>
	<h3 class="bul_green">질문답변 게시판</h3>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">공지사항</a></li>
			<li><a href="#tabs-2">질문답변 게시판</a></li>
			<li><a href="#tabs-3">비공개 게시판</a></li>
		</ul>
		<div id="tabs-1">
			<table class="table_style02" cellspacing="0" cellpadding="0" border="0">
				<colgroup>
					<col width="86px" />
					<col width="*" />
					<col width="126px" />
					<col width="126px" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="col" class="title">
							<p class="th_line">번호</p>
						</th>
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
							<form name="boardform" id="baordform">
								<c:forEach var="list" items="${boardList }" varStatus="stat">
									<c:url var="viewURL" value="/board/boardDetail.do">
										<c:param name="board_num" value="${list.board_num}" />
									</c:url>
									<a href="${viewURL }"></a>
									<tr>
										<td class="td_line_none">${list.board_num}</td>
										<td class="td_line_none align_left">
											<%-- <c:if test="re_level != 0">
										<c:forEach var="i" begin="${re_level}" end="0">&nbsp;</c:forEach>→
									</c:if> --%> <c:if test="${list.board_type ==2}">
												<font size='2' color='black'><b>[공지]</b><a href="${viewURL}">${list.board_title}</a></font>
											</c:if> <%-- <c:if test="${list.board_type ==1}">
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
									</c:if>--%>
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
					<td id="Bbutton"><input class="Bbutton" type="button" value="글쓰기" onclick="javascript:location.href='<%=cp%>/board/boardWrite.do'" /></td>
				</tr>
				<tr>
					<td colspan="5" align="center"><div class="paging">${pagingHtml}</div></td>
				</tr>
			</table>
		</div>
		<div id="tabs-2">
			<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
		</div>
		<div id="tabs-3">
			<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
			<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
		</div>
	</div>
</body>
</html>
