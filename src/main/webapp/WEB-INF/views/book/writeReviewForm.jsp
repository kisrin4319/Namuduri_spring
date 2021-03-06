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
<script src="<%=cp%>/bootstrap/js/review.js"></script>
<style type="text/css">
.animated {
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	transition: height 0.2s;
}

.stars {
	margin: 20px 0;
	font-size: 24px;
	color: #d17581;
}
</style>
</head>
<body>
	<div class="container">
		<form name="reviewform" id="reviewform" method="post">
			<input type="hidden" name="book_num" value="${book_num }" />
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
								<tbody>
									<tr>
										<th>작성자</th>
										<td>
											<c:choose>
												<c:when test="${member_id == null}">
													<input type="text" name="member_id" class="text" title="작성자 입력" />
												</c:when>
												<c:otherwise>
													<p>
														<input type="text" name="member_id" value="${member_id}" class="form-control animated" title="작성자 입력" />
													</p>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<p>
												<input type="password" name="review_pw" class="form-control animated" title="비밀번호 입력" />
											</p>
										</td>
									</tr>
								</tbody>
								<br />
								<input id="ratings-hidden" name="rating" type="hidden">
								<textarea class="form-control animated" cols="20" id="new-review" name="review_content" placeholder="Enter your review here..." rows="1"></textarea>
								<div class="text-right">
									<div class="stars starrr" data-rating="0"></div>
									<button type="button" class="btn btn-danger" style="font-style: oblique; border-bottom: 0px; border-top: 0px; border-left: 0px; border-right: 0px; width: 80px; height: 30px;" onclick="window.close();">CANCEL</button>
									<button type="button" class="btn btn-info" style="font-style: oblique; border-bottom: 0px; border-top: 0px; border-left: 0px; border-right: 0px; width: 80px; height: 30px;" onclick="javascript:checkIt();">SAVE</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
    $("#input-id").rating();
    
    function checkIt() {
    	var reviewform = document.getElementById("reviewform");
    		if (!reviewform.review_pw.value) {
    			alert("비밀번호를 입력해주세요");
    			reviewform.review_pw.focus();
    			return false;
    		} else if (!reviewform.review_content.value) {
    			alert("후기를 남겨주세요");
    			reviewform.review_content.focus();
    			return false;
    		} else if (reviewform.rating.value == 0) {
    			alert("평점을 선택해주세요");
    			reviewform.rating.focus();
    			return false;	
    			} else {
    		          reviewform.action = "<%=cp%>/books/review.do";
    		          reviewform.submit();
			}
		}
	</script>
</body>
</html>