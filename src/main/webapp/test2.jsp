<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- google Login api -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<style type="text/css">
#customBtn {
	display: inline-block;
	background: white;
	color: #444;
	white-space: nowrap;
}

#customBtn:hover {
	cursor: pointer;
}

span.label {
	font-family: serif;
	font-weight: normal;
}

span.icon {
	background: url('/data/google_ico.png') no-repeat;
	display: inline-block;
	width: 67px;
	height: 68px;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 0px;
	padding-right: 0px;
	font-size: 0px;
	font-weight: bold;
	font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
	<div id="gSignInWrapper">
		<span class="label"></span>
		<div id="customBtn" class="customGPlusSignIn">
			<span class="icon"></span>
		</div>
	</div>
	<div id="name"></div>
	<script>startApp()</script>
	<script>
  var googleUser = {};
  var startApp = function() {
    gapi.load("auth2", function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: "430288509925-7ka216494n4nm9j4coqt7m8dr06n8ar6.apps.googleusercontent.com",
        cookiepolicy: 'single_host_origin',
        // Request scopes in addition to 'profile' and 'email'
        scope: 'profile email'
      });
      attachSignin(document.getElementById('customBtn'));
    });
  };
  function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
           $.ajax({
              type:"post",
           dataType:"json",
              url:"/indb.jsp",
              data : {
                 "email":googleUser.getBasicProfile().getEmail(),
                 "id":googleUser.getBasicProfile().getId(),
                 "nickname":googleUser.getBasicProfile().getName(),
              },
              success:function(data){
               if(data.login == "success"){
                 alert("로그인되었습니다");
                     location.href="/";
              },
              error:function(data){
                 alert('error:'+data.result);
              }
           });
        }, function(error) {
            alert(JSON.stringify(error, undefined, 2));
        });
  }
  </script>
</body>
</html>