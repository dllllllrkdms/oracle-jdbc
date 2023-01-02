<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sandstone/bootstrap.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
<!-- custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23019901-1');
</script>

<title>boardOne</title>
<script>
	$(document).ready(function(){
		$('#deleteBoardBtn').click(function(){
			let alert = confirm('삭제하시겠습니까?');
			if(alert==true){
				return true;
			}
			if(alert==false){
				return false;
			}
		}); 
	});
</script>
</head>
<body>
<!-- header -->
	<jsp:include page="../../inc/userMenu.jsp"></jsp:include>
		<div class="container">
			<div class="col-lg-6">
				<h1>게시판</h1>
			</div>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath}/board/boardList">전체글보기</a>
					</li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${b.memberId eq loginMember.memberId}"> <!-- eq : jstl 문자열비교(같으면 true) -->
						<a class="btn btn-sm btn-light" href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}">수정</a>
						<a class="btn btn-sm btn-light" id="deleteBoardBtn" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}">삭제</a>
					</c:if>
					<div class="card">
						<div class="card-body px-lg-5">
							<div class="pt-lg-5 pb-2 pb-2">
								<h4 class="card-title">
										${b.boardTitle}
								</h4>
							</div>
							<div class="row">
								<div class="pt-2 pb-2">
									${b.boardContent}
								</div>
							</div>
							<div class="card-footer">
								<div class="mt-3 mb-3">
									${b.memberId} &nbsp; ${b.createdate}
								</div>
							</div>
						</div>
					</div>
					<a href="${pageContext.request.contextPath}/board/addBoard" class="btn btn-sm btn-light">글쓰기</a>
					<c:if test="${b.memberId eq loginMember.memberId}"> <!-- eq : jstl 문자열비교(같으면 true) -->
						<a class="btn btn-sm btn-light" href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}">수정</a>
						<a class="btn btn-sm btn-light" id="deleteBoardBtn" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}">삭제</a>
					</c:if>
				</div>
			</div>
		</div>
</body>
</html>