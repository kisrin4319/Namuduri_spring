<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shop || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/usedBook.css" type="text/css">
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">USED BOOK PAGE</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do">Home</a>
		</li>
		<li>
			<a title="Go to UsedBooksList" href="<%=cp%>/books/usedBooksList.do">UsedBookList</a>
		</li>
	</ul>
	<!-- Shop Area Start -->
	<div class="container">
		<h1 class="well">Used Book Registration Form</h1>
		<div class="col-lg-12 well">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<!-- Search Field -->
					<h1 class="text-center">Search Title</h1>
					<div class="form-group">
						<div class="input-group">
							<input class="form-control" type="text" name="search" placeholder="Search" required />
							<span class="input-group-btn">
								<button class="btn btn-success" type="submit">
									<span class="glyphicon glyphicon-search" aria-hidden="true">
										<span style="margin-left: 10px;">Search</span>
									</span>
								</button>
							</span>
						</div>
					</div>
					<!-- End of Search Form -->
				</div>
				<form>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input type="text" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input type="text" placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label>Address</label>
							<textarea placeholder="Enter Address Here.." rows="3" class="form-control"></textarea>
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
								<input type="text" placeholder="Enter City Name Here.." class="form-control">
							</div>
							<div class="col-sm-4 form-group">
								<label>State</label>
								<input type="text" placeholder="Enter State Name Here.." class="form-control">
							</div>
							<div class="col-sm-4 form-group">
								<label>Zip</label>
								<input type="text" placeholder="Enter Zip Code Here.." class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Title</label>
								<input type="text" placeholder="Enter Designation Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Company</label>
								<input type="text" placeholder="Enter Company Name Here.." class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label>Phone Number</label>
							<input type="text" placeholder="Enter Phone Number Here.." class="form-control">
						</div>
						<div class="form-group">
							<label>Email Address</label>
							<input type="text" placeholder="Enter Email Address Here.." class="form-control">
						</div>
						<div class="form-group">
							<label>Website</label>
							<input type="text" placeholder="Enter Website Name Here.." class="form-control">
						</div>
						<button type="button" class="btn btn-lg btn-info">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
</body>
</html>