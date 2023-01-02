<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- Core JSTL 사용 -->


<!-- header -->
<div class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="#">Oracle</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">Board</a>
        </li>
      </ul>
      
		<ul class="navbar-nav">
	        <!-- user -->
	        <c:if test="${empty loginMember}"> <!-- empty : null인지 확인 -->
	        	<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a>
				</li>
			</c:if>
	        <c:if test="${not empty loginMember}"> <!-- not empty : null이 아닌지 확인 -->
	          <li class="nav-item dropdown">
	          	<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${loginMember.memberName}님</a>
	          
		          <div class="dropdown-menu">
		            <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberOne">내 정보</a>
		            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a>
		          </div>
	          </li>
		    </c:if>
		</ul>
    </div>
  </div>
</div>