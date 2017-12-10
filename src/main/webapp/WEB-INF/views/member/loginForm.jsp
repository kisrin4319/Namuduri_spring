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
<script type=”text/javascript” src="<%=cp%>/js/google_oauth.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('div.codeReview code').each(function(i, block) {
					hljs.highlightBlock(block);
				});

				window.fbAsyncInit = function() {
					FB.init({
						appId : '380056482406311', // 앱 ID
						status : true, // 로그인 상태를 확인
						cookie : true, // 쿠키허용
						xfbml : true
					// parse XFBML
					});

					FB.getLoginStatus(function(response) {
						if (response.status === 'connected') {
							FB.api('/me', function(fbUser) {
								if (fbUser) {
									$('#image').attr(
											'src',
											'http://graph.facebook.com/'
													+ fbUser.id + '/picture');
									$('#name').html(fbUser.name);
									$('#locale').html(fbUser.locale);
									$('#link').html(
											"<a href='"+fbUser.link+"'>"
													+ fbUser.id + "</a>");
									$('#response').html(
											'<pre>' + JSON.stringify(response)
													+ '</pre>');
									$('#meResponse').html(
											'<pre>' + JSON.stringify(fbUser)
													+ '</pre>');
								}

							});

						} else if (response.status === 'not_authorized') {

						} else {

						}
					});

					FB.Event.subscribe('auth.login', function(response) {

						document.location.reload();

					});

				};

				// Load the SDK Asynchronously
				(function(d) {

					var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];

					if (d.getElementById(id)) {
						return;
					}
					js = d.createElement('script');
					js.id = id;
					js.async = true;
					js.src = "//connect.facebook.net/ko_KR/all.js";
					ref.parentNode.insertBefore(js, ref);

				}(document));
			});
</script>
</head>
<body>
	<!-- Loging Area Start -->
	<div class="login-account section-padding">
		<div class="container">
			<div class="row">
				<div class=" col-lg-12 col-md-12 col-sm-12">
					<form action="loginForm.do" class="create-account-form" method="post" name="login">
						<h2 class="heading-title">로 그 인</h2>
						<%-- <input type="hidden" id="RSAModulus" value="${RSAModulus }"/>
                            <input type="hidden" id="RSAExponent" value="${RSAExponent }" /> --%>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<p class="form-row">
								<input type="text" placeholder="아이디" name="member_id" id="member_id">
							</p>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6">
							<p class="form-row">
								<input type="password" placeholder="비밀번호" name="member_pw" id="member_pw">
							</p>
						</div>
						<p class="lost-password form-group">
							<a href="#" rel="nofollow" onclick="openConfirmId(this.form)">Forgot your id?</a>
						</p>
						<p class="lost-password form-group">
							<a href="#" rel="nofollow" onclick="openConfirmPw(this.form)">Forgot your password?</a>
						</p>
						<div class="subtotal-main-area">
							<a href="javascript:" onclick="window.location='memberInfo.do';">CREATE AN ACCOUNT</a> <a href="javascript:" onclick="return check();">LOGIN</a>
						</div>
						<br> <br> <br>
						<!-- 구글 로그인 화면으로 이동 시키는 URL -->
						<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
						<div id="google_id_login" style="text-align: right">
							<a href="https://accounts.google.com/ServiceLogin/identifier?hl=ko&passive=true&continue=https%3A%2F%2Fwww.google.co.kr%2F%3Fgfe_rd%3Dcr%26dcr%3D0%26ei%3Dn90nWsuJGZaD8AW427W4Dg%26gws_rd%3Dssl&flowName=GlifWebSignIn&flowEntry=ServiceLogin"> <img width="230" src="${pageContext.request.contextPath}/img/member/sign-in-with-google.png" />
							</a>
						</div>
						<%-- <div class="container">

      <h3>페이스북 버튼 출력 </h3>

      <div class="fb-like" data-share="true" data-width="450" data-show-faces="true">

      </div>
     
      <div id="fb-root"></div>

      <fb:login-button show-faces="false" width="200" max-rows="1"></fb:login-button>
      <hr/>

      <h3>사용자정보 출력</h3>

      <div align="left">

          <h4>페이스북 로그인 검사</h4>

          <div id="response"></div>

	       <h4>페이스북 response Data</h4>

          <div id="meResponse"></div>

          <h4>페이스북 연동정보</h4>

          <img id="image"/>

          <div id="name"></div>

          <div id="locale"></div>

          <div id="link"></div>

      </div>

    </div>

    <div class="codeReview"><code></code></div> --%>
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
			window.open(url,"confirm","toolbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=610, height=210");
		}

		function openConfirmPw(loginform) {
			var url = 'http://localhost:8080/namuduri/member/memberPwFindView.do';
			window.open(url,"confirm","tollbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=605, height=195");
		}
	</script>
</body>
</html>