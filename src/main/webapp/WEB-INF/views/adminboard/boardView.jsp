<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>질문답변 게시판</title>
<link rel="stylesheet" href="css/board.css" type="text/css" />
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
<br/>
	

	<table class="boardView" width="770" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<th width="100"><b>번호</b></th>
			<td style="height: 38px;">
				<s:property value="resultClass.board_num" />
			</td>
			
			<th width="100"><b>글쓴이</b></th>
			<td style="height: 38px;">
				<s:property value="resultClass.member_id" />
			</td>
			
			<th width="100"><b>날짜</b></th>
			<td style="height: 25px;">
				<s:property value="resultClass.board_regdate" />
			</td>
		</tr>
		<tr>
			<th width="100"><b>제목</b></th>
			<td colspan="5" width="770" style="height: 38px;">
				<s:property value="resultClass.board_title" />
			</td>
		</tr>

		<tr>
			<th width="100"><b>내용</b></th>
			<td colspan="5"width="770" style="height: 70px;">
				${resultClass.board_content }
			</td>
		</tr>
	</table>
	<div id="Bbutton">
		<s:url id="modifyURL" action="modifyForm">
			<s:param name="board_num">
				<s:property value="board_num" />
			</s:param>
		</s:url>
		<s:url id="deleteURL" action="deleteAction">
			<s:param name="board_num">
				<s:property value="board_num" />
			</s:param>
		</s:url>
					
		<s:if test = "resultClass.board_type == 2">
			<s:if test="session.member_id =='admin'">
				<input name="list" type="button" value="수정" class="Bbutton" onClick="javascript:open_win_noresizable('checkForm.do?board_num=<s:property value="resultClass.board_num" />&currentPage=<s:property value="currentPage" />','modify')">   
				<input name="list" type="button" value="삭제" class="Bbutton" onClick="javascript:open_win_noresizable('checkForm.do?board_num=<s:property value="resultClass.board_num" />&currentPage=<s:property value="currentPage" />','Delete')">
				<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='boardList.do?currentPage=<s:property value="currentPage" />'">
			</s:if>
			<s:else>
				<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='boardList.do?currentPage=<s:property value="currentPage" />'">
			</s:else>
		</s:if>
		<s:else>
			<input name="list" type="button" value="답변달기" class="Bbutton" onClick="javascript:location.href='replyForm.do?board_num=<s:property value="board_num" />'">
		  	<input name="list" type="button" value="수정" class="Bbutton" onClick="javascript:open_win_noresizable('checkForm.do?board_num=<s:property value="resultClass.board_num" />&currentPage=<s:property value="currentPage" />','modify')">   
			<input name="list" type="button" value="삭제" class="Bbutton" onClick="javascript:open_win_noresizable('checkForm.do?board_num=<s:property value="resultClass.board_num" />&currentPage=<s:property value="currentPage" />','Delete')">
			<input name="list" type="button" value="목록" class="Bbutton" onClick="javascript:location.href='boardList.do?currentPage=<s:property value="currentPage" />'">
		</s:else>
	</div>			
</body>
</html>















