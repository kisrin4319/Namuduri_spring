<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>search</title>
<script language="JavaScript">
	function book_search() {
		
		if(document.bookForm.value == "") {
			alert("책 제목을 입력해주세요.");
			return;
		}
		document.bookForm.submit();
	}
	
	function parentDataSend(image){
		var image = "<%=cp%>/upload/"+image;
		$("img#book_img", opener.document).attr("src",image);
		window.close();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="center">
			<div class="col-md-3">
				<form class="create-account-form" name="bookForm">
					<div class="thumbnail-wrapper">
						<div class="thumbnail">
							<img src="${ efeelog.book_name }">
						</div>
					</div>
				</form>
			</div>
			<div class="row">
		        
    		</div>
		    <div class="row">
		        <div class="col-md-4 col-md-offset-3">
		            <form action="<%=cp%>/efeelogSearch.do" class="search-form">
		                <div class="form-group has-feedback">
		            		<label for="search" class="sr-only">Search</label>
		            		<input type="text" class="form-control" name="search" id="search" placeholder="search">
		              		<span class="glyphicon glyphicon-search form-control-feedback"></span>
		            	</div>
		            	<div class="thumbnail-wrapper">
							<div class="thumbnail">
								<c:forEach items="${ eFeelogList }" var="list">
									<img src="<%=cp%>/upload/${ list.book_image }" onclick="parentDataSend('${list.book_image}')">
									<tr>
										<td><input type="hidden" value="${ list.book_num }"></td>
									</tr>
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