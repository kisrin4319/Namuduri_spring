<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 확인</title>

<script type="text/javascript">
	function locationURL()
	{
		if(window.name == 'modify'){
			window.opener.parent.location.href="modifyForm.do?board_num=<s:property value="board_num" />&currentPage=<s:property value="currentPage" />";			
		}else if(window.name == 'Delete'){
			alert('삭제 되었습니다.');
			window.opener.parent.location.href="deleteAction.do?board_num=<s:property value="board_num" />&currentPage=<s:property value="currentPage" />";
		}else if(window.name == 'type'){
			alert('접근 되었습니다.');
			window.opener.parent.location.href="viewAction.do?board_num=<s:property value="board_num" />&currentPage=<s:property value="currentPage" />";
		}
		
		window.close();	
	}
</script>
</head>
<body>
<script>locationURL()</script>
</body>
</html>