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
								</table>
								<div class="form-group">
								<table>								
									<thead>
										<tr>
											<td><span class="glyphicon glyphicon-search" aria-hidden="true"></span></span></td>
										</tr>
									</thead>
								</table>
								</div>
								<div class="form-group">
								<table>
									<thead>
										<tr>
											<td>
												<textarea rows="3" cols="30"></textarea>
											</td>
										</tr>
									</thead>
								</table>
								</div>																
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

</body>
</html>