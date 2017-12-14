<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>WishList || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>
<script src ="<%=cp%>/bootstrap/js/review.js"></script>
<style type="text/css">
 .animated {
    -webkit-transition: height 0.2s;
    -moz-transition: height 0.2s;
    transition: height 0.2s;
}

.stars
{
    margin: 20px 0;
    font-size: 24px;
    color: #d17581;
}
</style>
</head>
<body>
	<div class="container">
		<h2 style="text-align: center;">${book_name}</h2>
		<hr>
		<div class="row" style="margin-top: 40px;">
			<div class="col-md-6">
				<div class="well well-sm">
					<div class="text-right">
						<a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box" style="font-style: oblique;">LEAVE A REVIEW</a>
					</div>
					<div class="row" id="post-review-box" style="display: none;">
						<div class="col-md-12">
							<form accept-charset="UTF-8" action="" method="post">
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
									<br/>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="review_pw" class="text" title="비밀번호 입력" /></td>
									</tr>
								</tbody>
								<br/>
								<input id="ratings-hidden" name="rating" type="hidden">
								<textarea class="form-control animated" cols="20" id="new-review" name="comment" placeholder="Enter your review here..." rows="1"></textarea>
								<div class="text-right">
									<div class="stars starrr" data-rating="0"></div>
									<a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display: none; margin-right: 10px;">
										<span class="glyphicon glyphicon-remove"></span>
										Cancel
									</a>
									<button class="btn btn-success btn-lg" type="submit">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    $("#input-id").rating();
  </script>
</body>
</html>