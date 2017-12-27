<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>eFeelog</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
  function bookSearch() {
    var searchUrl = 'http://localhost:8080/namuduri/efeelogSearchView.do';
    window.open(searchUrl, "confirm", "toolbar=no, location=no, status=no, scrollbars=no, resizable=no, width=350, height=350");
  }

  function goPage() {
    var f = $('form#efeelog')
    f.submit();
  }
</script>
<style type="text/css">
.text-primary {
	color: #333333 !important;
}

.create-account-form {
	height: 450px;
	border-radius: 10px;
	padding-top: 10px;
}
</style>
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
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
							<aside class="widget widget-categories">
								<h2 class="sidebar-title text-center">CATEGORY</h2>
								<ul class="sidebar-menu">
									<li>
										<a href="<%=cp%>/order/orderListCheckView.do">
											<i class="fa fa-angle-double-right"></i>
											주문/배송 조회
										</a>
									</li>
									<li>
										<a href="<%=cp%>/member/memberModifyView.do">
											<i class="fa fa-angle-double-right"></i>
											회원 정보수정
										</a>
									</li>
									<li>
										<a href="<%=cp%>/member/memberDeleteView.do">
											<i class="fa fa-angle-double-right"></i>
											회원 탈퇴
										</a>
									</li>
									<li>
										<a href="<%=cp%>/eFeelogView.do">
											<i class="fa fa-angle-double-right"></i>
											eFeelog
										</a>
									</li>
								</ul>
							</aside>
						</div>
						<form class="create-account-form" name="efeelog" id="efeelog" action="eFeelogList.do" method="post" style="padding-top: 10px; margin-top: 30px; height: 498px;">
							<div class="form-group">
								<table>
									<thead>
										<tr>
											<th>
												<div class="user_name">${ member_id }님&nbsp;안녕하세요.</div>
												<br />
												<p>eFeelog 당신의 Feel을 공유해보세요.</p>
											</th>
										</tr>
									</thead>
								</table>
								<div class="text-center">
									<button type="button" class="btn btn-primary btn-block" onclick="javascript:bookSearch(this.form)">
										<span class="glyphicon glyphicon-book"></span>
										Book Search
									</button>
								</div>
								<br>
								<div class="form-group">
									<img src=" " id="book_img" class="img-responsive center-block" style="width: 176px; margin-bottom: 5px; height: 200px;">
									<input type="hidden" name="book_num" id="book_num">
									<table>
										<thead>
											<tr>
												<td>
													<textarea class="form-control" rows="3" cols="30" name="memo"></textarea>
												</td>
											</tr>
										</thead>
									</table>
								</div>
								<div class="text-center">
									<input type="button" class="btn btn-primary btn-block" value="게시글 올리기" onclick="goPage()">
								</div>
							</div>
						</form>
					</div>
				</div>
				<c:forEach var="item" items="${ efList }" varStatus="stat">
					<div class="col-sm-3 col-md-3 col-xs-12" style="padding-right: 0px;">
						<form class="create-account-form" name="efeelogList" id="efeelogList">
							<div class="form-group" style="text-align: -webkit-center;">
								<table>
									<thead>
										<tr>
											<th>
												<div class="user_name">${ item.member_id }님</div>
											</th>
										</tr>
									</thead>
								</table>
								<br>
								<table>
									<thead>
										<tr>
											<td>
												<div class="write_date">
													<fmt:formatDate value="${ item.efeelog_regdate }" pattern="yyyy-MM-dd" />
												</div>
											</td>
										</tr>
									</thead>
								</table>
								<br>
								<div class="form-group">
									<table>
										<thead>
											<tr>
												<p class="text-center">
													<span class="text-primary">${ item.book_name }</span>
												</p>
											</tr>
										</thead>
									</table>
									<img src="<%=cp%>/upload/${ item.book_image }" class="img-responsive center-block" style="width: 176px;">
								</div>
								<table>
									<thead>
										<td>${ item.efeelog_memo }</td>
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