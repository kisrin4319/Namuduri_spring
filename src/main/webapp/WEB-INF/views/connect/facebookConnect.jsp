<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Hello Facebook</title>
</head>
<body>

	<h3>Connect to Facebook</h3>
	
	<form action="/connect/facebook" method="POST">
		<input type="hidden" name="scope" value="user_posts"/>
		<div class="formInfo">
			<p>Click the button</p>
		</div>
		<p><button type="submit">Connect to Facebook</button>
	</form>

</body>
</html>