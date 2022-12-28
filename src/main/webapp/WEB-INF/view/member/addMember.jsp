<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>addMember</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#memberName').val().length==0){
				alert('이름을 입력해주세요.');
				$('#memberName').focus();
				return;
			}
			if($('#memberId').val().length==0){
				alert('아이디를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			if($('#memberPw').val().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			if($('#memberPw').val()!=$('#checkPw').val()){
				alert('비밀번호확인이 일치하지 않습니다.')
				return;
			}
			$('#addMemberForm').submit();
		});
	});
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/member/addMember" method="post" id="addMemberForm">
		<div>
			이름 : <input type="text" name="memberName" id="memberName">
		</div>
		<div>	<!-- !!!!! 중복확인 !!!!! -->
			아이디 : <input type="text" name="memberId" id="memberId">
		</div>
		<div>
			비밀번호 : <input type="password" name="memberPw" id="memberPw">
		</div>
		<div>
			비밀번호 확인 : <input type="password" name="checkPw" id="checkPw">
			<div><span id="pwMsg"></span></div>
		</div>
		<div><button type="button" id="submitBtn">회원가입</button></div>
	</form>
	<a href="${pageContext.request.contextPath}/member/login">로그인</a>
</body>
</html>