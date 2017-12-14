<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>404 page not found || Witter Multipage Responsive Template</title>
  		<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <!-- Add your site or application content here -->  
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>404 Page</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="<%=cp%>/main.do">Home</a>
						        </li>
						        <li>404 page</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 
        <!-- 404 Error Page Start -->
        <div class="error-text-area section-padding">
			<img alt="" src="${pageContext.request.contextPath}/img/404page.jpg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="error-text text-center">
							<h1>OPPS! PAGE NOT FOUND</h1>
							<a href="<%=cp%>/main.do">BACK TO HOME PAGE</a>
						</div>
					</div>
				</div>
			</div>
		</div>
       <!-- 404 Error Page End -->
    </body>
</html>