<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<link rel = "stylesheet" href ="<%=cp%>/css/style1.css" type="text/css" />
>>>>>>> e9cc1ccc9c1bd2461238f630d4cfc2bffe8c1a32
<script language="javascript">
function submit() {
	var fw = document.findpwform;
	
	if(fw.member_id.value ==""){
		alert("아이디를 입력해주세요.")
		fw.member_id.focus();
	}
	else if(fw.member_email.value ==""){
		alert("이메일을 입력해주세요.");
		fw.member_email.focus();
	}
	else {
		$.ajax({
			url:'/namuduri/member/memberPwFind.do',
            type:'post',
            data:$('form').serialize(),
            success:function(result){
            	if(result.returnVal == '1'){
            		alert('당신의 비밀번호는' + result.member_pw + '입니다.');
            		return false;
            	}else {
            		alert('아이디 또는 이메일이 바르지 않습니다.');
            		return false;
            	}
            }
		})
	}
}
</script>
</head>
<body scroll="" style ="overflow-x:hidden">
	<div id ="popup_type01" style ="width:600px;">
		<div class ="popup_shadow">
			<div class ="popup_wrap">
				<div class ="tit">
					<h1 class ="title_h_cartlist">비밀번호 찾기</h1>
				</div>				
				<div class ="popup_container">
					<form action="memberPwFind.do" id="findpwform" name="findpwform" method="post">
					<table width="500" border="0" cellpadding="0" cellspacing="0" class="zip">
				<tr>
					<td align="left"><h4>아이디</h4> 
						<input type="text" name="member_id" maxlength="10">
					</td>
				</tr>
				<br />
				<tr>
					<td align="left"><h4>E-mail</h4> 
						<input type="text" name="member_email">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href ="javascript: submit();"><img src="<%=cp%>/img/member/btn_ok.gif" value="회원가입" class="button"/></a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href = "javascript:window.close();"><img src="<%=cp%>/img/member/btn_cancel.gif" value="가입취소" class="button" /></a>
					<br>
					</td>
				</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>