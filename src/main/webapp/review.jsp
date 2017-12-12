<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/animate.css">

<style type="text/css">
 .avaliar{
    margin-top:5px;
	background-color:#EDEDED;
}
.avaliar textarea{
	width:100%;
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
	<div class="row" style="margin-top:50px">
        <div class="col-md-12">
    		<form class="formtest">
        		<button type="button" class="btaval btn btn-success" data-toggle="collapse" data-target="#1" onClick="esconder(this)">Review !!</button>
    			<div id="1" class="collapse">
       			   <div class="col-md-12 avaliar ">
    					<textarea cols="50" id="comentario" name="comment" value="" placeholder="Tell me your rate"></textarea>				
    																
    			    	<div class="stars starrr" data-rating="0">
    	                <input class="nota" name="rating" type="hidden" value="">
        				</div>
    				    <div class="text-right">	
    							<button class="btn btn-success" type="submit" onclick="test()" >Enviar <i class="fa fa-reply"></i> </button>
    							<span class="btn btn-danger" data-toggle="collapse" data-target="#1" onClick="mostrar()">Cancelar <i class="fa fa-times"></i> </span>
    				    </div>	
    				</div>
    			</div>	
    		</form>
        </div>    
	</div>
    
    Changed form to class insted of action or method just for test result without send submit<br>
    Changed his resize function to native colappse panels<br>
<a href="http://bootsnipp.com/snippets/featured/expanding-review-and-rating-box"> SEE Original version</a>
</div>
<script src="<%=cp%>/bootstrap/js/review.js"></script>
</body>
</html>