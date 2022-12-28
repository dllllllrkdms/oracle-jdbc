<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>login</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#memberId').val().length==0){
				alert('아이디를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			if($('#memberPw').val().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#memberPw').focus();
				return;
			}
			$('#loginForm').submit();
		});
	})
</script>
</head>
<body>
	<h1>로그인</h1>
	<form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm">
		<div>
			아이디 : <input type="text" name="memberId" id="memberId">
		</div>
		<div>
			비밀번호 : <input type="password" name="memberPw" id="memberPw">
		</div>
		<div><button type="button" id="submitBtn">로그인</button></div>
	</form>
	<div><a href="${pageContext.request.contextPath}/member/addMember">회원가입하기</a></div>
</body>
</html>