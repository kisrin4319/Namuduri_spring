<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>FIND ID MEMBER</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
function check() {
	var fi = document.findidform;
	
	if(fi.member_name.value ==""){
		alert("이름을 입력해주세요.")
		fi.member_name.focus();
	}
	else if(fi.member_jumin1.value ==""){
		alert("주민등록번호를 입력해주세요.");
		fi.member_jumin1.focus();
	}
	else if(fi.member_jumin2.value==""){
		alert("주민등록번호를 입력해주세요.");
		fi.member_jumin2.focus();
	}
	else {
		$.ajax({
            url:'/namuduri/member/memberIdFind.do',
            type:'post',
            data:$('form').serialize(),
            async:false,
            success:function(result){
            	if(result.returnVal == '1'){
            		alert('당신의 아이디는' + result.member_id + '입니다.');
            		return false;
            	}else {
            		alert('아이디가 존재하지 않습니다. 가입 후 이용해 주세요.');
            		return false;
            	}
            },
            error:function(request,status,error){
            }
        });
	}
}
</script>
</head>
<body>

	<h2 style="text-align: -webkit-center; padding-top: 30px;">FIND ID MEMBER PAGE</h2>
		<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
			<li>
				<a title="Go to Login" href="<%=cp%>/member/loginForm.do">Login</a>
			</li>
			<li>
				<a title="Go to Find Pw" href="<%=cp%>/member/memberPwFindView.do">Find PW</a>
			</li>
		</ul>
		
	 <!-- Find ID Area Start -->
        <div class="login-account section-padding">
        	<div class="container">
        		<div class="row">
        			<div class="col-lg-12 col-md-12 col-sm-12">       				
        				<form class="create-account-form" name ="findidform" id="findidform">
        					<h2 class="heading-title">
        						Find ID
        					</h2>
        					<div class="col-sm-6 form-group">
        					<!-- <p class="form-row"><h5>NAME</h5> -->
        						<label>NAME</label>
                                <input type="text" class="form-control" name="member_name" id="member_id">                        
                           
                            </div>
                            
                            <div class="col-sm-3 col-md-3 form-group">                           
                            	<label>JUMIN NUMBER</label>
                                <input type="text" class="form-control" name="member_jumin1" size="6" maxlength="6">                        
                            </div>
                            
                            <div class="col-sm-3 col-md-1 hidden-xs" style="margin-left:-17px; margin-top:31px; margin-bottom:-27px;">-</div>
                            
                            <div class="col-sm-3 col-md-3 form-group">
                            	<input type="text" class="form-control" name="member_jumin2" size="7" maxlength="7">
                            </div>
                            
                            
                            <br><br><br><br><br><br><br>
                                                                     
                            <div class="row">
                            	<div class="col-sm-12 text-center">					
                                <button name="submitcreate" id="submitcreate" class="btn-default" onclick="javascript:check()">
                                    <span>
                                        <i class="fa fa-user left" ></i>                                      
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