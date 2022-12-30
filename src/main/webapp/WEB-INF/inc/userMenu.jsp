<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- Core JSTL 사용 -->
<header id="header" class="header fixed-top d-flex align-items-center ">
	<div class="d-flex align-items-center justify-content-between ms-3"> 
		<a href="${pageContext.request.contextPath}/home" class="logo d-flex align-items-center"> 
			<div class="fs-3"><i class="ri-home-3-fill"></i></div>
			<span class="d-none d-lg-block">GOODEE</span> 
		</a> 
	</div>
	<!-- user -->
	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center me-3">
			<li class="nav-item mx-lg-4"> 
				<a class="nav-link nav-profile d-flex align-items-center pe-0" href="${pageContext.request.contextPath}/board/boardList">
					<i class="ri-file-list-2-line"></i>
					<span class="d-none d-md-block ps-2">게시판</span>
				</a>
			</li>
			<c:if test="${empty loginMember}"> <!-- empty : null인지 확인 -->
				<li class="nav-item mx-lg-4"> 
					<a class="nav-link nav-profile d-flex align-items-center pe-0" href="${pageContext.request.contextPath}/member/login">
						<i class="ri-account-circle-line"></i>
						<span class="d-none d-md-block ps-2">로그인</span>
					</a>
				</li>
			</c:if>
			<c:if test="${not empty loginMember}"> <!-- not empty : null이 아닌지 확인 -->
				<li class="nav-item dropdown pe-3">
					<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="ri-account-circle-fill"></i>
						<span class="d-none d-md-block dropdown-toggle ps-2">${loginMember.memberName}님 환영합니다.</span>
					</a>
					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(-45px, 38px);" data-popper-placement="bottom-end" data-popper-reference-hidden="">
						<li> 
							<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/member/memberOne">
								내 정보	
							</a>
						</li>
						<li> 
							<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/logout">
								로그아웃
							</a>
						</li>
					</ul>
				</li>
			</c:if>
		</ul>
	</nav>
</header>