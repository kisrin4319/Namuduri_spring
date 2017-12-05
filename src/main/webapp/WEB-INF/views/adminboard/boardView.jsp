<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질문답변 게시판</title>
<link rel="stylesheet" href="<%=cp %>/css/board.css" type="text/css" />
<script type="text/javascript">
	function open_win_noresizable(url, member_id)
	{
		var oWin = window.open(url, member_id, "scrollbars=no, status=no, resizable=no, width=500, height=200");
	}
</script>
</head>
<body>
	<h2 class="cscenter_h2">고객센터</h2>
	<h3 class="bul_green">질문답변 게시판</h3>
	<br />
	<table class="boardView" width="770" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th width="100"><b>번호</b></th>
			<td style="height: 38px;">${boardModel.board_num}</td>
			<th width="100"><b>글쓴이</b></th>
			<td style="height: 38px;">${boardModel.member_id}</td>
			<th width="100"><b>날짜</b></th>
			<td style="height: 25px;">${boardModel.board_regdate}</td>
		</tr>
		<tr>
			<th width="100"><b>제목</b></th>
			<td colspan="5" width="770" style="height: 38px;">${boardModel.board_title}</td>
		</tr>
		<tr>
			<th width="100"><b>내용</b></th>
			<td colspan="5" width="770" style="height: 70px;">${boardModel.board_content }</td>
		</tr>
	</table>
	<div id="Bbutton">
		<c:url var="modifyURL" value="modifyForm">
			<c:param name="board_num" value="board_num" />
		</c:url>
		<c:url var="deleteURL" value="/board/boardDelete.do">
			<c:param name="board_num" value="board_num" />
		</c:url>
		
		<!-- 0번 비공개,1번 일반글,2번 공지사항 -->
		<c:if test="${ boardModel.board_type == 2}">
			<c:if test="${member_id eq 'admin'}">
				<input name="list" type="button" value="수정" class="Bbutton" onClick="javascript:open_win_noresizable('<%=cp%>/board/checkForm.do?board_num=${boardModel.board_num}&currentPage=${currentPage}&ref=${boardModel.ref }','modify')">
				<input name="list" type="button" value="삭제" class="Bbutton" onClick="javascript:open_win_noresizable('<%=cp%>/board/checkForm.do?board_num=${boardModel.board_num}&currentPage=${currentPage}&ref=${boardModel.ref }','Delete')">
				<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='<%=cp%>/board/boardList.do?currentPage=${currentPage}'">
			</c:if>
			<c:if test="${member_id ne 'admin'}">
				<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='<%=cp%>/board/boardList.do?currentPage=${currentPage}'">
			</c:if>
		</c:if>
		<c:if test="${boardModel.board_type != 2}">
			<%-- <c:when test="${boardModel.re_step == 1 }">
				<input name="list" type="button" value="삭제" class="Bbutton" onClick="javascript:open_win_noresizable('<%=cp%>/board/checkForm.do?board_num=${boardModel.board_num}&currentPage=${currentPage}&ref=${boardModel.ref }','Delete')">
			</c:when> --%>
				
						
			<input name="list" type="button" value="답변달기" class="Bbutton" onClick="javascript:location.href='<%=cp%>/board/replyForm.do?board_num=${boardModel.board_num}&ref=${boardModel.ref }&re_step=${boardModel.re_step }'">
			<input name="list" type="button" value="수정" class="Bbutton" onClick="javascript:open_win_noresizable('<%=cp%>/board/checkForm.do?board_num=${boardModel.board_num}&currentPage=${currentPage}&ref=${boardModel.ref }','modify')">
			<input name="list" type="button" value="삭제" class="Bbutton" onClick="javascript:open_win_noresizable('<%=cp%>/board/checkForm.do?board_num=${boardModel.board_num}&currentPage=${currentPage}&ref=${boardModel.ref }','Delete')">
			<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='<%=cp%>/board/boardList.do?currentPage=${currentPage}'">
		</c:if>
	</div>
</body>
</html>
