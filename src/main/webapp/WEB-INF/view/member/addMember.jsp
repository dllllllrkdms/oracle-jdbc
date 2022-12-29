<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>addMember</title>
<script>
	$(document).ready(function(){
		$('#memberId').focusin(function(){
			$('#idMsg').text('4자이상 입력하세요.');
		});
		$('#memberId').blur(function(){
			if($('#memberId').val().length>=4){
				$('#idMsg').text('');
			}
		});
		$('#memberPw').focusin(function(){
			$('#pwMsg').text('4자이상 입력하세요.');
		});
		$('#memberPw').blur(function(){
			if($('#memberPw').val().length>=4){
				$('#pwMsg').text('');
			}
		});
		$('#submitBtn').click(function(){
			if($('#memberName').val().length==0){
				alert('이름을 입력해주세요.');
				$('#memberName').focus();
				return;
			}
			if($('#memberId').val().length<4){
				alert('아이디를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			if($('#memberPw').val().length<4){
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
			이름 : <input type="text" name="memberName" id="memberName" value="${m.memberName}">
		</div>
		
		<div>	<!-- !!!!! 중복확인 !!!!! -->
			아이디 : <input type="text" name="memberId" id="memberId" value="${m.memberId}">
			<div id="idMsg">
			<c:if test="${idDupResult==false}">
				이미 사용중인 아이디입니다.
			</c:if>
			</div>
		</div>
		<div>
			비밀번호 : <input type="password" name="memberPw" id="memberPw">
			<div id="pwMsg"></div>
		</div>
		<div>
			비밀번호 확인 : <input type="password" name="checkPw" id="checkPw">
		</div>
		<div><button type="button" id="submitBtn">회원가입</button></div>
	</form>
	이미 회원이라면 ?<a href="${pageContext.request.contextPath}/member/login">로그인</a>
</body>
</html>