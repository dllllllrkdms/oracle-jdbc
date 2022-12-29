<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- Core JSTL 사용 -->
<div>
	<c:if test="${not empty loginMember}"> <!-- not empty : null이 아닌지 확인 -->
		${loginMember.memberName}님 환영합니다.
		<a href="${pageContext.request.contextPath}/member/memberOne">내정보</a>
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
	<c:if test="${empty loginMember}"> <!-- empty : null인지 확인 -->
		<a href="${pageContext.request.contextPath}/member/login">로그인</a>
	</c:if>
</div>