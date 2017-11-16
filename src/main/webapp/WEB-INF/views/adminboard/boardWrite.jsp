<%@ page contentType="text/html; charset=UTF-8"%>
<% String cp = request.getContextPath(); %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>질문답변 게시판</title>
<link rel="stylesheet" href="css/board.css" type="text/css" />
<script type="text/javascript">
	function validation() {

		var frm = document.regForm;

		if (frm.board_title.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		}

		else if (frm.member_id.value == "") {
			alert("이름을 입력해주세요.");
			return false;
		}

		else if (frm.board_pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		else if (frm.board_content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}

		return true;
	}
</script>
</head>

<body>
	<style type="text/css">
#fon {
	font-size: 8pt;
	font-weight: bolder;
}
</style>

	<br>
		<h2 class="cscenter_h2">고객센터</h2>
	<h3 class="bul_green">질문답변 게시판</h3>
	<br> <s:if test="resultClass == NULL">
			<form action="writeAction.do" name="regForm" method="post"
				enctype="multipart/form-data" onsubmit="return validation();">
		</s:if> <s:elseif test="reply">
			<form action="replyAction.do" name="regForm" method="post"
				enctype="multipart/form-data" onsubmit="return validation();">
				<s:hidden name="ref" value="%{resultClass.ref}" />
				<s:hidden name="re_level" value="%{resultClass.re_level}" />
				<s:hidden name="re_step" value="%{resultClass.re_step}" />
		</s:elseif> <s:else>
			<form action="modifyAction.do" name="regForm" method="post"
				enctype="multipart/form-data" onsubmit="return validation();">
				<s:hidden name="board_num" value="%{resultClass.board_num}" />
				<s:hidden name="currentPage" value="%{currentPage}" />
		</s:else>

		<table class="boardWrite" width="770" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="6" id="fon" style="height: 25px;"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
			</tr>
			<tr style="height: 30px;">
				<th>게시글 타입</th>
				<td><select name="board_type">
						<s:if test="%{session.member_id=='admin'}">
							<option value="0">공개글</option>
							<option value="1">비공개 글</option>
							<option value="2">공지사항</option>
						</s:if>
						<s:else>
							<option value="0">공개글</option>
							<option value="1">비공개 글</option>
						</s:else>
				</select></td>

				<th><font color="#FF0000">*</font>이름</th>
				<td><s:textfield name="member_id" theme="simple" value="%{resultClass.member_id}"
						cssStyle="width:150px; height: 18px;" maxlength="20" /></td>
				<th><font color="#FF0000">*</font> 비밀번호</th>
				<td><s:textfield name="board_pw" theme="simple" value="%{resultClass.board_pw}"
						cssStyle="width:150px; height: 18px;" maxlength="20" /></td>
			</tr>
			<tr>
				<th height="30"><font color="#FF0000">*</font>제목</th>
				<td colspan="5" width="770" bgcolor="#FFFFFF">
				<s:textfield name="board_title" theme="simple" value="%{resultClass.board_title}"
					cssStyle="width:600px; height:20px;" maxlength="50" /></td>
			</tr>


			<tr>
				<th bgcolor="#F4F4F4"><font color="#FF0000">*</font> 내용</th>
				<td colspan="5" bgcolor="#FFFFFF"><s:textarea
						name="board_content" theme="simple"
						value="%{resultClass.board_content}" cols="100" rows="17" /></td>
			</tr>

		</table>
		<div id="Bbutton">
			<input name="submit" type="submit" value="작성완료" class="Bbutton" /> 
			<input name="list" type="button" value="목록" class="Bbutton" onclick="javascript:location.href='boardList.do'" />
		</div>
	</form>
	<br></br>
</body>
</html>