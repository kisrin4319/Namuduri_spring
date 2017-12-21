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
            		//alert('당신의 비밀번호는' + result.member_pw + '입니다.');
            		alert('임시비밀번호가 입력하신 이메일로 발송되었습니다.')
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
					<div class="col-lg-12 col-md-12 col-sm-12">
						<form class="create-account-form" name="findpwform" id="findpwform">
							<h2 class="heading-title">
								Find PW
							</h2>
							<div class="col-sm-6 form-group">						
								<label>ID</label>
								<input type="text" class="form-control" name="member_id">							
							</div>
							
							<div class="col-sm-6 form-group">
								<label>E-MAIL</label>
								<input type="text" class="form-control" name="member_email">
							</div>
							
							<br><br><br><br><br><br><br>
							
							<div class="row">
								<div class="col-sm-12 text-center">					
                                <button name="submitcreate" id="submitcreate" class="btn-default" onclick="javascript:check()">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                       	 SING IN
                                    </span>
                                </button>
                                <!-- <button name="submitcreate" id="submitcreate" class="btn-default">
                                    <span>
                                        <i class="fa fa-user left"></i>
                                       	 CLOSE
                                    </span>
                                </button> -->
                                </div>
                            </div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>