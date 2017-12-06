<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page session="true" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>로그인폼</title>
<link href="<%=cp %>/css/style1.css"  rel="stylesheet" type="text/css" />
<script>

function check(){
	
	var d = document.login;
	
	if(d.member_id.value == ""){
		alert("아이디를 입력하세요.");
		d.member_id.focus();
		return false;
	}
	
	if(d.member_pw.value == ""){
		alert("비밀번호를 입력하세요.");
		d.member_pw.focus();
		return false;
	}
	else { 
	d.submit();
	}
}

function openConfirmId(loginform){	
	var url='/namuduri/member/memberIdFindView.do';
	window.open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=610, height=210");
}

function openConfirmPw(loginform){
	var url='/namuduri/member/memberPwFindView.do';
	window.open(url, "confirm", "tollbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=605, height=195");
}

</script>

</head>
<body>
<br><br>
<h2 class="h2_member" style="width: 980px;"><img src="member/images/h2_login.gif" alt="로그인"></h2>
<div class="box_login_inner">
<div class="login_content01">
<div class="login_zone" id="login_zone1" > 
<div class="input-login1 on2" >
<table border="0" width="960" cellspacing="0" cellpadding="0" align="center">

	<tr>
		<td colspan="2" align="center">
		
			<table border="0" cellpadding="0" cellspacing="0" width="500" align="center" style="margin-left: 160px;">
				
				<tr>
					<form action="loginForm.do" method="post" name="login" onsubmit="return check()">
						<td>
							<br>
							<br>
							
							<table width="400" border="0" cellspacing="0" cellpadding="0">
							<table width="400" border="0" cellspacing="4" cellpadding="0" align="center" class="input-login1 on2">
								<tr>
									<td align="top" >												
										<table border="0" align="center">
										</table>
									<h2 class="title" ><a href="#" id="login_type1"><img src="member/images/tit_member_join_popup.gif" alt="회원로그인"></a> <a href="#" id="login_type2"></a></h2>
									<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
										<tr>
											<td align="center">
											<table cellpadding="0" cellspacing="0" border="0" style="margin-left: 10px;">
										<tr>
											<td width="73" style="padding-left: 25px;"><label for="memid" class="label_login">사용자 ID</label></td>
										</tr>
										<tr>
											<td width="103" style="padding-left: 25px;">
											<input type="text" name="member_id" size="45" maxlength="20" class="text input_login" value="" >
											</td>																		
										</tr>
										<tr>
											<td width="73" style="padding-left: 25px;"><label for="pw" class="label_login">비밀번호</label></td>
										</tr>
										<tr>
											<td width="110" style="padding-left: 25px;">
											<input type="password" name="member_pw" size="60">
											</td>
										</tr>
									<br />
					</form>
																	
																	<tr>	
																		<td height="10">
																		</td>
																	</tr>
																	<tr>
																		<td height="35" colspan="6" align="center">
																			<input type="image" src="member/images/login2.PNG" value="로그인" onclick="return check();"><br>
																		</td>
																	</tr>	
																	<tr>	
																		<td height="10">
																		</td>
																	</tr>
																	<tr>
																		<td height="35" colspan="6" align="center">
																			<input type="image" src="member/images/info.PNG" value="회원가입" onclick="javascript:window.location='memberInfo.do';">
																		</td>
																	</tr>
																	<tr>	
																		<td height="10">
																		</td>
																	</tr>
																	<tr>
																		<td height="35" colspan="6" align="center">
																			
																			<a href="#">
																				<input type="image" src="member/images/idFind.PNG" value="아이디찾기" onclick="openConfirmId(this.form)" >
																			</a>
																			&nbsp;&nbsp;&nbsp;&nbsp;
																			<a href="#">
																				<input type="image" src="member/images/pwFind.PNG" value="비밀번호찾기" onclick="openConfirmPw(this.form)">
																			</a>
																		</td>
																	</tr>
																			
																																	
																</table>																
															</td>
														</tr>														
													</table>													
												</td>
											</tr>											
										</table>
									</table>
								</td>
							</form>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</div>
		</div>
		</div>
		</div>
	</body>
</html>