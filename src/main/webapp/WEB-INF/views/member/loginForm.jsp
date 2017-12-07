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
<script type=”text/javascript” src="<%=cp %>/js/google_oauth.js"></script> 

</head>
<body>

		 <!-- Breadcrumbs Area Start -->
		<div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>LOGIN</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.html">Home</a>
						        </li>
						        <li>Login</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 
		
 		<!-- Loging Area Start -->
        <div class="login-account section-padding">
           <div class="container">
                <div class="row">
                    
                    <div class="col-md-6 col-sm-6" style="left: 300px;">
                       <form action="loginForm.do" class="create-account-form" method="post" name="login">
                            <h2 class="heading-title">
                            	로 그 인
                            </h2>
                            <%-- <input type="hidden" id="RSAModulus" value="${RSAModulus }"/>
                            <input type="hidden" id="RSAExponent" value="${RSAExponent }" /> --%>
                            <p class="form-row">
                                <input type="text" placeholder="아이디"  name="member_id" id="member_id">
                            </p>
                            <p class="form-row">
                                <input type="password" placeholder="비밀번호"  name="member_pw" id="member_pw">
                            </p>
                            <!-- <input type="hidden" id="MEMBER_ID_TEXT" name="MEMBER_ID_TEXT">
                            <input type="hidden" id="MEMBER_PW_TEXT" name="MEMBER_PW_TEXT"> -->
                            <p class="lost-password form-group">
                                <a href="#" rel="nofollow" onclick="openConfirmId(this.form)">Forgot your id?</a>
                            </p>
                            <p class="lost-password form-group">
                                <a href="#" rel="nofollow" onclick="openConfirmPw(this.form)">Forgot your password?</a>
                            </p> 
                            <div class="subtotal-main-area">	
                            
                            	<a href="javascript:" onclick="window.location='memberInfo.do';">CREATE AN ACCOUNT</a>
                            	
                            	<a href="javascript:" onclick="return check();">LOGIN</a>
                         
                                
                            </div> 
                            
                            
							<br><br><br>
							<!-- 구글 로그인 화면으로 이동 시키는 URL -->
							<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
							<div id="google_id_login" style="text-align:right">
								<a href="https://accounts.google.com/ServiceLogin/identifier?hl=ko&passive=true&continue=https%3A%2F%2Fwww.google.co.kr%2F%3Fgfe_rd%3Dcr%26dcr%3D0%26ei%3Dn90nWsuJGZaD8AW427W4Dg%26gws_rd%3Dssl&flowName=GlifWebSignIn&flowEntry=ServiceLogin">
								<img width="230" src="${pageContext.request.contextPath}/img/member/sign-in-with-google.png"/></a>
							</div>
							
                       </form>
                            
                            
                       
                    </div>
                    
                </div>               
           </div>
        </div>
        <!-- Loging Area End -->
<script language="javascript">

function check(){
	
	var d = document.login;
	/* var id = $("#MEMBER_ID");
	var pw = $("#MEMBER_PW");
	
	var rsa = new REAKey();
	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	
	$("#MEMBER_ID_TEXT").val(rsa.encrypt(id.val()));
	$("#MEMBER_PW_TEXT").val(rsa.encrypt(pw.val()));
	
	id.val("");
	pw.val(""); */
	
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
	var url='http://localhost:8080/namuduri/member/memberIdFindView.do';
	window.open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=610, height=210");
}

function openConfirmPw(loginform){
	var url='http://localhost:8080/namuduri/member/memberPwFindView.do';
	window.open(url, "confirm", "tollbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=605, height=195");
}

</script>
	</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
											<input type="password" name="member_pw" size="45" maxlength="20">
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
</html> --%>