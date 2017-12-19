<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/venobox/venobox.css" type="text/css" media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/preview.css" type="text/css" media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/checkBox.css">
<!-- modernizr css -->
<script src="<%=cp%>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>
<style type="text/css">
.form-inline .form-group {
	margin-left: 0;
	margin-right: 0;
}
</style>
<body>
	<div class="container">
		<form class="form-horizontal">
			<fieldset>
				<!-- Form Name -->
				<legend>회원 정보를 수정 할 수 있는 페이지입니다.</legend>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="f_name">
						아이디
						<font size="2" color="#ff3f3f">*</font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_id" id="member_id" maxlength="16" value="${memberInfo.member_id }" />
						<font class="text-center" size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
					</div>
				</div>
				<!-- Prepended text-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="f_income">
						비밀번호
						<font size="2" color="#ff3f3f">*</font>
					</label>
					<div class="col-md-6">
						<div class="input-group">
							<input type="password" class="form-control" name="member_pw" id="password" />
							<font class="text-center" size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
						</div>
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="m_name">
						비밀번호 확인
						<font size="2" color="#ff3f3f">*</font>
					</label>
					<div class="col-md-6">
						<input type="password" class="form-control" id="passwordCheck" onkeyup="passWorkCheck();" />
						<span id="passwordCheckText"></span>
					</div>
				</div>
				<!-- Prepended text-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="m_income">
						이름
						<font size="2" color="#ff3f3f">*</font>
					</label>
					<div class="col-md-6">
						<div class="input-group">
							<input type="text" class="form-control" name="member_name" value="${memberInfo.member_name }" />
						</div>
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="dob">
						주민등록번호
						<font size="2" color="#ff3f3f">*</font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_jumin1" maxlength="6" value="${memberInfo.member_jumin1 }" />
						-
						<input type="text" class="form-control" name="member_jumin2" maxlength="7" value="${memberInfo.member_jumin2 }" />
					</div>
				</div>
				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="pwd">
						우편 번호
						<font size="2" color="#ff3f3f"> * </font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_zipcode" value="${memberInfo.member_zipcode }" />
					</div>
					<span>
						<input type="button" class="btn" name="zipcode" value="우편번호" onclick="openZipCheck()" />
					</span>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="pwd">
						기본 주소
						<font size="2" color="#ff3f3f"> * </font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_addr1" value="${memberInfo.member_addr1 }" />
					</div>
					<label class="col-md-4 control-label" for="pwd">
						상세 주소
						<font size="2" color="#ff3f3f"> * </font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_addr2" value="${memberInfo.member_addr2 }" />
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="per_ph">일반전화</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_phone" value="${memberInfo.member_phone }" />
						<span>
							<font size="2" color="#ff3f3f"> (일반전화가 없을 시 휴대전화를 기재해주세요.) </font>
						</span>
					</div>
				</div>
				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="categoy">
						휴대전화
						<font size="2" color="#ff3f3f"> * </font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_mobile" value="${memberInfo.member_mobile }" />
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="religion">
						이메일
						<font size="2" color="#ff3f3f"> * </font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_email" value="${memberInfo.member_email }" />
						<input type="checkbox" name="member_email_get" value="YES" />
						동의함 &nbsp;
						<font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?</font>
					</div>
				</div>
				<br />
				<legend>선택 입력 사항</legend>
				<div class="form-group">
					<label for="regno" class="col-md-4 control-label"> 환불 계좌 정보 </label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_bankname" value="${memberInfo.member_bankname }" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="religion">환불 계좌</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_refund_account" value="${memberInfo.member_refund_account }" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="religion">환불주</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_account_holder" value="${memberInfo.member_account_holder }" />
					</div>
				</div>
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="religion">
						보유 마일리지
						<font size="2" color="#ff3f3f"> * </font>
					</label>
					<div class="col-md-6">
						<input type="text" class="form-control" name="member_point" value="${memberInfo.member_point }" readonly="readonly" style="" />
					</div>
				</div>
			</fieldset>
		</form>
		<div>
			<button name="submitcreate" id="submitcreate" class="btn-default" onclick="check()">
				<span>
					<i class="fa fa-user left"></i>
					SING IN
				</span>
			</button>
			<button name="submitcreate" id="submitcreate" class="btn-default" onclick="javascript:history.back(-1);">
				<span>
					<i class="fa fa-user left"></i>
					CLOSE
				</span>
			</button>
		</div>
	</div>
	<!-- Footer Area End -->
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="<%=cp%>/bootstrap/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="<%=cp%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="<%=cp%>/bootstrap/js/owl.carousel.min.js"></script>
	<!-- jquery-ui js -->
	<script src="<%=cp%>/bootstrap/js/jquery-ui.min.js"></script>
	<!-- jquery Counterup js -->
	<script src="<%=cp%>/bootstrap/js/jquery.counterup.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/waypoints.min.js"></script>
	<!-- jquery countdown js -->
	<script src="<%=cp%>/bootstrap/js/jquery.countdown.min.js"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="<%=cp%>/bootstrap/venobox/venobox.min.js"></script>
	<!-- jquery Meanmenu js -->
	<script src="<%=cp%>/bootstrap/js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="<%=cp%>/bootstrap/js/wow.min.js"></script>
	<script>
    new WOW().init();
  </script>
	<!-- scrollUp JS -->
	<script src="<%=cp%>/bootstrap/js/jquery.scrollUp.min.js"></script>
	<!-- plugins js -->
	<script src="<%=cp%>/bootstrap/js/plugins.js"></script>
	<!-- Nivo slider js -->
	<script src="<%=cp%>/bootstrap/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="<%=cp%>/bootstrap/lib/home.js" type="text/javascript"></script>
	<!-- main js -->
	<script src="<%=cp%>/bootstrap/js/main.js?ver=1"></script>
</body>
</html>