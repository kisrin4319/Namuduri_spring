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
						<form class="create-account-form" name="efeelog" id="efeelog">
							<div class="form-group">
								<table>
									<thead>
										<tr>
											<th><div class="user_name">${ member_id }님 안녕하세요.</div></th>
										</tr>
									</thead>
								</table><br><br>
								<div class="btn-toolbar">
									<button type="button" class="btn btn-default btn-lg" onclick=""><span class="glyphicon glyphicon-book"></span>Search</button>
								</div>
								<div class="form-group">
								<table>
									<thead>
										<tr>
											<td>
												<textarea class="form-control" rows="3" cols="30"></textarea>
											</td>
										</tr><br><br>
									</thead>
								</table><br><br>
								</div>
								<div>
									<button name="submitcreate" id="submitcreate" class="btn-default" onclick="">
										<span>
											<i class="fa fa-user"></i>
											게시글 올리기
										</span>
									</button>
								</div>																
							</div>
						</form>
						<%-- <div class="row">
							<div class="col-md-3 col-md-offset-3">
								<form action="" class="search-form">
									<div class="form-group has-feedback">
										<label for="search" class="sr-only">Search</label>
										<input type="text" class="form-control" name="search" id="search" placeholder="search">
										<span class="glyphicon glyphicon-search form-control-feedback"></span>
									</div>
								</form>
							</div>
						</div> --%>
					</div>
				</div>
			</div>
		</div>

</body>
</html>