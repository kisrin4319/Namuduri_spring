<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>DELETE MEMBER</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
  function check() {
    var di = document.memberform;

    if (di.member_id.value == "") {
      alert("아이디를 입력해주십시오.");
      return false;
    }

    if (di.member_pw.value == "") {
      alert("비밀번호를 입력해주십시오.");
      return false;
    } else {
      $.ajax({
      url : '/namuduri/member/memberDelete.do',
      type : 'post',
      data : $('form').serialize(),
      async : false,
      success : function(result) {
        if (result.returnVal === "1") {
          alert('회원 탈퇴가 정상적으로 처리되었습니다. 이용해 주셔서 감사합니다.');
          return false;
        } else {
          alert('아이디 또는 비밀번호가 바르지 않습니다.');
          return false;
        }
      },
      error : function(request, status, error) {

      }
      });
    }
  }
</script>
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">DELETE MEMBER PAGE</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Go to Login" href="<%=cp%>/main.do">MAIN</a>
		</li>
		<li>
			<a title="Go to Find Pw" href="<%=cp%>/mypage.do">MY PAGE</a>
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
					<form class="create-account-form" name="memberform" id="memberform">
						<h2 class="heading-title">DELETE MEMBER</h2>
						<div class="form-group">
							<label for="usr" class="form-row">ID:</label>
							<p class="form-row">
								<input type="text" class="form-contorl" id="usr" name="member_id">
							</p>
						</div>
						<div class="form-group">
							<label for="usr" class="form-row">Password:</label>
							<p class="form-row">
								<input type="password" name="member_pw">
							<p class="form-row">
						</div>
						<div style="float: right;">
							<button name="submitcreate" id="confirm" class="btn-default" onclick="check()">
								<span>
									Confirm
								</span>
							</button>
							<button name="submitcreate" id="cancel" class="btn-default" onclick="javascript:history.back(-1);">
								<span>
									CANCEL
								</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>