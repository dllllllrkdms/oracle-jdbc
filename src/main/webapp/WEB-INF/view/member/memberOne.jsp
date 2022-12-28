<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberOne</title>
</head>
<body>
	<h1> 회원 정보 </h1>
	<div> 아이디 : ${m.memberId}</div>
	<div> 이름 : ${m.memberName}</div>
	<div> 가입일 : ${m.createdate}</div>
	
	<div><a href="${pageContext.request.contextPath}/member/modifyMember">수정하기</a></div>
	<div><a href="${pageContext.request.contextPath}/member/removeMember">탈퇴하기</a></div>
</body>
</html>