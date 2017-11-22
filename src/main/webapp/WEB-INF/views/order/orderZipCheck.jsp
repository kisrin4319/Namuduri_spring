<?xml version="1.0" encoding="UTF-8" ?>
<%
	String cp = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호검색</title>
<link rel="stylesheet" href="<%=cp%>/css/style1.css" type="text/css" />
<script language="JavaScript">
  function dongCheck() {

    if (document.zipform.area3.value == "") {
      alert("동이름을 입력하세요.");
      return;
    }
    document.zipform.submit();
  }

  function sendAddress(zipcode, area1, area2, area3, area4) {
    var address = area1 + " " + area2 + " " + area3 + " " + area4;

    opener.document.orderform.order_receive_zipcode.value = zipcode;
    opener.document.orderform.order_receive_addr1.value = address;
    opener.document.orderform.order_receive_addr2.focus();

    self.close();
  }
</script>
</head>
<body style="overflow-x: hidden">
	<div id="popup_type01" style="width: 600px;">
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
					<form name="zipform" method="post" action="zipCheck.do">
						<table width="500" border="0" cellpadding="0" cellspacing="0" class="zip">
							<tr>
								<td align="center">
									동이름 입력 :
									<input type="text" name="area3" size="20" maxlength="50">
									<input type="button" value="검  색" onclick="dongCheck();">
									<input type="hidden" name="check" value="n">
								</td>
							</tr>
							<tr>
								<td height="30"></td>
							</tr>
							<tr>
								<td height="40" align="center">
									<p class="font_black">
										<strong>건물명(아파트명), 지번주소(동,읍,면)을 입력하세요.</strong>
										<br />
										검색 입력 예 : 작전1동/작전2동/계산동
									</p>
									<br>
									<br>
								</td>
							</tr>
						</table>
					</form>
					<c:choose>
						<c:when test="${zipcodeList == null}">
							<tr>
								<td align="center">검색된 결과가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td align="center"></td>
								<c:forEach var="zip" items="${zipcodeList}">
									<div class="box_detail_address2 bg_blue margin_top10">
										<a href="javascript:sendAddress('${zip.zipcode}'
                                       , '${zip.area1}'
                                       , '${zip.area2}'
                                       , '${zip.area3}'
                                       , '${zip.area4}')"> ${zip.zipcode} ${zip.area1} ${zip.area2} ${zip.area3} ${zip.area4} </a>
									</div>
								</c:forEach>
						</c:otherwise>
						<td align="center">
							<a href="javascript:this.close();">
								<img src="member/images/zipCheck.PNG" class="zipCheckbtn" style="align: center;" />
							</a>
						</td>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>