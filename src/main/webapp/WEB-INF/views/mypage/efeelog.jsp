<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>eFeelog</title>
<meta name="description" content="">
<meta name="viewport" cotent="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script language="javascript">
	function bookSearch() {
		var searchUrl = 'http://localhost:8080/namuduri/efeelogSearchView.do';
		window.open(searchUrl,"confirm", "toolbar=no, location=no, status=no, scrollbars=no, resizable=no, width=350, height=350");
	}
	
	function goPage(){
		var f = $('form#efeelog')
		//f.action = "eFeelogList.do";
		f.submit();
	}
	
	/* $(document).ready(function) {
		$('#src').click(function() {
			var state = $('#book_image').css('display');
			if(state == 'none') {
				$('#book_image').show();
			} else {
				$('#book_image').hide();
			}
		});
	} */
</script>
</head>
<body>

	<h2 style="text-align: -webkit-center; padding-top: 30px;">eFeelog</h2>
		<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
			<li>
				<a title="Go to Main" href="<%=cp%>/main.do">MAIN</a>
			</li>
			<li>
				<a title="Go to MY PAGE" href="<%=cp%>/mypage.do">MY PAGE</a>
			</li>
		</ul>
		
		<div class="login-account section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<form class="create-account-form" name="efeelog" id="efeelog" action="eFeelogList.do" method="post">
							<div class="form-group">
								<table>							
									<thead>
										<tr>
											<th><div class="user_name">${ member_id }님 안녕하세요.</div></th>
										</tr>
									</thead>							
								</table><br><br>
								<div class="text-center">
									<button type="button" class="btn btn-primary btn-block" onclick="javascript:bookSearch(this.form)"><span class="glyphicon glyphicon-book"></span>Search</button>
								</div><br>
								<div class="form-group">
								<img src="" id="book_img" class="img-responsive center-block">
								<input type="hidden" name="book_num" id="book_num">
								<table>
									<thead>
										<tr>
											<td>
												<textarea class="form-control" rows="3" cols="30" name="memo"></textarea>
											</td>
										</tr><br><br><br>
									</thead>
								</table><br><br>								
								</div>
								<div class="text-center">
									<input type="button" class="btn btn-primary btn-block" value="게시글 올리기" onclick="goPage()">						
								</div>																
							</div>
						</form>						
					</div>
					
					<c:forEach var="item" items="${ efList }">
					<div class="col-md-3">
						<form class="create-account-form" name="efeelogList" id="efeelogList">
							<div class="form-group">
								<table>							
									<thead>
										<tr>
											<th><div class="user_name">${ item.member_id }님</div></th>										
										</tr>
									</thead>							
								</table><br>
								<table>
									<thead>
										<tr>
											<td><div class="write_date">${ item.efeelog_regdate }</div></td>
										</tr>
									</thead>
								</table><br>
								<div class="form-group">
								<table>
									<thead>
										<tr>
											<p class="text-center"><span class="text-primary">${ item.book_name }</span></p>
										</tr>
									</thead>
								</table>								
								<img src="<%=cp%>/upload/${ item.book_image }" class="img-responsive center-block">
								</div>
								<table>
									<thead>
										<td>${ item.efeelog_memo }
											<%-- <textarea class="form-control" rows="3" cols="30" name="memo">${ item.efeelog_memo }</textarea>	 --%>									
										</td>										
									</thead>
								</table>																				
							</div>
						</form>
					</div>
					</c:forEach>				
				</div>
			</div>
		</div>

</body>
</html>