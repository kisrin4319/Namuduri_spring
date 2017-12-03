<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>FIND PW MEMBER</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link rel = "stylesheet" href ="<%=cp%>/css/style1.css" type="text/css" /> --%>
<script type="text/javascript">
function check() {
	var fw = document.findpwform;
	
	if(fw.member_id.value ==""){
		alert("아이디를 입력해주세요.")
		fw.member_id.focus();
	}
	else if(fw.member_email.value ==""){
		alert("이메일을 입력해주세요.");
		fw.member_email.focus();
	}
	else {
		$.ajax({
			url:'/namuduri/member/memberPwFind.do',
            type:'post',
            data:$('form').serialize(),
            async:false,
            success:function(result){
            	if(result.returnVal == '1'){
            		alert('당신의 비밀번호는' + result.member_pw + '입니다.');
            		return false;
            	}else {
            		alert('아이디 또는 이메일이 바르지 않습니다.');
            		return false;
            	}
            },
            error:function(request,status,error) {
            }
		});
	}
}
</script>
</head>
<body>

	<h2 style="text-align: -webkit-center; padding-top: 30px;">FIND PW MEMBER PAGE</h2>
		<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
			<li>
				<a title="Go to Login" href="<%=cp%>/member/loginForm.do">Login</a>
			</li>
			<li>
				<a title="Go to Find Id" href="<%=cp%>/member/memberIdFindView.do">Find ID</a>
			</li>
		</ul>
		
	<!-- Find PW Area Start -->
		<div class="login-account section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<form class="create-account-form" name="findpwform" id="findpwform">
							<h2 class="heading-title">
								Find PW
							</h2>
							<div class="form-group">
							<!-- <p class="form-row"><h5>ID</h5> -->
								<label for="usr" class="form-row">ID:</label>
								<input type="text" name="member_id">
							<!-- </p> -->
							</div>
							<!-- <p class="form-row"><h5>E-MAIL</h5> -->
							<div class="form-group">
								<label for="usr" class="form-row">E-MAIL:</label>
								<input type="text" name="member_email">
							</div>
							<!-- </p> -->
							<div>					
                                <button name="submitcreate" id="submitcreate" class="btn-default" onclick="javascript:check()">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                       	 SING IN
                                    </span>
                                </button>
                                <button name="submitcreate" id="submitcreate" class="btn-default">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                       	 CLOSE
                                    </span>
                                </button>
                            </div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<%-- <body scroll="" style ="overflow-x:hidden">
	<div id ="popup_type01" style ="width:600px;">
		<div class ="popup_shadow">
			<div class ="popup_wrap">
				<div class ="tit">
					<h1 class ="title_h_cartlist">비밀번호 찾기</h1>
				</div>				
				<div class ="popup_container">
					<form action="memberPwFind.do" id="findpwform" name="findpwform" method="post">
					<table width="500" border="0" cellpadding="0" cellspacing="0" class="zip">
				<tr>
					<td align="left"><h4>아이디</h4> 
						<input type="text" name="member_id" maxlength="10">
					</td>
				</tr>
				<br />
				<tr>
					<td align="left"><h4>E-mail</h4> 
						<input type="text" name="member_email">
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
</body> --%>
</html>