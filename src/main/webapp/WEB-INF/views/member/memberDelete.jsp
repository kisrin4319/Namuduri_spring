<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href ="<%=cp%>/css/style1.css" type="text/css" />
<title>회원 탈퇴</title>
<script type="text/javascript">
	function checkIn() {
		
		if($('#member_id').val() == ""){
			alert("아이디를 입력해주십시오.");
			return false;
		}
		if($('#member_pw').val() == ""){
			alert("비밀번호를 입력해주십시오.");
			return false;
		}
		else {
			$.ajax({
				url:'/namuduri/member/memberDelete.do',
	            type:'post',
	            data:$('form').serialize(),
	            success:function(result){
	            	if(result.returnVal === "1"){
	            		alert('회원 탈퇴가 정상적으로 처리되었습니다. 이용해 주셔서 감사합니다.');
	            		return false;
	            	}else {
	            		alert('아이디 또는 비밀번호가 바르지 않습니다.');
	            		return false;
	            	}
	            }
			})
		}
	}
</script>
</head>
<body>
<div id="contents">
<div class="member_content" style="width: 800px; margin-top: 30px;">
<h3 class="bul_green02">회원탈퇴</h3>
<table class="table_style01"  width="880" cellspacing="0" border="0" align="center">
	<tr>
		<td colspan="2">
			<form name="memberDelete" id="memberform" method="post" onsubmit="return checkIn();">
				<table>
					<p align="center">
						<table border="0" style="width: 980px;">
							<tr>
								<td style="width: 100px;">
										<font size="2">
											&nbsp;&nbsp;아이디
										<font size="2" color="#ff3f3f">*</font>										
									</font>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;
									<input type="text" name="member_id" id="member_id" size="20" maxlength="15"/>
								</td>
							</tr>		
							<tr>
								<td style="width: 100px;">
									<font size="2">
										&nbsp;&nbsp;비밀번호
										<font size="2" color="#ff3f3f">*</font>
									</font>
								</td>
								<td colspan="2">
									&nbsp;&nbsp;&nbsp;
									<input type="password" name="member_pw" id="member_pw" size="21"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<a href ="javascript:checkIn();"><img src="<%=cp%>/img/member/btn_ok.gif" value="회원탈퇴" class="button"/></a>
									<!-- <input type="submit" value="탈퇴"> -->
									<a href = "javascript:history.back(-1);"><img src="<%=cp%>/img/member/btn_cancel.gif" value="취소" class="button" /></a>
								</td>
							</tr>
						</table>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>
</div>
</body>

</html>