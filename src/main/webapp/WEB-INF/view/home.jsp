<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
	${loginMember.memberName}님 환영합니다.
	<a href="${pageContext.request.contextPath}/BoardListController">게시판</a>
	<a href="${pageContext.request.contextPath}/LogoutController">로그아웃</a>
</body>
</html>