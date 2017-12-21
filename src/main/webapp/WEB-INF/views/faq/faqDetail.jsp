<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

/* Font ROBOTO */
.roboto {
	font-family: 'Roboto', sans-serif !important;
}

/* custom background for panel  */
.container {
	padding-top: 50px !important;
}

/* custom background header panel */
.custom-header-panel {
	background-color: lightcoral !important;
	color: white;
}

.no-margin-form-group {
	margin: 0 !important;
}

.requerido {
	color: red;
}

.btn-orange-md {
	color: black;
}

.btn-orange-md:hover {
	color: black !important;
}

.btn-default {
	background: lightcoral none repeat scroll 0 0;\
	border: 1px solid lightcoral;
}
</style>
<link href='http://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<h2 style="text-align: -webkit-center; padding-top: 30px;">FAQ</h2>
				<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
					<li style="margin-bottom: 25px;">
						<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
					</li>
					<li style="margin-bottom: 25px;">
						<a title="Go to Shopping" href="<%=cp%>/books/booksList.do" style="font-style: oblique;">SHOP</a>
					</li>
				</ul>
				<div class="col-md-12">
					<div class="panel">
						<div class="panel-heading custom-header-panel" style="margin-bottom: 20px; background-color: lightcoral; ">
							<h3 class="panel-title roboto"></h3>
						</div>
						<form class="form-horizontal">
							<fieldset>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="requestid">NUM</label>
									<div class="col-md-10" style="text-align: center;">
										<input type="text" name="num" value="${faqModel.faq_num}" class="form-control input-md" readonly style="text-align: center; background: border-box;">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="requestid">VIEWS</label>
									<div class="col-md-10" style="text-align: center;">
										<input type="text" name="views" value="${faqModel.readcount}" class="form-control input-md" readonly style="text-align: center; background: border-box;">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="requestid">NAME</label>
									<div class="col-md-10" style="text-align: center;">
										<input type="text" name="id" value="${faqModel.member_id}" class="form-control input-md" readonly style="text-align: center; background: border-box;">
									</div>
								</div>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="date">DATE</label>
									<div class="col-md-10">
										<input type="text" name="date" value="<fmt:formatDate value="${faqModel.faq_regdate}" pattern="yy-MM-dd" />" class="form-control input-md" readonly style="text-align: center; background: border-box;">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="date">TITLE</label>
									<div class="col-md-10">
										<input type="text" name="title" value="${faqModel.faq_title}" class="form-control input-md" readonly style="text-align: center; background: border-box;">
									</div>
								</div>
								<!-- Textarea -->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="dis">CONTENTS</label>
									<div class="col-md-10">
										<textarea class="form-control" id="dis" name="dis" rows="3" readonly style="background: border-box;">${faqModel.faq_content}</textarea>
									</div>
								</div>
								<!-- Button -->
								<div class="form-group">
									<label class="col-sm-2 control-label" for="submit"></label>
									<div class="col-md-10">
										<div class="form-group text-center" style="text-align: right; margin-right: 20px;">
											<c:url var="modifyURL" value="modifyForm">
												<c:param name="faq_num" value="faq_num" />
											</c:url>
											<c:url var="deleteURL" value="/faq/faqDelete.do">
												<c:param name="faq_num" value="faq_num" />
											</c:url>
											<c:if test="${member_id eq 'admin'}">
												<button type="button" id="list" class="btn btn-default" style="margin-right: 2px; margin-top: 3px; padding-left: 2px; padding-right: 2px; width: 50px; border: lightcoral;" onClick="javascript:location.href='<%=cp%>/faq/faqList.do?currentPage=${currentPage}'">LIST</button>
												<button type="button" id="modify" onClick="javascript:location.href='<%=cp%>/faq/faqModify.do?faq_num=${faq_num}&currentPage=${currentPage}'" class="btn btn-default" style="margin-right: 2px; margin-top: 3px; padding-left: 2px; padding-right: 2px; width: 50px; border: lightcoral;">
													<img src="<%=cp%>/img/modi.png" width="18">
												</button>
												<button type="button" id="delete" class="btn btn-default" style="margin-top: 3px; padding-left: 2px; padding-right: 2px; width: 50px; border: lightcoral;" onClick="javascript:location.href='<%=cp%>/faq/faqDelete.do?faq_num=${faq_num}&currentPage=${currentPage}'">
													<img src="<%=cp%>/img/trash.png" width="18">
												</button>
											</c:if>
											<c:if test="${member_id ne 'admin'}">
												<button type="button" id="list" class="btn btn-default" style="margin-right: 2px; border: lightcoral; margin-top: 3px; padding-left: 2px; padding-right: 2px; width: 50px;" onClick="javascript:location.href='<%=cp%>/faq/faqList.do?currentPage=${currentPage}'">LIST</button>
											</c:if>
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>