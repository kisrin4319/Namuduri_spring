<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>JOIN</h2>
						<ul class="breadcrumbs-list">
							<li>
								<a title="Return to Home" href="index.html">Home</a>
							</li>
							<li>JOIN</li>
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
				<div class="col-pjh-1 col-sm-6" style="width: 100%;">
					<form action="/memberInfo.do" class="create-account-form" method="post" name="memberInfo" onsubmit="return check()">
						<h2 class="heading-title">J O I N</h2>
						<h3 class="bul_green02">Enter information</h3>
						<p class="font_11">The information you entered will not be saved until you complete your subscription.</p>
						<p class="font_11 margin_top5" style="color: #5282ca;">
							The member information you enter without collecting the resident registration number is very valuable information that identifies the member.
							<br />
							Please enter the latest information exactly as it will be used as your personal information for ID and password search
						</p>
						<br>
						<h3 height="23" colspan="5" align="center">TERMS AND CONDITIONS</h3>
						<br>
						<p style="text-align: center;">
							<textarea class="junho3" cols="100%" style="width: 70%; height: 265px; resize: none;">
	TERMS AND CONDITIONS


1. Introduction
These Website Standard Terms and Conditions written on this webpage shall manage your use of
this website. These Terms will be applied fully and affect to your use of this Website. By using this
Website, you agreed to accept all terms and conditions written in here. You must not use this
Website if you disagree with any of these Website Standard Terms and Conditions.
Minors or people below 18 years old are not allowed to use this Website.

2. Intellectual Property Rights
Other than the content you own, under these Terms, Namuduri and/or its licensors own all the
intellectual property rights and materials contained in this Website.
You are granted limited license only for purposes of viewing the material contained on this Website.

3. Restrictions
You are specifically restricted from all of the following
publishing any Website material in any other media;
selling, sublicensing and/or otherwise commercializing any Website material;
publicly performing and/or showing any Website material;
using this Website in any way that is or may be damaging to this Website;
using this Website in any way that impacts user access to this Website;
using this Website contrary to applicable laws and regulations, or in any way may cause
harm to the Website, or to any person or business entity;
engaging in any data mining, data harvesting, data extracting or any other similar activity in
relation to this Website;
using this Website to engage in any advertising or marketing.
Certain areas of this Website are restricted from being access by you and Namuduri may further
restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID
and password you may have for this Website are confidential and you must maintain confidentiality
as well.

4. Your Content
In these Website Standard Terms and Conditions, “Your Content” shall mean any audio, video
text, images or other material you choose to display on this Website. By displaying Your Content,
you grant Namuduri a non-exclusive, worldwide irrevocable, sub licensable license to use,
reproduce, adapt, publish, translate and distribute it in any and all media.
Your Content must be your own and must not be invading any third-party’s rights. Namuduri
reserves the right to remove any of Your Content from this Website at any time without notice.

5. No warranties
This Website is provided “as is,” with all faults, and Namuduri express no representations or
warranties, of any kind related to this Website or the materials contained on this Website. Also,
nothing contained on this Website shall be interpreted as advising you.

6. Limitation of liability
In no event shall Namuduri, nor any of its officers, directors and employees, shall be held liable for
anything arising out of or in any way connected with your use of this Website whether such liability
is under contract. Namuduri, including its officers, directors and employees shall not be held liable
for any indirect, consequential or special liability arising out of or in any way related to your use of
this Website.

7. Indemnification
You hereby indemnify to the fullest extent Namuduri from and against any and/or all liabilities,
costs, demands, causes of action, damages and expenses arising in any way related to your
breach of any of the provisions of these Terms.

8. Severability
If any provision of these Terms is found to be invalid under any applicable law, such provisions
shall be deleted without affecting the remaining provisions herein.

9. Variation of Terms
Namuduri is permitted to revise these Terms at any time as it sees fit, and by using this Website
you are expected to review these Terms on a regular basis.

10. Assignment
The Namuduri is allowed to assign, transfer, and subcontract its rights and/or obligations under
these Terms without any notification. However, you are not allowed to assign, transfer, or
subcontract any of your rights and/or obligations under these Terms.

11. Entire Agreement
These Terms constitute the entire agreement between Namuduri and you in relation to your use of
this Website, and supersede all prior agreements and understandings.

12. Governing Law & Jurisdiction
These Terms will be governed by and interpreted in accordance with the laws of the State of
SOUTH KOREA, and you submit to the non-exclusive jurisdiction of the state and federal courts
located in SOUTH KOREA for the resolution of any disputes.

            </textarea>
						</p>
						<br>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="cb2" checked="checked" disabled="disabled" />
							&nbsp;개인정보 취급방침에 동의합니다. AGREE
							<br>
							<br>
						</p>
						<p align="center">
						<div class="col-pjh-1 col-sm-6">
							<!-- 아이디============================================================================== -->
							<span class="form-row">
								<input type="text" placeholder="ID" id="member_id" name="member_id" maxlength="15" oninput="checkId()">
							</span>
							<div id="checkMsg"></div>
							<span>
								<input type="button" name="idChk" value="중복확인" onclick="javascript:openIdCheck(this.form)" class="btn-default" style="height: 20px; margin-top: 5px; margin-left: 10px;" />
							</span>
							<!-- 비밀번호============================================================================== -->
							<p class="form-row" style="margin-top: 6px;">
								<input type="password" id="member_pw" name="member_pw" maxlength="16" placeholder="PASSWORD">
							</p>
							<!-- 비밀번호 확인============================================================================== -->
							<p class="form-row">
								<input type="password" id="passwordCheck" maxlength="16" placeholder="PASSWORD CONFIRM" onkeyup="passWorkCheck();" />
								&nbsp;
								<span id="passwordCheckText"></span>
							</p>
							<!-- 이름============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_name" placeholder="NAME">
							</p>
							<!-- 주민등록번호============================================================================== -->
							<p class="form-row">
								<span class="form-row">
									<input type="text" maxlength="6" name="member_jumin1" placeholder="REGISTRATION NUMBER">
								</span>
								-
								<span class="form-row">
									<input type="password" maxlength="7" name="member_jumin2" placeholder="REGISTRATION NUMBER2">
								</span>
							</p>
							<!-- 우편번호============================================================================== -->
							<p class="form-row" style="margin-bottom: 0px;">
								<input type="text" name="member_zipcode" placeholder="ZIP CODE" readonly>
							</p>
							<input type="button" name="zipcode" value="우편번호" onclick="javascript:openZipCheck(this.form)" class="btn-default" style="height: 20px; margin-top: 5px; margin-left: 10px;" />
							<!-- 주소============================================================================== -->
							<p class="form-row" style="margin-top: 6px;">
								<input type="text" name="member_addr1" placeholder="ADDRESS">
							</p>
							<!-- 나머지 주소============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_addr2" placeholder="The remaining ADDRESS">
							</p>
							<!-- 일반전화============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_phone" maxlength="11" placeholder="PHONE NUMBER">
							</p>
							<!-- 휴대전화============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_mobile" maxlength="11" placeholder="MOBILE NUMBER">
							</p>
							<!-- 이메일============================================================================== -->
							<p class="form-row" style="margin-bottom: 0px;">
								<input type="text" id="member_email" name="member_email" placeholder="E-MAIL">
							</p>
							<input type="checkbox" name="member_email_get" value="on" style="margin-top: 5px; margin-left: 10px;" />
							동의함 YES, AGREE
							<font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?AGREE?</font>
						</div>
						<h4 class="h4_member margin_top15" style="margin-top: 25px;">Optional Inputs</h4>
						<div>
							<!-- 은행명============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_bankname" placeholder="BANKNAME ( 환불용 계좌 )">
							</p>
							<!-- 환불계좌============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_refund_account" placeholder="REFUND ACCOUNT (  - 빼고 입력하세요 )">
							</p>
							<!-- 예금주============================================================================== -->
							<p class="form-row">
								<input type="text" name="member_account_holder" placeholder="ACCOUNT HOLDER">
							</p>
						</div>
						<br />
						<br />
						<div class="subtotal-main-area">
							<a href="javascript:" onclick="window.location='loginForm.do';">CANCLE</a>
							<a href="javascript:check();">CREATE AN ACCOUNT</a>
						</div>
						<br />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Loging Area End -->
</body>
<script language="javascript">

//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var idCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkId() {
	
 var inputed = $('.member_id').val();
 $.ajax({
     data : {
       id : inputed
     },
     url : "idCheck.do",
     success : function(data) {
    	 
    	/*  if($.trim(data) == 0){
    		 $('#checkMsg').html('<p style="color:blue">사용가능한 아이디입니다.</p>');
    		 
    	 } else{
    		 $('#checkMsg').html('<p style="color:red">사용불가능한 아이디입니다.</p>');
    	 }
    	  */
         if(inputed=="" && data=='0') {
             $(".signupbtn").prop("disabled", true);
             $(".signupbtn").css("background-color", "#aaaaaa");
             $("#member_id").css("background-color", "#FFCECE");
             idCheck = 0;
         } else if (data == '0') {
             $("#member_id").css("background-color", "#B0F6AC");
             idCheck = 1;
             if(idCheck==1 && pwdCheck == 1) {
                 $(".signupbtn").prop("disabled", false);
                 $(".signupbtn").css("background-color", "#4CAF50");
                 signupCheck();
             } 
         } else if (data == '1') {
             $(".signupbtn").prop("disabled", true);
             $(".signupbtn").css("background-color", "#aaaaaa");
             $("#member_id").css("background-color", "#FFCECE");
             idCheck = 0;
         }
     }
 });
}
/* if($("#member_id").val() != ""){
    $("#member_id").keyup();
};

$("#member_id").keyup(function(){
    $.post("<c:url value="/member/memberInfo"/>"
            ,{"member_id" : $("#member_id").val()}
            , function(data){
            console.log(data);
        
        if(data =="true"){
            $("#duplicateResult").text("이미사용중인 아이디입니다.")
        }else{
            $("#duplicateResult").text("사용가능한 아이디입니다.")
        }
    });
}) */



function check() {
   var f = document.memberInfo;
   
   if(f.member_id.value == ""){
      alert("아이디를 입력해주십시오.");
      f.member_id.focus();
   }
   else if(f.member_pw.value == ""){
      alert("비밀번호를 입력해주십시오.");
      f.member_pw.focus();
      
   }
   else if(f.member_name.value == ""){
      alert("이름을 입력해주십시오.");
      f.member_name.focus();
      
   }
   else if(f.member_jumin1.value == ""){
      alert("주민등록번호를 입력해주십시오.");
      f.member_jumin1.focus();
      
   }
   else if(f.member_jumin2.value == ""){
      alert("주빈등록번호를 입력해주십시오.");
      f.member_jumin2.focus();
      
   }
   else if(f.member_zipcode.value == ""){
      alert("우편번호를 검색하여 입력해주십시오.");
      f.member_zipcode.focus();
      
   }
   else if(f.member_mobile.value == ""){
      alert("휴대전화를 입력해주십시오.");
      f.member_mobile.focus();
      
   }
   else if(f.member_email.value == ""){
	  alert("이메일을 입력해주십시오.");
	  f.member_email.focus();
	      
	}
   
   else {
   alert("회원가입 되었습니다.")
   f.action="<%=cp%>/member/memberInfo.do";
   f.submit();
   }   
   
}

function passWorkCheck(){
   var password = document.getElementById("member_pw").value;
   var passwordCheck = document.getElementById("passwordCheck").value;

   if(passwordCheck == ""){
      document.getElementById("passwordCheckText").innerHTML = ""
   } else if (password != passwordCheck) {
      document.getElementById("passwordCheckText").innerHTML = "<b><font color=red size=2pt> 비밀번호가 틀립니다. </font></b>"
   } else {
      document.getElementById("passwordCheckText").innerHTML = "<b><font color=blue size=2pt> 비밀번호가 일치합니다. </font></b>"
   }
}

function openIdCheck(){

   
   var id = document.getElementById("member_id").value;
   if(id == ""){
      alert("아이디를 입력해주십시오.");
      member_id.focus();
      return false;
   }
   var idUrl = 'http://localhost:8080/namuduri/member/idCheck.do?member_id='+ id;
   window.open(idUrl,"confirm", "toolbar=no, location=no, status=no, menubar=no," + "scrollbars=no, resizable=no, width=353, height=186");
   
}

function openZipCheck() {  
   
   var zipUrl = 'http://localhost:8080/namuduri/member/zipCheckForm.do';
   window.open(
         zipUrl,
         "confirm",
         "toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=603, height=236");
}

function validate(element,min,max) {              
    var len = element.value.length ;
  if ((len<min)||(len>max)) {
          alert(min + '자 이상 ' + max + '자 이하로 입력해야 합니다' ) ;
          element.style.borderColor="#FF0000";
          // 입력 필드의 경계선을 빨강으로 설정함
          element.focus();
          // 입력 필드로 포커스를 이동
  } 
   else  {
          element.style.borderColor="#ffffff";
          // 입력 필드의 경계선을 흰색으로 설정
 }
} 
</script>
</html>