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
                       
                            <h2 class="heading-title">
                            	J O I N
                            </h2>
                            <h3 class="bul_green02">Enter information</h3>
                     <p class="font_11">
					The information you entered will not be saved until you complete your subscription.</p>
                     <p class="font_11 margin_top5" style="color:#5282ca;">
					The member information you enter without collecting the resident registration number is very valuable information that identifies the member. 
					<br />
                    Please enter the latest information exactly as it will be used as your personal information for ID and password search
                     </p>
                        <br>
                        
                        <h3 height="23" colspan="5" align="center">TERMS AND CONDITIONS</h3>
                        <br>
               <p style="text-align: center;">
               <textarea class="junho3" cols="100%" style=" width: 70%; height: 265px; resize: none;" >
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
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="checkbox"
                  name="cb2" checked="checked" disabled="disabled" />
                  &nbsp;개인정보 취급방침에 동의합니다. AGREE
                  <br>
               <br>
            </p>
                  

                 
            <p align="center">
               
               <div class="col-pjh-1 col-sm-6">
               
               
              	  <!-- 아이디============================================================================== -->
                  	<span class="form-row"><input type="text" placeholder="ID" id="member_id" name="member_id" maxlength="15" oninput="checkId()"></span>
                  	<div id="checkMsg"></div>
                    <span><input type="button" name="idChk" value="중복확인" onclick="javascript:openIdCheck(this.form)" class="btn-default" style="height:20px; margin-top: 5px;margin-left: 10px;"/></span>
                     
                     
                     
                     
                  <!-- 비밀번호============================================================================== -->
                  
                     <p class="form-row" style="margin-top: 6px;">
                                <input type="password" id="member_pw" name="member_pw" maxlength="16" placeholder="PASSWORD">
                                
                     </p>
                     
                  <!-- 비밀번호 확인============================================================================== -->
                  
                     <p class="form-row">
                                <input type="password" id="passwordCheck" maxlength="16" placeholder="PASSWORD CONFIRM" onkeyup="passWorkCheck();"/>&nbsp;<span id="passwordCheckText"></span>
                     </p>
                    
                  <!-- 이름============================================================================== -->
                 
                     <p class="form-row">
                                <input type="text" name="member_name" placeholder="NAME">
                     </p>
                     
                  <!-- 주민등록번호============================================================================== -->
                  
                     <p class="form-row">
                                <span class="form-row"><input type="text" maxlength="6" name="member_jumin1" placeholder="REGISTRATION NUMBER"></span> - <span class="form-row"><input type="password" maxlength="7" name="member_jumin2" placeholder="REGISTRATION NUMBER2"></span>
                     </p>
                   
                  <!-- 우편번호============================================================================== -->
                  
                     <p class="form-row"  style="margin-bottom: 0px;">
                                <input type="text" name="member_zipcode" placeholder="ZIP CODE" readonly>
                                
                     </p>
                     <input type="button" name="zipcode" value="우편번호" onclick="javascript:openZipCheck(this.form)" class="btn-default" style="height:20px; margin-top: 5px;margin-left: 10px;"/>
                     
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
                 
                     <p class="form-row"  style="margin-bottom: 0px;">
                                <input type="text" id="member_email" name="member_email" placeholder="E-MAIL">
                                
                     </p>
                     <input type="checkbox" name="member_email_get" value ="on" style=" margin-top: 5px;margin-left: 10px;"/> 동의함 YES, AGREE
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
               
        			<br/>
        			<br/>
                           
                            <div class="subtotal-main-area">					 
                            	
                                
                                <a href="javascript:" onclick="window.location='loginForm.do';">CANCLE</a>
                                
                                <a href="javascript:check();" >CREATE AN ACCOUNT</a>
                                
                            </div>                          
                            <br/>
                            
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
	            //input[name=member_id]
 var inputed = $('input[name=member_id]').val();

 $.ajax({
     data : {
       member_id : inputed
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
             $("#name=member_id").css("background-color", "#FFCECE");
             idCheck = 0;
         } else if (data == '0') {
             $("#name=member_id").css("background-color", "#B0F6AC");
             idCheck = 1;
             if(idCheck==1 && pwdCheck == 1) {
                 $(".signupbtn").prop("disabled", false);
                 $(".signupbtn").css("background-color", "#4CAF50");
                 signupCheck();
             } 
         } else if (data == '1') {
             $(".signupbtn").prop("disabled", true);
             $(".signupbtn").css("background-color", "#aaaaaa");
             $("#name=member_id").css("background-color", "#FFCECE");
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
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 폼</title>
<link href="<%=cp %>/css/style1.css"  rel="stylesheet" type="text/css" />
<script language="javascript">
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
      f.member_email1.focus();      
   }
   else {
   alert("회원가입 되었습니다.")
   f.action="Info.do";
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
</head>
<body>
<div id="contents"><br><br>
<h2 class="h2_member" style="width:1000px;margin:0 auto;"><img src="member/images/memberInfo2.png" alt="회원가입"></h2>
<div class="member_content" style="width: 1000px; margin-left: 0px;">
<br><br><br>
<h3 class="bul_green02">정보입력</h3>
                     <p class="font_11">입력하신 정보는 가입완료 전까지 저장되지 않습니다.</p>
                     <p class="font_11 margin_top5" style="color:#5282ca;">주민번호를 수집하지 않으면서 회원님이 입력한 회원정보는 회원을 식별하는 매우 소중한 정보가 됩니다.<br />
                        입력하신 회원정보는 아이디, 비밀번호 찾기 시 본인확인용 정보로 사용되기 때문에 최신의 정보를 정확히 입력해 주시기 바랍니다.</p>
                        <br>
                        
                        <h3 height="23" colspan="5" align="center">이용약관</h3>
                        <br>
                        
               <table border="0" class="junho2">
                           
            
            <tr>
               <td colspan="2"><textarea class="junho3" rows="10" cols="90%" style="margin: 0px; width: 988px; height: 265px;">
1장 총칙

 제1조 (목적) 
 이 약관은 Namuduri (이하 "KH"라 합니다) 홈페이지가 제공하는 통합회원 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용자와 KH간의 권리·의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

 제2조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면에 게시하거나 기타의 방법으로 공지함으로써 이용자에게 공시하고, 이에 동의한 이용자가 서비스에 가입함으로써 효력이 발생합니다.
② KH는 필요하다고 인정되는 경우 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 서비스 화면에 공지함으로써 이용자가 직접 확인할 수 있도록 할 것입니다.
③ 이용자는 변경된 약관에 동의하지 않으실 경우 서비스 이용을 중단하고 본인의 회원등록을 취소할 수 있으며, 계속 사용하시는 경우에는 약관 변경에 동의한 것으로 간주되며 변경된 약관은 전항과 같은 방법으로 효력이 발생합니다.
④ 이용자가 이 약관의 내용에 동의하는 경우 KH의 서비스 제공행위 및 이용자의 서비스 이용행위에는 이 약관이 우선적으로 적용될 것입니다. 이 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법, 정보통신망이용촉진및정보보호등에관한법률, 방송통신심의위원회 심의규정, 정보통신 윤리강령, 프로그램 보호법 등 기타 대한민국의 관련법령과 상관습에 의합니다.

 제3조 (용어의 정의)
① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 이용자 : 서비스에 접속하여 KH가 제공하는 서비스를 받는 회원 및 비회원
2. 가입 : KH가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
3. 회원 : 서비스에 접속하여 이 약관에 동의하고, ID(고유번호)와 PASSWORD(비밀번호)를 발급 받아 문자 인증 등 확인 절차를 거친 자
4. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 이용자가 선정하고 KH가 승인하는 영문자와 숫자의 조합
5. PASSWORD(비밀번호) : 회원의 정보 보호를 위해 이용자 자신이 설정한 문자와 숫자의 조합
6. 이용해지 : KH 또는 회원이 서비스 이용 이후 그 이용계약을 종료시키는 의사표시
② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령 및 서비스별 안내에서 정하는 바에 의합니다.


 2장 서비스 이용계약

 제4조 (이용계약의 성립) 이용계약은 이용자의 약관내용에 대한 동의와 이용자의 이용신청에 대한 KH의 승낙으로 성립합니다.

 제5조 (이용신청) 이용신청은 서비스의 회원정보 화면에서 이용자가 KH에서 요구하는 가입신청 양식에 개인의 신상정보를 기록하는 방식으로 신청합니다.

 제6조 (이용신청의 수락과 거절)
① KH는 제5조에서 정한 사항을 정확히 기재하여 이용신청을 하였을 경우 특별한 사정이 없는 한 서비스 이용신청을 수락합니다.
② KH는 다음 각 호에 해당하는 경우에 대하여는 그 신청에 대한 제한 사유가 해소될 때까지 일부 서비스 이용을 제한할 수 있습니다.
1. 내용이 허위(차명, 비실명, 주민등록번호 도용 등)인 것으로 판명되거나, 그러하다고 의심할만한 합리적인 사유가 발생할 경우
2. 기타 KH가 필요하다고 인정되는 경우
③ KH는 다음에 해당하는 경우에는 이용신청을 제한할 수 있습니다.
1. 본인의 실명으로 신청하지 않았을 때
2. 다른 사람의 명의를 사용하여 신청하였을 때
3. 신청서의 내용을 허위로 기재하였을 때
4. 사회의 안녕 질서 또는 미풍양속을 저해할 목적으로 신청하였을 때
5. 기타 KH가 정한 이용신청 요건이 미비 되었을 때

 제7조 (계약사항의 변경) 회원은 회원정보관리를 통해 언제든지 자신의 정보를 열람하고 수정할 수 있습니다. 회원은 이용신청 시 기재한 사항이 변경되었을 때에는 수정을 하여야 하며, 수정하지 아니하여 발생하는 문제의 책임은 회원에게 있습니다.


 3장 서비스 제공 및 이용

 제8조 (서비스 이용)
① KH는 회원의 이용신청을 수락한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다.
② KH의 업무상 또는 기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 사이트에 공시하거나 회원에게 이를 통지합니다.
③ 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, KH의 업무상 또는 기술상의 이유로 서비스가 일시 중지될 수 있고, 또한 정기점검 등 운영상의 목적으로 KH가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 KH는 사전 또는 사후에 이를 공지합니다.
④ 회원에 가입한 후라도 일부 서비스 이용 시 서비스 제공자의 요구에 따라 특정 회원에게만 서비스를 제공할 수도 있습니다.
⑤ KH는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다.

 제9조 (서비스의 변경, 중지 및 정보의 저장과 사용)
① 회원은 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, KH의 관리범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실에 대해 KH가 아무런 책임을 지지 않음에 동의합니다.
② KH가 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일전에 고지 후 서비스를 중지할 수 있으며, 이 기간동안 회원이 고지내용을 인지하지 못한데 대하여 KH는 책임을 부담하지 아니합니다. 상당한 이유가 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다.
또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 KH는 책임을 부담하지 아니합니다.
③ KH의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제2항을 준용합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.
④ KH는 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 회원 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.
⑤ KH는 회원이 이 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 중지할 수 있습니다. 이 경우 KH는 회원의 접속을 금지할 수 있으며, 회원이 게시한 내용의 전부 또는 일부를 임의로 삭제할 수 있습니다.
⑥ 장기간 휴면 회원인 경우 안내 메일 또는 공지사항 발표 후 1주일간의 통지 기간을 거쳐 서비스 사용을 중지할 수 있습니다.

 제10조 (정보의 제공 및 광고의 게재)
① KH는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보 및 광고에 대해서는 전자우편이나 서신우편, SMS(휴대폰 문자메시지), DM, 메신저 등의 방법으로 회원에게 제공할 수 있으며, 만약 원치 않는 정보를 수신한 경우 회원은 이를 수신거부 할 수 있습니다.
② KH는 서비스의 운용과 관련하여 서비스화면, 홈페이지, 전자우편 등에 광고 등을 게재할 수 있으며, KH는 서비스를 이용하고자 하는 회원이 이 광고게재에 대하여 동의하는 것으로 간주합니다.
③ KH는 서비스 상에 게재되어 있거나 서비스를 통한 광고주와의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다

 제11조 (게시물 또는 내용물의 삭제)
① KH는 회원이 게시하거나 등록하는 서비스 내의 모든 내용물이 다음 각 호의 경우에 해당된다고 판단되는 경우 사전 통지 없이 삭제할 수 있으며, 이에 대해 KH는 어떠한 책임도 지지 않습니다.
1. KH, 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우
2. 공공질서 및 미풍양속에 위반되는 내용인 경우
3. 범죄적 행위에 결부된다고 인정되는 내용일 경우
4. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
5. 서비스 성격에 부합하지 않는 정보의 경우
6. 기타 관계 법령 및 KH에서 정한 규정 등에 위배되는 경우
② KH는 서비스에 게시된 내용을 사전 통지된 지 3일 이후 편집, 이동, 삭제할 수 있는 권리를 보유하며, 게시된 내용이 이 약관에 위배되거나 상용 또는 비합법적, 불건전한 내용일 경우 및 해지 회원이 게시한 게시물은 사전통보 없이 삭제할 수 있습니다.
③ KH는 게시된 내용이 일정기간 이상 경과되어, 게시물로써의 효력을 상실하여 그 존치 목적이 불분명한 경우 공지사항 발표 후 1주일간의 통지기간을 거쳐 해당 게시물을 삭제할 수 있습니다.

 제12조 (게시물의 저작권)
① 회원이 서비스 내에 게시한 게시물의 저작권은 회원에게 있으며, KH는 다른 서비스에서의 개재 등 활용할 수 있습니다.
② 회원의 게시물이 타인의 저작권, 프로그램 저작권 등을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다.
③ 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.

 제13조 (KH의 소유권)
① KH가 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타권리는 KH에게 소유권이 있습니다.
② 회원은 KH가 명시적으로 승인한 경우를 제외하고는 제1항 소정의 각 재산에 대한 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정행위, 상업적 이용행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.


 4장 계약 당사자의 의무

 제14조 (회원의 의무 및 정보보안)
① 회원은 서비스 이용을 위해 가입할 경우 현재의 사실과 일치하는 완전한 정보(이하 "가입정보"라 합니다)를 제공하셔야 합니다. 또한 가입정보에 변경이 발생할 경우 즉시 갱신하셔야 합니다.
② 회원이 서비스 사용을 위한 가입절차를 완료하시면 아이디와 비밀 번호를 받게 됩니다. 회원의 아이디, 비밀번호 관리를 위해
1. 회원의 승인 없이 비밀번호, 아이디가 사용되는 문제가 발생되면 즉시 KH에 신고하셔야 하고
2. 매 접속 종료 시 확실히 로그아웃을 하셔야 합니다.
③ 회원은 서비스를 이용하면서 다음과 같은 행위를 하지 않기로 동의합니다.
1. 타인(소수를 포함)에게 위해를 가하는 행위
가. 타인의 ID, PASSWORD, 주민등록번호 도용 및 타인으로 가장하는 행위
나. 타인과의 관계를 허위로 명시하는 행위
다. 타인을 비방할 목적으로 사실 또는 허위의 사실을 적시하여 명예를 훼손하는 행위
라. 자기 또는 타인에게 재산상의 이익을 주거나 타인에게 손해를 가할 목적으로 허위의 정보를 유통시키는 행위
마. 수치심이나 혐오감 또는 공포심을 일으키는 말이나 음향, 글이나 화상 또는 영상을 계속하여 상대방에게 도달하게 하여 상대방의 일상적 생활을 방해하는 행위
바. KH의 사전 승낙 없이 서비스를 이용한 영리행위
사. 타인의 정보통신서비스 이용명의를 도용하여 사용하는 행위
2. 불필요하거나 승인되지 않은 광고, 판촉물을 게재하거나, "정크 메일(junk mail)", "스팸(spam)", "행운의 편지(chain letters)", "도배글", "피라미드 조직" 등을 권유하거나 게시, 게재 또는 전자우편으로 보내는 행위
3. 저속 또는 음란한 데이터, 텍스트, 소프트웨어, 음악, 사진, 그래픽, 비디오 메시지 등(이하 "콘텐츠")을 게시, 게재 또는 전자우편으로 보내는 행위
4. 권리(지적재산권을 포함한 모든 권리)가 없는 콘텐츠를 게시, 게재 또는 전자우편으로 보내는 행위
5. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비를 파괴, 방해 또는 기능을 제한하기 위한 소프트웨어 바이러스를 게시, 게재 또는 전자우편으로 보내는 행위
6. 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시, 게재, 전자우편으로 보내는 행위 등 다른 사용자의 개인정보를 수집 또는 저장하는 행위
7. 재물을 걸고 도박하거나 사행행위를 하는 행위
8. 윤락행위를 알선하거나 음행을 매개하는 내용의 정보를 유통시키는 행위
9. 기타 불법적이거나 부당한 행위
④ 회원은 이 약관 및 관계법령에서 규정한 사항을 준수하여야 합니다.

 제15조 (KH의 의무)
① KH는 특별한 사정이 없는 한 회원이 신청한 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다.
② KH는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다.
③ KH가 제공하는 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 KH의 고의나 중과실에 기해 발생한 경우에 한하여 KH에서 책임을 부담하며, 그 책임의 범위는 통상손해에 한합니다.
④ KH는 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 신속히 처리하여야 합니다. 다만, 신속한 처리가 곤란한 경우에는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
⑤ KH는 관련법령이 정하는 바에 따라서 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관해서는 관련법령 및 제 16조에 제시된 내용을 지킵니다.

 제16조 (개인정보보호정책)
① KH는 이용 신청 시 회원이 제공하는 정보를 통하여 회원에 관한 정보를 수집하며, 회원의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을 위한 목적으로 이용합니다.
② KH는 서비스 제공과 관련하여 취득한 회원의 정보를 본인의 승낙 없이 제3자에게 누설 또는 배포할 수 없으며 상업적 목적으로 사용할 수 없습니다. 다만, 다음의 각 호의 경우에는 그러하지 아니합니다.
1.관계 법령에 의하여 수사상의 목적으로 관계기관으로부터 요구가 있는 경우
2.방송통신심의위원회의 요청이 있는 경우
3.기타 관계법령에서 정한 절차에 따른 요청이 있는 경우


 5장 계약해지

 제17조 (계약해지 및 이용제한)
① 회원이 이용계약을 해지하고자 하실 때에는 회원 본인이 직접 인터넷을 통해 당 사이트에 해지 신청을 하여야 합니다.
② KH는 보안 및 아이디 정책, 서비스의 원활한 제공 등과 같은 이유로 회원의 ID 및 PASSWORD 변경을 요구하거나 변경 할 수 있습니다.
③ KH는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지할 수 있습니다.
1. 비 실명가입, 주민등록번호의 도용 등 회원이 제공한 데이터가 허위임이 판명된 경우
2. 범죄적 행위에 관련되는 경우
3. 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우
4. 타인의 서비스 아이디 및 비밀 번호를 도용한 경우
5. 타인의 명예를 손상시키거나 불이익을 주는 경우
6. 서비스에 위해를 가하는 등 서비스의 건전한 이용을 저해하는 경우
7. 기타 관련법령이나 KH가 정한 이용조건에 위배되는 경우


 6장 기타

 제18조 (요금 및 유료정보)
서비스 이용은 기본적으로 무료입니다. 단, 서비스에서 정한 별도의 유료 정보와 유료서비스에 대해서는 그러하지 아니합니다.

 제19조 (양도금지)
회원은 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.


 7장 손해배상 등

 제20조 (손해배상) KH는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 동 손해가 KH의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 부담하지 아니합니다.

 제21조 (면책조항)
① KH는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
② KH는 회원의 귀책사유로 인한 서비스이용의 장애에 대하여 책임을 지지 않습니다.
③ KH는 회원이 서비스를 이용하여 기대하는 이익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
④ KH는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.

 제22조 (관할법원)
① 서비스 이용과 관련하여 KH와 회원 사이에 분쟁이 발생한 경우, KH와 회원은 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다
② 제1항의 규정에도 불구하고 서비스 이용으로 발생한 분쟁에 대하여 소송이 제기될 경우 KH 소재지를 관할하는 법원을 관할법원으로 합니다.


 부 칙
(시행일) 이 약관은 2017년 9월 20일부터 적용합니다.
            </textarea><br></td>
            </tr>
            <tr>
               <td colspan="2" height="23" align="left"> 
               &nbsp;<input type="checkbox" name="cb1" checked="checked"
                  disabled="disabled" />
                  &nbsp;이용약관에 동의합니다.
                  <br>
               <br>
               </td>
            </tr>
            <tr>
               <td class="BTD2" height="23" colspan="5" align="center"><h3>개인정보취급방침</h3><br>
               </td>
            </tr>
            <tr>
               <td colspan="2"><textarea class="junho3" rows="10" cols="90%" style="margin: 0px; width: 988px; height: 265px;">
KH는 회원님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.

KH는 개인정보취급방침을 통하여 회원님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

KH는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.


 1. 수집하는 개인정보의 항목
KH는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
ο 수집항목 : 이름 , 로그인ID , 비밀번호 , 이메일 , 서비스 이용기록 , 접속 로그 , 쿠키 , 접속 IP 정보
ο 개인정보 수집방법 : 홈페이지(회원가입)

 2. 개인정보의 수집 및 이용목적
KH는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
ο 회원 관리
- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 불만처리 등 민원처리, 고지사항 전달
ο 마케팅 및 광고에 활용
- 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

 3. 개인정보의 보유 및 이용기간
KH는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.

 4. 개인정보의 파기 절차 및 방법
KH는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
ο 파기절차
- 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
ο 파기방법
- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

 5. 개인정보 제공
KH는 회원님의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
- 회원님이 사전에 동의한 경우
- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

 6. 수집한 개인정보의 위탁
KH는 회원님의 동의없이 개인정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 회원님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.

 7. 이용자 및 법정대리인의 권리와 그 행사방법
이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
이용자 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’ 등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.
회원님이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.
또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
KH는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “KH가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

 8. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한사항
KH는 회원님의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다.
쿠키란 KH의 웹사이트를 운영하는데 이용되는 서버가 회원님의 브라우저에 보내는 아주 작은 텍스트 파일로서 회원님의 컴퓨터 하드디스크에 저장됩니다.
KH는 다음과 같은 목적을 위해 쿠키를 사용합니다.

▶ 쿠키 등 사용 목적
- 회원님의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
- 회원님은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 회원님의 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.

▶ 쿠키 설정 거부 방법
예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.

설정방법 예(인터넷 익스플로어의 경우)
: 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
단, 회원님께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

 9. 개인정보에 관한 민원서비스
KH는 회원님의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다..

개인정보관리책임자 성명 : 전민기
이메일 : Mingi@naver.com

회원님께서는 KH의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.
KH는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
1.개인정보침해신고센터 (www.1336.or.kr/국번없이 118)
2.정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)
3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)
4.경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)
            </textarea><br></td>
            </tr>
            <tr>
               <td colspan="2" height="23" align="left">
                  &nbsp;&nbsp;<input type="checkbox"
                  name="cb2" checked="checked" disabled="disabled" />
                  &nbsp;개인정보 취급방침에 동의합니다.
                  <br>
               <br>
               </td>
            </tr>
                  </table>
                     <br><h4 class="h4_member margin_top15">&nbsp;&nbsp;필수입력사항</h4>
<div id="junho">            
<table class="table_style01"  width="1080" cellspacing="0" border="0" align="center">
   <tr>
      <td colspan="2">      
         <form name="memberInfo" action="./memberInfo.do" method="post" onsubmit="return check()">
            <table>
            <p align="center">
               
               <table border="0" style="width: 980px;">
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                           &nbsp;&nbsp;아이디
                           <font size="2" color="#ff3f3f">*</font>                              
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_id" id="member_id" size="20" maxlength="15"/>
                        <input type="button" name="idChk" value="중복확인" onclick="javascript:openIdCheck(this.form)" class="btn_small3" style=" height: 20px;"/>
                              <font size="1" color="#ff3f3f">&nbsp;&nbsp;(영문대소문자/숫자, 4~16자)</font>
                     </td>                     
                  </tr>                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                           &nbsp;&nbsp;비밀번호
                           <font size="2" color="#ff3f3f">*</font>
                        </font>
                     </td>
                     <td colspan="2">
                        &nbsp;&nbsp;&nbsp;
                        <input type="password" name="member_pw" id="member_pw" size="21" maxlength="16" minlength="4" />
                              <font size="1" color="#ff3f3f">&nbsp;&nbsp;(영문 대소문자/숫자, 4~16자)</font>
                     </td>
                  </tr>
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                           &nbsp;&nbsp;비밀번호확인
                           <font size="2" color="#ff3f3f">*</font>
                        </font>                        
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="password" id="passwordCheck" size="21"  onkeyup="passWorkCheck();"/>&nbsp;<span id="passwordCheckText"></span>
                     </td>
                  </tr>
                  <tr>
                     <td style="width: 100px;" >
                        <font size="2">
                           &nbsp;&nbsp;이름
                           <font size="2" color="#ff3f3f">*</font>
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_name" size="20"/>
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                           &nbsp;&nbsp;주민등록번호
                           <font size="2" color="#ff3f3f">*</font>
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_jumin1" size="12" maxlength="6"/> -
                        <input type="text" name="member_jumin2" size="12" maxlength="7"/>
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2"></font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_zipcode" size="7" readonly/> 
                        <input type="button" name="zipcode" value="우편번호" onclick="javascript:openZipCheck(this.form)" class="btn_small3" style="height: 20px;"/>
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                           &nbsp;&nbsp;주소
                           <font size="2" color="#ff3f3f">*</font>
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_addr1" size="50" />
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                        &nbsp;&nbsp;
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_addr2" size="50"/>
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                        &nbsp;&nbsp;일반전화
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_phone" maxlength="11"/>
                           <font size="1" color="#ff3f3f">
                                  &nbsp;&nbsp;(일반전화가 없을 경우 휴대전화를 기재해주세요)
                           </font>
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                        &nbsp;&nbsp;휴대전화
                        <font size="2" color="#ff3f3f">*</font>
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_mobile" maxlength="11"/>
                           
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 100px;">
                        <font size="2">
                           &nbsp;&nbsp;이메일
                           <font size="2" color="#ff3f3f">
                                 *
                           </font>
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_email" size="19"/>@
                        <input type="text" name="member_email1" size="19"/>
                        <input type="checkbox" name="member_email_get" value ="on" /> 동의함
                        <font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?</font>
                     </td>
                  </tr>
                  
               </table>
         <table>
            <h4 class="h4_member margin_top15">선택입력사항</h4>
            
               
               <table border="0" style="width: 980px;">
               
                  <tr>
                     <td style="width: 95px;">
                        <font size="2">
                        &nbsp;&nbsp;은행명
                        </font>
                        
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_bankname" size="20"/>&nbsp;&nbsp; (환불용계좌)
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 95px;">   
                        <font size="2">
                        &nbsp;&nbsp;환불계좌
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_refund_account" size="30"/>
                        <font size="1">&nbsp;&nbsp;( - 빼고 입력하세요.)</font>
                     </td>
                  </tr>
                  
                  <tr>
                     <td style="width: 95px;">
                        <font size="2">
                        &nbsp;&nbsp;예금주
                        </font>
                     </td>
                     <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="member_account_holder" size="20"/>
                     </td>
                  </tr>
               </table>
         </table>
            
                  <tr>
                     <td colspan="2" align="center"><br><br>
                        <a href ="javascript:check();"><img src="<%=cp %>/img/member/btn_ok.gif" value="회원가입" class="button"/></a>
                           &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href = "javascript:window.location='loginForm.do';"><img src="<%=cp %>/img/member/btn_cancel.gif" value="가입취소" class="button" /></a>
                        <br>
                     </td>
                  </tr>
               
            </table>
         </form>
   </table>
</div>
</div>
</div>
</body>
</html> --%>