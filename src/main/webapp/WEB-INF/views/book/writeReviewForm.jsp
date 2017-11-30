<?xml version="1.0" encoding="UTF-8" ?>
<% String cp = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>리뷰 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/goods_view.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/reset.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/share.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
   function review() {
      var con = confirm("등록하시겠습니까?");
      var product = eval("document.reviewForm");
      if (con == true) {
         document.reviewForm.action = '<%=cp%>/books/review.do';
         product.submit();
      } else {
         return false;
      }
   }
</script>
</head>
<body>ㅋ
	<div class="review-write-layer" style="position: absolute; margin: 0px; top: 23px; left: 30px; right: 30px;">
		<div class="wrap">
			<h4>상품후기 쓰기</h4>
			<fieldset>
				<legend>상품 문의/후기 작성 폼</legend>
				<div class="scroll-box">
					<div class="goods">
						<div class="txt">
							<h2>${book_name}</h2>
						</div>
					</div>
					<form name="reviewForm" id="reviewForm" method="post" action="review.do">
						<input type="hidden" name="book_num" value="${book_num}" />
						<div class="board-write">
							<table summary="글쓰기 폼입니다." cellpadding="0" border="1">
								<colgroup>
									<col width="11%" />
									<col />
								</colgroup>
								<tbody>
									<tr>
										<th>작성자</th>
										<td><c:choose>
												<c:when test="${member_id == null}">
													<input type="text" name="member_id" class="text" title="작성자 입력" />
												</c:when>
												<c:otherwise>
													<input type="text" name="member_id" value="${member_id}" class="text" title="작성자 입력" />
												</c:otherwise>
											</c:choose></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="review_pw" class="text" title="비밀번호 입력" /></td>
									</tr>
									<tr>
										<th>평가</th>
										<td>
											<ul class="choice-rating">
												<li><input type="radio" name="star_point" value="5" id="star_point" checked="" /><img src="<%=cp%>/img/star5.png" border="0" /></li>
												<li><input type="radio" name="star_point" value="4" id="star_point" /><img src="<%=cp%>/img/star4.png" border="0" /></li>
												<li><input type="radio" name="star_point" value="3" id="star_point" /><img src="<%=cp%>/img/star3.png" border="0" /></li>
												<li><input type="radio" name="star_point" value="2" id="star_point" /><img src="<%=cp%>/img/star2.png" border="0" /></li>
												<li><input type="radio" name="star_point" value="1" id="star_point" /><img src="<%=cp%>/img/star1.png" border="0" /></li>
												<li><input type="radio" name="star_point" value="0" id="star_point" /><img src="<%=cp%>/img/star0.png" border="0" /></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td><input type="text" name="review_content" id="review_content" class="text" maxlength="50" /></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
				<p style="text-align: right;">
					<a href="javascript:window.close();"><img src="<%=cp%>/img/cancel.png" /></a> <a href="javascript:review();"><img src="<%=cp%>/img/accept.png" /></a>
				</p>
			</fieldset>
			<button type="button" class="close" title="닫기">닫기</button>
		</div>
	</div>
</body>
</html>