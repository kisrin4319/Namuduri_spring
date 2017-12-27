<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shopping Cart || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인폼</title>
</head>
<body>
	<!-- Loging Area Start -->
	<div class="login-account section-padding">
		<div class="container">
			<div class="row">
				<div class=" col-lg-12 col-md-12 col-sm-12">
					<form action="loginForm.do" class="create-account-form" method="post" name="login">
						<h2 class="heading-title">L o g i n</h2>
						<div class="col-sm-6 form-group">
							<label>User Name</label>
							<input type="text" placeholder="username.." class="form-control" name="member_id" id="member_id">
						</div>
						<div class="col-sm-6 form-group">
							<label>Password</label>
							<input type="password" placeholder="password.." class="form-control" name="member_pw" id="member_pw">
						</div>
						<p class="lost-password form-group">
							<a href="#" rel="nofollow" onclick="openConfirmId(this.form)">Forgot your id?</a>
						</p>
						<p class="lost-password form-group">
							<a href="#" rel="nofollow" onclick="openConfirmPw(this.form)">Forgot your password?</a>
						</p>
						<div class="row">
							<div class="col-sm-12 text-center">
								<button type="button" class="btn btn-block btn-info" onclick="check(); return false;">Login</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-12 text-center">
								<button type="button" class="btn btn-block btn-info" onclick="location.href='memberInfo.do'">Create an account</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-4">
								<div class="btn-group">
									<button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/member/facebook.do'">
										<i class="fa fa-facebook"></i>
										Log in with Facebook
									</button>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="btn-group">
									<button type="button" id="customBtn" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/member/googleSignIn.do'">
										<i class="customGPlusSignIn"></i>
										Log in with GooglePlus
									</button>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="btn-group">
										<img alt="" src="<%=cp%>/img/kakao_login.png" width="160px" height="20px" onclick="javascript:location.href='<%=cp %>/member/kakao.do'">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Loging Area End -->
	<script type="text/javascript">
		
		function check() {

			var d = document.login;

			if (d.member_id.value == "") {
				alert("아이디를 입력하세요.");
				d.member_id.focus();
				return false;
			}

			if (d.member_pw.value == "") {
				alert("비밀번호를 입력하세요.");
				d.member_pw.focus();
				return false;
			} else {
				d.submit();
			}
		}

		function openConfirmId(loginform) {
			var url = 'http://localhost:8080/namuduri/member/memberIdFindView.do';
			window.open(url,"confirm","toolbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no");
		}

		function openConfirmPw(loginform) {
			var url = 'http://localhost:8080/namuduri/member/memberPwFindView.do';
			window.open(url,"confirm","tollbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no");
		}
	</script>
	<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js"></script>
</body>
</html>