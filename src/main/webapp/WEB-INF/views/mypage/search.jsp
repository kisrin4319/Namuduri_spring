<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>search</title>
<script language="JavaScript">
	function book_search() {
		
		if(document.bookForm.value == "") {
			alert("책 제목을 입력해주세요.");
			return;
		}
		document.bookForm.submit();
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
							<img src="${ efeelog.book_image }">
						</div>
					</div>
				</form>
			</div>
			<div class="row">
		        
    		</div>
		    <div class="row">
		        <div class="col-md-4 col-md-offset-3">
		            <form action="" class="search-form">
		                <div class="form-group has-feedback">
		            		<label for="search" class="sr-only">Search</label>
		            		<input type="text" class="form-control" name="search" id="search" placeholder="search">
		              		<span class="glyphicon glyphicon-search form-control-feedback"></span>
		            	</div>
		            </form>
		        </div>
		    </div>
		</div>
	</div>

</body>
</html>