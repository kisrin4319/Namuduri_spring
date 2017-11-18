<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/header.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/header2.css" rel="stylesheet" type="text/css" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<%=cp%>/js/common.js?ver=1" charset="utf-8"></script>
<title>Insert title here</title>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
</head>
<body>
	<!-- s:#header -->
	<div id="header">
		<script type="text/javascript">
function goCart(){
	location.href = '<%=cp%>/basket/basketList.do';
}
function openLoginTop(){
	location.href = '<%=cp%>/member/loginForm.do';
}
function goMemberJoin() {
	location.href= '<%=cp%>/member/memberInfo.do';
}
function logout() {
	location.href= '<%=cp%>/member/logOut.do';
}
function goCSCenter() {
	location.href = '<%=cp%>/boardList.do';
}
function goQnA() {
	location.href = '<%=cp%>/qnaList.do';
}
function goAdmin() {
	location.href = '<%=cp%>/adminMain.do';
			}
		</script>
		<!-- s:.top_header -->
		<div class="top_header">
			<!-- 기본 로고 (기본위치 left:62px;top:64px / 로고 사이드 배너가 있을 경우 위치 이동) -->
			<h1 class="kyobo">
				<a href="<%=cp %>/main.do">
					<img src="<%=cp %>/img/Logo.png" alt="Namuduri"
						style="width: 90px; height: 75px; margin-left: 150px;" />
				</a>
			</h1>
			<!-- 로고 사이드 배너 -->
			<!-- s:.top_content_gnb -->
			<div class="top_content_gnb">
				<c:if test="${empty member_id}">
					<ul class="list" id="gnbLoginInfoList">
						<li class="button">
							<a href="javascript:openLoginTop();">로그인</a>
						</li>
						<li>
							<a href="javascript:goMemberJoin();">회원가입</a>
						</li>
						<li>
							<a href="javascript:goCSCenter();">고객센터</a>
						</li>
						<li>
							<a href="javascript:goQnA();">FAQ/QNA</a>
						</li>
						<li>
							<a href="javascript:goCart();">
								<small style="left: 0px;">
									<span>
										<img src="<%=cp %>/img/basketIcon.jpg" />
									</span>
								</small>
							</a>
						</li>
					</ul>
				</c:if>
				<c:if test="${not empty member_id }">
					<ul class="list" id="gnbLoginInfoList">
						<li class="parent">
							<c:if test="${member_id == 'admin'}">
								<a href="mypage.do" id="gnbLoginUserName">${member_id}(관리자)</a>
							</c:if>
							<c:if test="${member_id!= 'admin' }">
								<a href="mypage.do" id="gnbLoginUserName">${member_id}(일반회원)</a>
							</c:if>
						</li>
						<li class="button">
							<a href="javascript:logout();">로그아웃</a>
						</li>
						<c:if test="${member_id == 'admin'}">
							<li>
								<a href="javascript:goAdmin();">관리자페이지</a>
							</li>
						</c:if>
						<li>
							<a href="javascript:goCSCenter();">고객센터</a>
						</li>
						<li>
							<a href="javascript:goQnA();">FAQ/QNA</a>
						</li>
						<li class="cart">
							<a href="javascript:goCart();">
								장바구니
								<small>
									<span>
										<img src="<%=cp %>/img/basketIcon.jpg" />
									</span>
								</small>
							</a>
						</li>
					</ul>
				</c:if>
			</div>
			<!-- e:.top_content_gnb -->
			<form method="post" action="<%=cp%>/books/booksList.do"
				name="searchTop" id="searchTop"
				onsubmit="javascript:goSearch('t'); return false;">
				<!-- s:.searcharea is_option -->
				<div class="searcharea is_option">
					<div class="search_input">
						<div class="search_option">
							<select name="searchNum"
								style="height: 40px; border-color: #5e6b9e; width: 85px; padding-left: 5px; padding-top: 10px; border-top-width: 1px;">
								<option value="0">통합검색</option>
								<option value="1">제목</option>
								<option value="2">저자</option>
								<option value="3">출판사</option>
							</select>
						</div>
						<script type="text/javascript">
							(function($) {

								$('.search_option input').click(
										function() {
											$('.search_option ul').toggle()
													.find('li.on:visible a')
													.focus();
											$(this).toggleClass('open');
										});

								var hover_value = 0;
								var focus_value = 0;
								$('.search_option').hover(function() {
									hover_value = 1;
								}, function() {
									hover_value = 0;
								});
								$('.search_option input').focus(function() {
									focus_value = 1;
									$(this).addClass('focus');
								}).blur(function() {
									focus_value = 0;
									$(this).removeClass('focus');
								});
								$('body').click(
										function() {
											if (!hover_value && !focus_value) {
												$('.search_option ul').hide();
												$('.search_option input')
														.removeClass('open');
											}
										});

								$().ready(function() {
								});
							})(jQuery);
						</script>
						<input type="text" class="main_input" name="searchKeyword"
							id="searchKeyword" value="" onblur="setOutFocus();"
							title="검색어 입력" />
					</div>
					<input type="submit" class="btn_search" value="검색" />
				</div>
				<!-- e:.searcharea is_option -->
			</form>
		</div>
		<!-- e:.top_header -->
		<!-- s:.navigation_bar (상단 네비게이션)-->
		<div class="navigation_bar" style="width: 1000px;">
			<!-- 주요메뉴 -->
			<ul class="gnb_main add_1" style="margin-left: 75px;">
				<li class="section_title" style="width: 85px;">
					<a href="<%=cp%>/books/booksList.do" class="text">전체보기</a>
				</li>
				<li class="section_title" style="width: 85px;">
					<a href="<%=cp%>/books/booksList.do?book_category=단편소설"
						class="text">단편소설</a>
				</li>
				<li class="section_title" style="width: 85px;">
					<a href="<%=cp%>/books/booksList.do?book_category=장편소설"
						class="text">장편소설</a>
				</li>
				<li class="section_title" style="width: 85px;">
					<a href="<%=cp%>/books/booksList.do?book_category=자기계발"
						class="text">자기계발</a>
				</li>
				<li class="section_title" style="width: 85px;">
					<a href="<%=cp%>/books/booksList.do?book_category=시/에세이"
						class="text">시/에세이</a>
				</li>
				<li class="section_title" style="width: 110px;">
					<a href="<%=cp%>/books/booksList.do?book_category=어린이(초등)"
						class="text">어린이(초등)</a>
				</li>
				<li class="section_title" style="width: 115px;">
					<a href="<%=cp%>/books/booksList.do?book_category=중/고등참고서"
						class="text">중/고등참고서</a>
				</li>
				<li class="section_title" style="width: 110px;">
					<a href="<%=cp%>/books/booksList.do?book_category=취업/참고서"
						class="text">취업/참고서</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- //e:#header -->
</body>
</html>