<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>질문답변 게시판</title>

<link rel="stylesheet" href="css/board.css" type="text/css" />

<script type="text/javascript">
	function open_win_noresizable(url, member_id) {
		var oWin = window
				.open(url, member_id,
						"scrollbars=no, status=no, resizable=no, width=500, height=200");
	}
	function checkForm(board_num) {
		var bb = board_num;
		javascript: open_win_noresizable(
				'checkForm.do?board_num=' + board_num
						+ '&currentPage=<s:property value="currentPage" />',
				'type')
	}
</script>

</head>

<body>
<h2 class="cscenter_h2">고객센터</h2>
<h3 class="bul_green">질문답변 게시판</h3>

<table class="table_style02" cellspacing="0" cellpadding="0" border="0">
	<colgroup>
		<col width="86px" />
		<col width="*" />
		<col width="126px"/>
		<col width="126px"/>
	</colgroup>

	<tbody>
		<tr>
			<th scope="col" class="title">
					<p class="th_line">번호</p></th>
			<th scope="col" class="title">
					<p class="th_line">제목</p></th>
			<th scope="col" class="title">
					<p class="th_line">글쓴이</p></th>
			<th scope="col" class="th_line_none">날 짜</th>
		</tr>
			
	<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="viewAction">
			<s:param name="board_num">
				<s:property value="board_num" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr>
			<td class ="td_line_none"><s:property value="board_num" /></td>
			<td class="td_line_none align_left">
				<s:if test="re_level != 0">
					<c:forEach var="i" begin="${re_level}" end="0">&nbsp;</c:forEach>→
				</s:if>
				<s:if test="board_type ==2">
					<font size='2' color='black'><b>[공지]</b></font>
				</s:if>
				<s:if test="board_type ==1">
					<input type="hidden" id="board_num" value="<s:property value='board_num' />" />
					
					<s:if test="%{session.member_id=='admin'}">
						<s:a href="%{viewURL}">
							<s:property value="board_title" />
						</s:a>						
					</s:if>
					<s:else>
						<a href="javascript:checkForm(${board_num})">
							<font color='gray'>*비공개 글 입니다</font>
							<img src="images/common/secret.gif" />
						</a>
					</s:else>					
				</s:if>
				<s:else>
					<s:a href="%{viewURL}">
						<s:property value="board_title" />
					</s:a>
				</s:else>
				</td>
			<td class="td_line_none"><s:property value="member_id" /></td>
			<td class="td_line_none"><s:property value="board_regdate" /></td>
		</tr>
	</s:iterator>

		<s:if test="list.size() <= 0">
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다</td>
			</tr>
		</s:if>
		
		</tbody>
</table>

<table class="table_style03" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td id="search">
			<form>
			<select name="searchBdNum">
				<option value="0">글쓴이</option>
				<option value="1">제목</option>
				<option value="2">내용</option>
			</select>
			<input class="text" type="text" name="searchBdKeyword"/>
			<input name="submit" type="submit" value="검색" class="Bsearch" />
			</form>
		</td>
		<td id="Bbutton">
			<input class="Bbutton" type="button" value="글쓰기"
			onclick="javascript:location.href='writeForm.do?currentPage=<s:property value="currentPage" />';"/>
		</td>
	</tr>

	<tr>
		<td colspan="5" align="center"><s:property value="pagingHtml" escape="false" /></td>
	</tr>
</table>
		
</body>
</html>

