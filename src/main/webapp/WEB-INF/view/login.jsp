<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="${pageContext.request.contextPath}/LoginActionController" method="post" id="loginForm">
		<div>
			아이디 : <input type="text" name="memberId">
		</div>
		<div>
			비밀번호 : <input type="password" name="memberPw">
		</div>
		<div><button type="submit">로그인</button></div>
	</form>
</body>
</html>