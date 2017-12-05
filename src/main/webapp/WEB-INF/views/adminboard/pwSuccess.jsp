<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>
<script type="text/javascript">

function test(){
var chk	= ${modi}
	if(chk=="1"){
		if(window.name == 'modify'){
			window.opener.parent.location.href="boardModify.do?board_num=${board_num}&currentPage=${currentPage}";
			window.close();	
		}else if(window.name == 'Delete'){
			alert('삭제 되었습니다.');
			window.opener.parent.location.href="BoardDelete.do?board_num=${board_num}&ref=${ref}&currentPage=${currentPage}";
			window.close();	
		}else if(window.name == 'type'){
			alert('접근 되었습니다.');
			window.opener.parent.location.href="boardDetail.do?board_num=${board_num}&ref=${ref}&currentPage=${currentPage}";
			window.close();	
		}
		window.close();	
	}
	if(chk=="2"){
		alert('비밀번호가 틀렸습니다');
		history.back();
	}
}

</script>
</head>
<body>
	<script>test()</script>
</body>
</html>