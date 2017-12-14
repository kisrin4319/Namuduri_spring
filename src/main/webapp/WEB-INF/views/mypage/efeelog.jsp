<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script type="text/javascript">
  function bookSearch() {
    var searchUrl = 'http://localhost:8080/namuduri/efeelogSearchView.do';
    window.open(searchUrl, "confirm", "toolbar=no, location=no, status=no, scrollbars=no, resizable=no, width=350, height=350");
  }

  function goPage() {
    var f = $('form#efeelog');
    f.submit();
  }
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
				<div class="col-md-2 col-sm-3 col-xs-12">
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
					</div>
				</div>
				<div class="col-md-3">
					<form class="create-account-form" name="efeelog" id="efeelog" action="eFeelogList.do" method="post">
						<div class="form-group">
							<table>
								<thead>
									<tr>
										<th>
											<div class="user_name">${ member_id }님안녕하세요.</div>
										</th>
									</tr>
								</thead>
							</table>
							<br>
							<br>
							<div class="btn-toolbar">
								<button type="button" class="btn btn-default btn-lg" onclick="javascript:bookSearch(this.form)">
									<span class="glyphicon glyphicon-book"></span>
									Search
								</button>
							</div>
							<div class="form-group">
								<img src="" id="book_img">
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
								<br>
								<br>
							</div>
							<div>
								<input type="button" class="btn-default" value="게시글 올리기" onclick="goPage()">
								<!-- <span>
											<i class="fa fa-user"></i>
											게시글 올리기
										</span> -->
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
											<th>
												<div class="user_name">${ session_id }님</div>
											</th>
										</tr>
									</thead>
								</table>
								<br>
								<table>
									<thead>
										<tr>
											<td>
												<div class="write_date">${ item.efeelog_regdate }</div>
											</td>
										</tr>
									</thead>
								</table>
								<div class="form-group">
									<table>
										<thead>
											<tr>
												<td align="center">${ item.book_name }</td>
											</tr>
										</thead>
									</table>
									<img src="<%=cp%>/upload/${ item.book_image }" id="book_img">
								</div>
								<table>
									<thead>
										<td>
											<textarea class="form-control" rows="3" cols="30" name="memo">${ item.efeelog_memo }</textarea>
										</td>
										<%-- <tr>
											<td align="center">${ item.efeelog_memo }</td>
										</tr> --%>
									</thead>
								</table>
								<!-- <table>
									<thead>
										<tr>
											<td align="center"></td>
										</tr>
									</thead>
								</table> -->
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>