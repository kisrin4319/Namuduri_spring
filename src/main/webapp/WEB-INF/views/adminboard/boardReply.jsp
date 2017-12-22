<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	background-color: #5bc0de !important;
	color: white;
}

.no-margin-form-group {
	margin: 0 !important;
}

.requerido {
	color: red;
}

.btn-orange-md {
	color: white;
}

.btn-orange-md:hover {
	color: white !important;
}
</style>
<link href='http://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 style="text-align: -webkit-center; padding-top: 30px;">Q&A</h2>
			<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
				<li style="margin-bottom: 25px;">
					<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
				</li>
				<li style="margin-bottom: 25px;">
					<a title="Go to Shopping" href="<%=cp%>/books/booksList.do" style="font-style: oblique;">SHOP</a>
				</li>
			</ul>
			<div class="col-md-12">
				<form action="<%=cp%>/board/BoardReply.do" method="post" name="regform" id="regform" onsubmit="return validation();">
					<input type="hidden" name="board_num" value="${boardModel.board_num}" />
					<input type="hidden" name="currentPage" value="${currentPage}" />
					<input type="hidden" name="id" value="${session_member_id}" />
					<input type="hidden" name="name" value="${session_member_name}" />
					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<div class="panel">
								<div class="panel-heading custom-header-panel">
									<h3 class="panel-title roboto"></h3>
								</div>
								<div class="panel-body">
									<div class="form-group">
										<label for="country" class="col-sm-4 control-label">
											TYPE
											<span class="requerido"> *</span>
										</label>
										<div class="col-sm-8">
											<select name="board_type" class="form-control">
												<c:if test="${member_id ne 'admin'}">
													<option value="0" selected="selected">공개글</option>
													<option value="1">비공개글</option>
												</c:if>
												<c:if test="${member_id eq 'admin'}">
													<option value="0" selected="selected">공개글</option>
													<option value="1">비공개글</option>
													<option value="2">공지사항</option>
												</c:if>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="name">
											NAME
											<span class="requerido"> *</span>
										</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="member_id" id="member" value="${member_id}" maxlength="20">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="rut">
											PW
											<span class="requerido"> *</span>
										</label>
										<div class="col-sm-8">
											<input type="password" name="board_pw" id="passwd" value="" class="form-control rut" maxlength="20">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="name">
											TITLE
											<span class="requerido"> *</span>
										</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" name="board_title" id="title" value="[답변]${boardModel.board_title}" maxlength="50">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="name">
											CONTENTS
											<span class="requerido"> *</span>
										</label>
										<div class="col-sm-8">
											<textarea class="form-control" name="board_content" id="content" rows="6"></textarea>
										</div>
									</div>
									<!--Fin datos personales-->
									<div class="form-group text-center" style="text-align: center;">
										<button type="button" id="cancel" class="btn btn-orange-md roboto" style="background: #f44336; margin-right: 5px; margin-top: 5px;" onclick="javascript:location.href='boardList.do'">CANCEL</button>
										<button type="submit" id="write" class="btn btn-orange-md roboto" style="background: #5bc0de; margin-top: 5px;">WRITE</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- Fint form -->
			</div>
		</div>
		<!-- Tab panes -->
	</div>
	<script type="text/javascript">
		function validation() {

			var frm = document.regform;

			if (frm.board_title.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} else if (frm.member_id.value == "") {
				alert("이름을 입력해주세요.");
				return false;
			}

			else if (frm.board_pw.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if (frm.board_content.value == "") {
				alert("내용을 입력해주세요.");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>