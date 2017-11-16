<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호검색</title>
<link rel = "stylesheet" href ="css/style1.css" type="text/css" />
<script language="JavaScript">


	function dongCheck() {
		
		if(document.zipForm.area3.value=="") {
			alert("동이름을 입력하세요.");
			return;
		}
		document.zipForm.submit();
		
	}
	
	function sendAddress(zipcode, area1, area2, area3, area4) {
		var address = area1+" "+area2+" "+area3+" "+area4;
		
		opener.document.memberInfo.member_zipcode.value = zipcode;
		opener.document.memberInfo.member_addr1.value = address;
		opener.document.memberInfo.member_addr2.focus();
		self.close();
	}

</script>
</head>
<body scroll="" style= "overflow-x:hidden">

<div id="popup_type01" style="width:600px;">
	<!-- popup_shadow -->
	<div class="popup_shadow">
		<!-- popup_wrap -->
		<div class="popup_wrap">
			<!-- title -->
			<div class="tit">
				<h1 class="title_h_cartlist">주소 찾기</h1>
			</div>
			<!-- // title -->
			<!-- popup_container -->
			<div class="popup_container">

<form name="zipForm" method="post" action="zipCheck.do">

	<table width="500" border="0" cellpadding="0" cellspacing="0" class="zip">
		<br>
		
	<tr>
		<td align="center">
				동이름 입력 : <input type="text" name="area3" size="20" maxlength="50">
				<input type="button" value="검  색" onclick="dongCheck();">
				<input type="hidden" name="check" value="n">
			</td>
		</tr>
		<tr>
			<td height="30"></td>
		</tr>
		
		<tr>
			<td height="40" align="center">
				<p class="font_black"><strong>건물명(아파트명), 지번주소(동,읍,면)을 입력하세요.</strong><br />
					검색 입력 예 : 작전1동/작전2동/계산동
				</p>
				<br>
				<br>
				
			</td>
		</tr>
	</table>
	
</form>

<s:if test="%{area3} == null">
	
	<tr>
		<td align="center">
			<br>검색된 결과가 없습니다.
		</td>
	</tr>
	
</s:if>

<s:else	>
	
	<tr>
		<td align="center">
			
		</td>
	
	<s:iterator value="%{zipcodeList}" status="stat">
	<div class="box_detail_address2 bg_blue margin_top10">
		<tr>
			<td>
			<a href="javascript:sendAddress('<s:property value="zipcode"/>'
													, '<s:property value="area1"/>'
													, '<s:property value="area2"/>'
													, '<s:property value="area3"/>'
													, '<s:property value="area4"/>')">
												<s:property value="zipcode"/>
												<s:property value="area1"/>
												<s:property value="area2"/>
												<s:property value="area3"/>
												<s:property value="area4"/>
					</a>
				<br>
			</td>
		</tr>
	</div>
			
	</s:iterator>
</s:else>

			<tr>
				<td align="center"> <br>
					<a href="javascript:this.close();" ><img src="member/images/zipCheck.PNG" value="주소입력" class="zipCheckbtn" style="align:center;"/>
					
					</a>
				</td>
			</tr>

</div>
</div>
</div>
</div>
</body>
</html>