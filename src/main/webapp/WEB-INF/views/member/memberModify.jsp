<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link rel = "stylesheet" href ="css/style1.css" type="text/css" />
<script language="javascript">
		
	function passWorkCheck(){
		var password = document.getElementById("password").value;
		var passwordCheck = document.getElementById("passwordCheck").value;
	
		if(passwordCheck == ""){
			document.getElementById("passwordCheckText").innerHTML = ""
		} else if (password != passwordCheck) {
			document.getElementById("passwordCheckText").innerHTML = "<b><font color=red size=3pt> 비밀번호가 틀립니다. </font></b>"
		} else {
			document.getElementById("passwordCheckText").innerHTML = "<b><font color=blue size=3pt> 비밀번호가 일치합니다. </font></b>"
		}
	}

	function check() {
		var password = document.getElementById("password").value;
		var passwordCheck = document.getElementById("passwordCheck").value;
		
		if(password != '' && passwordCheck != ''){
			if(password == passwordCheck){
				document.getElementById("memberInfo").submit();			
			}else {
				alert('비밀번호가 같지 않습니다.');
				return false;
			}
		}
		if(password == ''){
			alert('비밀번호를 입력해 주세요.');
			return false;
		}else if(passwordCheck == ''){
			alert('비밀번호를 확인해 주세요.');
			return false;
		}
	}
	function openZipCheck() {
		var zipUrl = 'http://localhost:8080/namuduri/zipCheck.do'
		window.open(
				zipUrl,
				"confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=610, height=250");
	}
</script>
</head>
<body>
<div id ="contents"><br><br>
<div class="member_content" style="width: 800px;">
<h3 class="bul_green02">회원정보 수정</h3>
<table class="table_style01"  width="1080" cellspacing="0" border="0" align="center">
<tr>
	<td colspan="2">
	<form name ="memberInfo" id="memberInfo" action="./memberModify.do" method="post" onsubmit="return check()">
		<table>
			<p align="center">
				<table border="0" style="width:980px;">
					<tr>
						<td>
							<font size="2">
							&nbsp;&nbsp;아이디
								<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="text" name="member_id" id="member_id" size="20" maxlength="16" value="${mresultClass.member_id }"/>
							<font size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">
							&nbsp;&nbsp;비밀번호
								<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="password" name="member_pw" id="password" size="21"/>
								<font size="2" color="#ff3f3f">(영문 대소문자/숫자, 4~16자)</font>
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">
								&nbsp;&nbsp;비밀번호 확인
								<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="21" id="passwordCheck" onkeyup="passWorkCheck();"/><span id="passwordCheckText"></span>
						</td>																
					</tr>
					<tr>
						<td width="17%" >
							<font size="2">
									&nbsp;&nbsp;이름
									<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="text" name="member_name" size="20" value="${mresultClass.member_name }"/>
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">
								&nbsp;&nbsp;주민등록번호
								<font size="2" color="#ff3f3f">*</font>
								</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="text" name="member_jumin1" size="12" maxlength="6" value="${mresultClass.member_jumin1 }"/> -
							<input type="text" name="member_jumin2" size="12" maxlength="7" value="${mresultClass.member_jumin2 }"/>
						</td>
					</tr>
					<tr>
							<td>
								<font size="2">
									&nbsp;&nbsp;주소
									<font size="2" color="#ff3f3f">
											*
									</font>
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_zipcode" size="7"  value="${mresultClass.member_zipcode }"/>
								<input type="text" name="member_addr1" size="50"  value="${mresultClass.member_addr1 }"/> <input type="button" class="btn_small3" name="zipcode" value="우편번호" onclick="javascript:openZipCheck(this.form)" style="height: 20px;"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
								<!-- &nbsp;&nbsp;기본주소 뒤로가야하는데 -->
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_addr2" size="50" value="${mresultClass.member_addr2 }"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
								&nbsp;&nbsp;일반전화
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_phone" size="20" value="${mresultClass.member_phone }"/>
									<font size="2" color="#ff3f3f">
											(일반전화가 없을 경우 휴대전화를 기재해주세요.)
									</font>
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
								&nbsp;&nbsp;휴대전화
								<font size="2" color="#ff3f3f">
											*
									</font>
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_mobile" size="20" value="${mresultClass.member_mobile }"/>
									
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
									&nbsp;&nbsp;이메일
									<font size="2" color="#ff3f3f">
											*
									</font>
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_email" size="30" value="${mresultClass.member_email }"/>
								<input type="checkbox" name="member_email_get" value="YES"/> 동의함
								<font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?</font>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
							<a href ="javascript: check();"><img src="member/images/btn_ok.gif" value="수정" class="button"/></a>
														&nbsp;&nbsp;&nbsp;&nbsp;
								<a href = "javascript:history.back(-1);"><img src="member/images/btn_cancel.gif" value="수정취소" class="button" /></a>
								<br>
							</td>
						</tr>
					</table>
			</table>
		</form>
	</table>
</div>
</div>
</body>
</html>
						