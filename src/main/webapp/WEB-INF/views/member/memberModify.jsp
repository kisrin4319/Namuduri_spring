<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>MODIFY MEMBER</title>
<meta name="description" content="">
<meta name="viewport" cotent="width=device-width, initial-scale=1">
<%-- <link rel = "stylesheet" href ="<%=cp%>/css/style1.css" type="text/css" /> --%>
<script type="text/javascript">
		
	function passWorkCheck(){
		var password = document.getElementById("password").value;
		var passwordCheck = document.getElementById("passwordCheck").value;
	
		if(passwordCheck == ""){
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
		
		if(password != '' && passwordCheck != ''){
			if(password == passwordCheck){

			}
		}
		
		//체크박스를 선택하지 않았을때
		if($('input:checkbox[name="member_email_get"]').is(":checked") == false){
			$('input:checkbox[name="member_email_get"]').val('NO');
		} 

			if(password == ''){
				alert('비밀번호를 입력해 주세요.');
				return false;
			}if(passwordCheck == ''){
				alert('비밀번호를 확인해 주세요.');
				return false;
			}
			if(password == passwordCheck){	
				$.ajax({
		            url:'/namuduri/member/memberModify.do',
		            type:'post',
		            data:$('form').serialize(),
		            success:function(result){
		            	if(result.returnVal == '1'){
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
		window.open(
				zipUrl,
				"confirm",
				"toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=610, height=250");
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
					<div class="col-md-2 col-sm-3 col-xs-12">
						<div class="shop-widget">
							<div class="shop-widget-top">
								<aside class="widget widget-categories">
									<h2 class="sidebar-title text-center">CATEGORY</h2>
									<ul class="sidebar-menu">
										<li>
											<a href="<%=cp%>/mypage.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">MY PAGE</p>
											</a>
										</li>
										<li>
											<a href="<%=cp%>/order/orderListCheckView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">주문/배송 조회</p>
											</a>
										</li>
										<li>
											<a href="<%=cp%>/member/memberDeleteView.do">
												<!-- <i class="fa fa-angle-double-right"></i> -->
												<p class="text-left">회원 탈퇴</p>
											</a>
										</li>
									</ul>
								</aside>
							</div>
						</div>
					</div>
					
					<div class="col-md-9 col-sm-12 hidden-xs">
						<div class="mainmenu text-center">
						<table class="table">
							<thead>
								<tr>
									<th>회원 정보를 수정할 수 있는 페이지입니다.</th>
								</tr>
							</thead>
						</table>
						<form name="memberInfo" class="form-inline" id="memberInfo" onsubmit="return check()">
							<table class="table">
									<tr>
										<th style="vertical-align: middle"><font size="2" class="text-center">아이디 <font size="2"
												color="#ff3f3f">*</font>
										</font></td>
										<td style="width:35%">
											<div class="form-group">
											<input type="text" class="form-control" name="member_id" id="member_id" maxlength="16" value="${memberInfo.member_id }" /> 
											</div>
										</td>
										<td style="width:35%; vertical-align: middle">
											<font class="text-center" size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
										</td>
									</tr>
									<tr>
										<th style="vertical-align: middle"><font size="2">비밀번호 <font
												size="2" color="#ff3f3f">*</font>
										</font></th>
										<td style="width:35%">
											<div class="form-group">
											<input type="password" class="form-control" name="member_pw" id="password" /> 
											</div>
										</td>
										<td style="width:35%; vertical-align: middle">
											<font size="2" color="#ff3f3f">(영문 대소문자/숫자, 4~16자)</font>
										</td>
									</tr>
									<tr>
										<th style="vertical-align: middle">
											<font size="2">비밀번호 확인</font>
									 		<font size="2" color="#ff3f3f">*</font>
											
										</th>
										<td style="width:35%">
											<input type="password" class="form-control" id="passwordCheck" onkeyup="passWorkCheck();"/>
											<!-- <span id="passwordCheckText"></span> -->
										</td>
										<td style="width:35%; vertical-align: middle"><span id="passwordCheckText"></span>
											&nbsp;
										</td>	
									</tr>
									<tr>
										<th style="vertical-align: middle"><font size="2">이름 <font
												size="2" color="#ff3f3f">*</font>
										</font></th>
										<td style="width:35%">
											<div class="form-group">
												<div class="col-xs-4">
													<input type="text" class="form-control" name="member_name" value="${memberInfo.member_name }" />
												</div>
											</div>
										</td>
										<td style="width:35%; vertical-align: middle">
											&nbsp;
										</td>
									</tr>
									<tr>
										<th style="vertical-align: middle"><font size="2">주민등록번호 <font
												size="2" color="#ff3f3f">*</font>
										</font>
										</th>
										<td colspan="2" style="vertical-align: middle">
											<div class="form-group">
												<!-- <div class="col-xs-4"> -->
													<input type="text" class="form-control" name="member_jumin1" maxlength="6" value="${memberInfo.member_jumin1 }" />
													
												<!-- </div> -->
											</div>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<div class="form-group">
												<!-- <div class="col-xs-4"> -->
													<input type="text" class="form-control" name="member_jumin2" maxlength="7" value="${memberInfo.member_jumin2 }" />
												<!-- </div> -->
											</div>
										</td>
										<!-- <td style=" vertical-align: middle">
											&nbsp;
										</td> -->
									</tr>
									<tr>
										<th style="vertical-align: middle"><font size="2">주소 <font size="2"
												color="#ff3f3f"> * </font>
										</font></th>
										<td style="width:35%">
											<input type="text" class="form-control" name="member_zipcode" value="${memberInfo.member_zipcode }" />
										</td>
										<td style="width:35%">
											<input type="button" class="btn" name="zipcode" value="우편번호" onclick="openZipCheck()" />	 
											<%-- <input type="text" class="form-control" name="member_addr1" size="50" value="${memberInfo.member_addr1 }" /> 
											<input type="text" class="form-control" name="member_addr2" size="50" value="${memberInfo.member_addr2 }" /> --%>
										</td>
									<tr>
										<th style="vertical-align: middle">
											<td style="width:35%">		 
												<input type="text" class="form-control" name="member_addr1" value="${memberInfo.member_addr1 }" /> 
												<input type="text" class="form-control" name="member_addr2" value="${memberInfo.member_addr2 }" />
											</td>
										</th>
									</tr>
									

									<!-- <tr>
										<th style="vertical-align: middle"><font size="2"> &nbsp;&nbsp;기본주소 뒤로가야하는데
										</font></td>
										<td>
											<input type="button" class="btn" name="zipcode" value="우편번호" onclick="openZipCheck()" style="height: 20px;" />
										</td>
									</tr> -->

									<tr>
										<th style="vertical-align: middle"><font size="2">일반전화 </font></th>
										<td>
											<input type="text" class="form-control" name="member_phone" value="${memberInfo.member_phone }" /> 		
										</td>
										<td style="width:35%; vertical-align: middle">
											<font size="2" color="#ff3f3f"> (일반전화가 없을 시 휴대전화를 기재해주세요.) </font>
										</td>
									</tr>

									<tr>
										<th style="vertical-align: middle"><font size="2">휴대전화 <font
												size="2" color="#ff3f3f"> * </font>
										</font></th>
										<td>
											<input type="text" class="form-control" name="member_mobile" value="${memberInfo.member_mobile }" />
										</td>
									</tr>

									<tr>
										<th style="vertical-align: middle"><font size="2">이메일 <font size="2"
												color="#ff3f3f"> * </font>
										</font></th>
										<td>
											<input type="text" class="form-control" name="member_email" value="${memberInfo.member_email }" /> 					
										</td>
										<td>
											<input type="checkbox" class="form-control" name="member_email_get" value="YES" /> 동의함 <font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?</font>
										</td>
									</tr>
								</table>				
							</form>
						</div>
					</div>
					
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
			</div>
		</div>
</body>
<%-- <body>
<div id ="contents"><br><br>
<div class="member_content" style="width: 800px;">
<h3 class="bul_green02">회원정보 수정</h3>
<table class="table_style01"  width="1080" cellspacing="0" border="0" align="center">
<tr>
	<td colspan="2">
	<form name ="memberInfo" id="memberInfo" action="./memberModify.do" method="post" onsubmit="return check()">
			
		<table>
			<p align="center">
				<table border="0" style="width:980px;">
			
					<tr>
						<td>
							<font size="2">
							&nbsp;&nbsp;아이디
								<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="text" name="member_id" id="member_id" size="20" maxlength="16" value="${memberInfo.member_id }"/>
							<font size="2" color="#ff3f3f">(영문소문자/숫자, 4~16자)</font>
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">
							&nbsp;&nbsp;비밀번호
								<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="password" name="member_pw" id="password" size="21"/>
								<font size="2" color="#ff3f3f">(영문 대소문자/숫자, 4~16자)</font>
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">
								&nbsp;&nbsp;비밀번호 확인
								<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" size="21" id="passwordCheck" onkeyup="passWorkCheck();"/><span id="passwordCheckText"></span>
						</td>																
					</tr>
					<tr>
						<td width="17%" >
							<font size="2">
									&nbsp;&nbsp;이름
									<font size="2" color="#ff3f3f">*</font>
							</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="text" name="member_name" size="20" value="${memberInfo.member_name }"/>
						</td>
					</tr>
					<tr>
						<td>
							<font size="2">
								&nbsp;&nbsp;주민등록번호
								<font size="2" color="#ff3f3f">*</font>
								</font>
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
							<input type="text" name="member_jumin1" size="12" maxlength="6" value="${memberInfo.member_jumin1 }"/> -
							<input type="text" name="member_jumin2" size="12" maxlength="7" value="${memberInfo.member_jumin2 }"/>
						</td>
					</tr>
					<tr>
							<td>
								<font size="2">
									&nbsp;&nbsp;주소
									<font size="2" color="#ff3f3f">
											*
									</font>
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_zipcode" size="7"  value="${memberInfo.member_zipcode }"/>
								<input type="text" name="member_addr1" size="50"  value="${memberInfo.member_addr1 }"/> <input type="button" class="btn_small3" name="zipcode" value="우편번호" onclick="openZipCheck()" style="height: 20px;"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
								<!-- &nbsp;&nbsp;기본주소 뒤로가야하는데 -->
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_addr2" size="50" value="${memberInfo.member_addr2 }"/>
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
								&nbsp;&nbsp;일반전화
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_phone" size="20" value="${memberInfo.member_phone }"/>
									<font size="2" color="#ff3f3f">
											(일반전화가 없을 경우 휴대전화를 기재해주세요.)
									</font>
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
								&nbsp;&nbsp;휴대전화
								<font size="2" color="#ff3f3f">
											*
									</font>
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_mobile" size="20" value="${memberInfo.member_mobile }"/>
									
							</td>
						</tr>
						
						<tr>
							<td>
								<font size="2">
									&nbsp;&nbsp;이메일
									<font size="2" color="#ff3f3f">
											*
									</font>
								</font>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
								<input type="text" name="member_email" size="30" value="${memberInfo.member_email }"/>
								<input type="checkbox" name="member_email_get" value="YES"/> 동의함
								<font size="1">배송현황 및 쇼핑정보를 받으시겠습니까?</font>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
							<a href ="javascript: check();"><img src="<%=cp%>/img/member/btn_ok.gif" value="수정" class="button"/></a>
														&nbsp;&nbsp;&nbsp;&nbsp;
								<a href = "javascript:history.back(-1);"><img src="<%=cp%>/img/member/btn_cancel.gif" value="수정취소" class="button" /></a>
								<br>
							</td>
						</tr>
					</table>
			</table>
		</form>
	</table>
</div>
</div>
</body> --%>
</html>
						