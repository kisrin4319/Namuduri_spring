<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MODIFY MEMBER</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
  function passWorkCheck() {
    var password = document.getElementById("password").value;
    var passwordCheck = document.getElementById("passwordCheck").value;

    if (passwordCheck == "") {
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

    if (password != '' && passwordCheck != '') {
      if (password == passwordCheck) {

      }
    }

    //체크박스를 선택하지 않았을때
    if ($('input:checkbox[name="member_email_get"]').is(":checked") == false) {
      $('input:checkbox[name="member_email_get"]').val('NO');
    }

    if (password == '') {
      alert('비밀번호를 입력해 주세요.');
      return false;
    }
    if (passwordCheck == '') {
      alert('비밀번호를 확인해 주세요.');
      return false;
    }
    if (password == passwordCheck) {
      $.ajax({
      url : '/namuduri/member/memberModify.do',
      type : 'post',
      data : $('form').serialize(),
      success : function(result) {
        if (result.returnVal == '1') {
          alert('회원정보 수정이 완료되었습니다.');
          return true;
        } else {
          alert('비밀번호가 같지 않습니다.');
          return false;
        }
      }
      })
    }

  }

  function openZipCheck() {
    var zipUrl = '/namuduri/member/zipCheckForm.do';
    window.open(zipUrl, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=610, height=250");
  }
</script>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">MODIFY MEMBER</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
		</li>
		<li>
			<a title="Go to MY PAGE" href="<%=cp%>/mypage.do">MY PAGE</a>
		</li>
	</ul>
	<div class="shopping-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
							<aside class="widget widget-categories">
								<h2 class="sidebar-title text-center">CATEGORY</h2>
								<ul class="sidebar-menu">
									<li>
										<a href="<%=cp%>/order/orderListCheckView.do">
											<i class="fa fa-angle-double-right"></i>
											주문/배송 조회
										</a>
									</li>
									<li>
										<a href="<%=cp%>/member/memberModifyView.do">
											<i class="fa fa-angle-double-right"></i>
											회원 정보수정
										</a>
									</li>
									<li>
										<a href="<%=cp%>/member/memberDeleteView.do">
											<i class="fa fa-angle-double-right"></i>
											회원 탈퇴
										</a>
									</li>
									<li>
										<a href="<%=cp%>/eFeelogView.do">
											<i class="fa fa-angle-double-right"></i>
											eFeelog
										</a>
									</li>
								</ul>
							</aside>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<form class="form-horizontal">
						<fieldset>
							<!-- Form Name -->
							<legend>회원 정보를 수정 할 수 있는 페이지입니다.</legend>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="f_name">
									아이디
									<font size="2" color="#ff3f3f">*</font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_id" id="member_id" maxlength="16" value="${memberInfo.member_id }" />
									</p>
									<font class="text-center" size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
								</div>
							</div>
							<!-- Prepended text-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="f_income">
									비밀번호
									<font size="2" color="#ff3f3f">*</font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="password" class="form-control" name="member_pw" id="password" />
									</p>
									<font class="text-center" size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="m_name" style="padding-right: 12px;">
									비밀번호 확인
									<font size="2" color="#ff3f3f">*</font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="password" class="form-control" id="passwordCheck" onkeyup="passWorkCheck();" />
									</p>
									<span id="passwordCheckText"></span>
								</div>
							</div>
							<!-- Prepended text-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="m_income">
									이름
									<font size="2" color="#ff3f3f">*</font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_name" value="${memberInfo.member_name }" />
									</p>
									
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="dob" style="padding-right: 12px;">
									주민등록번호
									<font size="2" color="#ff3f3f">*</font>
								</label>
								<div class="col-md-4" style="padding-bottom: 5px;">
									<p class="form-row">
										<input type="text" class="form-control" name="member_jumin1" maxlength="6" value="${memberInfo.member_jumin1 }" />
									</p>
								</div>
								<div class="col-md-1 hidden-xs" style="padding-left: 0px; padding-right: 0px; width: 10px; margin-top: 10px; margin-left: 5px;">-</div>
								<div class="col-md-4">
									<p class="form-row">
										<input type="text" class="form-control" name="member_jumin2" maxlength="7" value="${memberInfo.member_jumin2 }" />
									</p>
								</div>
							</div>
							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="pwd">
									우편 번호
									<font size="2" color="#ff3f3f"> * </font>
								</label>
								<div class="col-md-4" style="padding-bottom: 5px;">
									<p class="form-row">
										<input type="text" class="form-control" name="member_zipcode" value="${memberInfo.member_zipcode }" />
									</p>
								</div>
								<span style="margin-left: 15px;">
									<input type="button" class="btn" name="zipcode" value="우편번호" onclick="openZipCheck()" />
								</span>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" for="pwd">
									주소
									<font size="2" color="#ff3f3f"> * </font>
								</label>
								<div class="col-md-4" style="padding-bottom: 5px;">
									<p class="form-row">
										<input type="text" class="form-control" name="member_addr1" value="${memberInfo.member_addr1 }" />
									</p>
								</div>
								<div class="col-md-5" style="padding-bottom: 5px;">
									<p class="form-row">
										<input type="text" class="form-control" name="member_addr2" value="${memberInfo.member_addr2 }" />
									</p>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="per_ph">일반전화</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_phone" value="${memberInfo.member_phone }" />
									</p>
									<span>
										<font size="2" color="#ff3f3f"> (일반전화가 없을 시 휴대전화를 기재해주세요.) </font>
									</span>
								</div>
							</div>
							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-md-2 control-label" for="categoy">
									휴대전화
									<font size="2" color="#ff3f3f"> * </font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_mobile" value="${memberInfo.member_mobile }" />
									</p>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="religion">
									이메일
									<font size="2" color="#ff3f3f"> * </font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_email" value="${memberInfo.member_email }" />
									</p>
									<input type="checkbox" name="member_email_get" value="YES" />
									동의함 &nbsp;
									<font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?</font>
								</div>
							</div>
							<br />
							<legend>선택 입력 사항</legend>
							<div class="form-group">
								<label for="regno" class="col-md-2 control-label"> 환불 계좌 정보 </label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_bankname" value="${memberInfo.member_bankname }" />
									</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" for="religion">환불 계좌</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_refund_account" value="${memberInfo.member_refund_account }" />
									</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" for="religion">환불주</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_account_holder" value="${memberInfo.member_account_holder }" />
									</p>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-md-2 control-label" for="religion" style="padding-right: 0px;">
									보유 마일리지
									<font size="2" color="#ff3f3f"> * </font>
								</label>
								<div class="col-md-6">
									<p class="form-row">
										<input type="text" class="form-control" name="member_point" value="${memberInfo.member_point }" readonly="readonly" style="" />
									</p>
								</div>
							</div>
						</fieldset>
					</form>
					<div style="text-align: -webkit-center;">
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
			</div>
		</div>
	</div>
</body>
</html>
