<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<title>search</title>
<script language="JavaScript">
	function book_search() {		
		if(document.bookForm.value == "") {
			alert("책 제목을 입력해주세요.");
			return;
		}
		document.bookForm.submit();
	}
	
	function parentDataSend(image, book_num){
		var image = "<%=cp%>/upload/" + image;
		$("img#book_img", opener.document).attr("src", image);
		$("#book_num", opener.document).val(book_num);
		window.close();
  }
</script>
<style type="text/css">
#custom-search-input {
	margin: 0;
	margin-top: 10px;
	padding: 0;
}

#custom-search-input .search-query {
	padding-right: 3px;
	padding-right: 4px \9;
	padding-left: 3px;
	padding-left: 4px \9;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#custom-search-input button {
	border: 0;
	background: none;
	/** belows styles are working good */
	padding: 2px 5px;
	margin-top: 2px;
	position: relative;
	left: -28px;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	color: #D9230F;
}

.search-query:focus+button {
	z-index: 3;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-3">
				<div class="span12">
					<form action="<%=cp%>/efeelogSearch.do">
						<div id="custom-search-input">
							<div class="input-group col-md-12">
								<input type="text" class="search-query form-control" placeholder="Search" id="search" name="search" />
								<span class="input-group-btn">
									<button class="btn btn-danger" type="button">
										<span class=" glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
						<div class="thumbnail-wrapper">
							<div class="thumbnail">
								<c:forEach items="${ eFeelogList }" var="list">
									<img src="<%=cp%>/upload/${ list.book_image }" onclick="parentDataSend('${list.book_image}','${ list.book_num }')">
								</c:forEach>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>