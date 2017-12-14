<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="<%=cp%>/bootstrap/css/order.css">
<title>Insert title here</title>
</head>
<body>

<div class="container" style="text-align: center; margin-left: 0px; margin-right: 0px;">
	<div class="row">
		
        <div class="receipt-main col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
    			<div class="receipt-header">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<div class="receipt-left">
							<img class="img-responsive" alt="iamgurdeeposahan" src="${pageContext.request.contextPath}/img/checkmark.png" style="width: 71px; border-radius: 43px;">
							<h3 style="margin-top: 10px; margin-bottom: 10px;">주문 접수 완료</h3>
						</div>
					</div>
				</div>
            </div>
			
			<div class="row">
				<div class="receipt-header receipt-header-mid">
					<div class="col-xs-4 col-sm-4 col-md-4">
						<div class="receipt-left">
							<strong><h1 style="margin-top: 0px;">Receipt</h1></strong>
						</div>
					</div>
				</div>
            </div>
			
            <div style="text-align: -webkit-center;">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width: 60px;"></th>
                            <th style="width: 330px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-9">Payment for August 2016</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> 15,000/-</td>
                        </tr>
                        <tr>
                            <td class="col-md-9">Payment for June 2016</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> 6,00/-</td>
                        </tr>
                        <tr>
                            <td class="col-md-9">Payment for May 2016</td>
                            <td class="col-md-3"><i class="fa fa-inr"></i> 35,00/-</td>
                        </tr>
                        <tr>
                            <td class="text-right">
                            <p>
                                <strong>Total Amount: </strong>
                            </p>
                            <p>
                                <strong>Late Fees: </strong>
                            </p>
							<p>
                                <strong>Payable Amount: </strong>
                            </p>
							<p>
                                <strong>Balance Due: </strong>
                            </p>
							</td>
                            <td>
                            <p>
                                <strong> 65,500/-</strong>
                            </p>
                            <p>
                                <strong> 500/-</strong>
                            </p>
							<p>
                                <strong> 1300/-</strong>
                            </p>
							<p>
                                <strong> 9500/-</strong>
                            </p>
							</td>
                        </tr>
                        <tr>
                           
                            <td class="text-right"><h2><strong>Total: </strong></h2></td>
                            <td class="text-left text-danger"><h2><strong><i class="fa fa-inr"></i> 31.566/-</strong></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
			
			<div class="row">
				<div class="receipt-header receipt-header-mid receipt-footer">
					<div class="col-xs-8 col-sm-8 col-md-8 text-left">
						<div class="receipt-right">
							<h5 style="color: rgb(140, 140, 140);">Thank you</h5>
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4">
						<div class="receipt-left">
							<input type="button" value="MAIN" style="font-style: oblique; background-color: black; color: white; border-bottom: 0px; border-top: 0px; border-left: 0px; border-right: 0px; width: 80px; height: 30px;"> 
							<input type="button" value="MY PAGE" style="font-style: oblique; background-color: black; color: white; border-bottom: 0px; border-top: 0px; border-left: 0px; border-right: 0px; width: 80px; height: 30px;">
						</div>
					</div>
				</div>
            </div>
			
        </div>    
	</div>
</div>

</body>
</html>