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
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1989435997997041',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.11'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  

  FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
  });  

  {
      status: 'connected',
      authResponse: {
          accessToken: '...',
          expiresIn:'...',
          signedRequest:'...',
          userID:'...'
      }
  }
</script>
</head>
<body>
	<!-- Loging Area Start -->
	<div class="login-account section-padding">
		<div class="container">
			<div class="row">
				<div class=" col-lg-12 col-md-12 col-sm-12">
					<form action="loginForm.do" class="create-account-form" method="post" name="login">
						<h2 class="heading-title">L o g i n</h2>
						<%-- <input type="hidden" id="RSAModulus" value="${RSAModulus }"/>
                            <input type="hidden" id="RSAExponent" value="${RSAExponent }" /> --%>
						<!-- <div class="col-lg-6 col-md-6 col-sm-6">
							<p class="form-row">
								<input type="text" placeholder="아이디" name="member_id" id="member_id">
							</p>
						</div> -->
						<div class="col-sm-6 form-group">
							<label>User Name</label>
							<input type="text" placeholder="username.." class="form-control" name="member_id" id="member_id">
						</div>
						<!-- <div class="col-lg-6 col-md-6 col-sm-6">
							<p class="form-row">
								<input type="password" placeholder="비밀번호" name="member_pw" id="member_pw">
							</p>
						</div> -->
						
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
								
						<!-- <div class="subtotal-main-area">
							<a href="javascript:" onclick="window.location='memberInfo.do';">CREATE AN ACCOUNT</a> 
							<a href="javascript:" onclick="return check();">LOGIN</a>
						</div> -->
						
						<br>
						
						<div class="row" >	
							<div class="col-sm-4">
								<div class="btn-group">
									<button type="button" class="btn btn-primary" onclick="loginFB(); return false;"><i class="fa fa-facebook"></i>Sign in with Facebook</button>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="btn-group">
									<button type="button" id="customBtn" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/member/googleSignIn.do'"><i class="customGPlusSignIn"></i>Sign in with GooglePlus</button>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="btn-group">
									<button type="button" class="btn btn-info"><i class="fa fa-twitter"></i>Sign in with Twitter</button>
								</div>
							</div>
						</div>	
						
						<!-- Facebook login -->
						<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
						<div id="fb-root"></div>
						<script>
						(function(d, s, id) {
  							var js, fjs = d.getElementsByTagName(s)[0];
  							if (d.getElementById(id)) return;
  							js = d.createElement(s); js.id = id;
  							js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.11&appId=271410833383842';
  							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
						</script>
						
						
					
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