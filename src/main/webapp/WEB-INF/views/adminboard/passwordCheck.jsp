<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.form-gap {
    padding-top: 70px;
}
</style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
 <div class="form-gap"></div>
<div class="container">
	<div class="row" style="text-align: center;">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">PASSWORD</h2>
                  <div class="panel-body">
					 <form action="checkAction.do" method="post">
						<input type="hidden" name="board_num" value="${board_num}" />
						<input type="hidden" name="currentPage" value="${currentPage}" />
						<input type="hidden" name="ref" value ="${ref }" />
						<tbody>
								<td width="270">
									&nbsp;&nbsp;
									<input type="text" name="board_pw" maxlength="40" style="text-align: center; margin-right: 20px;"><br/>
									<button type="submit" class="btn btn-info" style="background: white; color: black; font-style: oblique; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; text-align: center; margin-top: 5px;">ENTER</button>
								</td>
							</tr>
						</tbody>
				</form>
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
</body>
</html>