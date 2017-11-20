<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<link rel = "stylesheet" href ="<%=cp%>/css/style1.css" type="text/css" />
<script type="text/javascript">
function submit() {
	var fi = document.findidform;
	
	if(fi.member_name.value ==""){
		alert("이름을 입력해주세요.")
		fi.member_name.focus();
	}
	else if(fi.member_jumin1.value ==""){
		alert("주민등록번호를 입력해주세요.");
		fi.member_jumin1.focus();
	}
	else if(fi.member_jumin2.value==""){
		alert("주민등록번호를 입력해주세요.");
		fi.member_jumin2.focus();
	}
	else {
		$.ajax({
            url:'/namuduri/member/memberIdFind.do',
            type:'post',
            data:$('form').serialize(),
            success:function(result){
            	if(result.returnVal == '1'){
            		alert('당신의 아이디는' + result.member_id + '입니다.');
            		return false;
            	}else {
            		alert('아이디가 존재하지 않습니다. 가입 후 이용해 주세요.');
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
					<h1 class ="title_h_cartlist">주소 찾기</h1>
				</div>
				
				<div class ="popup_container">
					<form action="memberIdFind.do" name ="findidform" id="findidform" method="post" onsubmit="return checkk()">			
						<table width="500" border="0" cellpadding="0" cellspacing="0" class="zip"><br />
			<tr>
				<td>
					<h4>이&nbsp;&nbsp;름</h4>
					<input type="text" name="member_name" size="10" maxlength="10">
				</td>
			</tr>
			<br />
			<tr>
				<td align="left"><h4>주민등록번호</h4>
					<input type="text" name="member_jumin1" size="7" maxlength="6"> -
					<input type="text" name="member_jumin2" size="7" maxlength="7">
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