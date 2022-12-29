<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link rel="stylesheet" href="https://bootstrapmade.com/assets/css/demo-4.2.css">
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/simple-datatables/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>boardList</title>
<script>
	$(document).ready(function(){
		$('#rowPerPage').change(function(){
			$('#pageForm').submit();
		});
	});
</script>
</head>
<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>게시판</h1>
		</div>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">게시판</h5>
							<div><a href="${pageContext.request.contextPath}/board/addBoard">글쓰기</a></div>
							<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
								<div class="dataTable-top">
									<div class="dataTable-dropdown">
										<form action="${pageContext.request.contextPath}/board/boardList" id="pageForm">
											<select class="dataTable-selector" name="rowPerPage" id="rowPerPage">
												<c:forEach var="v" begin="10" end="30" step="10">
													<c:if test="${rowPerPage eq v}">
														<option value="${v}" selected="selected">${v}개씩</option>
													</c:if>
													<c:if test="${rowPerPage ne v}">
														<option value="${v}">${v}개씩</option>
													</c:if>
												</c:forEach>
											</select>
										</form>
									</div>
									<!-- 검색창 -->
									<div class="search-bar">
										<form action="${pageContext.request.contextPath}/board/boardList" class="search-form d-flex align-items-center">
											<input class="dataTable-input" placeholder="제목 검색" type="text" name="search" title="Enter search keyword" value="${search}">
											<button type="submit" title="Search"><i class="bi bi-search"></i></button>
										</form>
									</div>
								</div>
							</div>
							<div class="dataTable-container">
								<table class="table datatable dataTable-table">
									<thead>
										<tr>
											<th scope="col" data-sortable="" style="width: 9.25926%;">
												<a href="#" class="dataTable-sorter">#</a>
											</th>
											<th scope="col" data-sortable="" style="width: 30.2346%;">
												<a href="#" class="dataTable-sorter">제목</a>
											</th>
											<th scope="col" data-sortable="" style="width: 20.9383%;">
												<a href="#" class="dataTable-sorter">작성자</a>
											</th>
											<th scope="col" data-sortable="" style="width: 20.9383%;">
												<a href="#" class="dataTable-sorter">작성일</a>
											</th>
											<th scope="col" data-sortable="" style="width: 10.4321%;">
												<a href="#" class="dataTable-sorter">수정</a>
											</th>
											<th scope="col" data-sortable="" style="width: 10.1358%;">
												<a href="#" class="dataTable-sorter">삭제</a>
											</th>
										</tr>
									</thead>
									<!-- boardList 출력 -->
									<tbody>
										<c:forEach var="b" items="${boardList}">
											<tr>
												<th>${b.boardNo}</th>
												<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
												<td>${b.memberId}</td>
												<td>${b.createdate}</td>
												<c:if test="${b.memberId eq loginMember.memberId}"> <!-- eq : jstl 문자열비교(같으면 true) -->
													<td><a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}">수정</a></td>
													<td><a href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}">삭제</a></td>
												</c:if>
												<c:if test="${b.memberId ne loginMember.memberId}"> <!-- ne : jstl 문자열비교(다르면 true) -->
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- 페이징 -->
							<div class="mt-4">
								<nav class="page">
									<ul class="pagination justify-content-center">
										<c:if test="${beginPage>1}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${beginPage-1}&search=${search}"><i class="bi bi-chevron-double-left"></i></a>
											</li>
										</c:if>
										<c:forEach var="p" begin="${beginPage}" end="${endPage}" step="1">
											<c:if test="${p eq currentPage}">
												<li class="page-item active">
													<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${p}&search=${search}">${p}</a>
												</li>
											</c:if>
											<c:if test="${p ne currentPage}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${p}&search=${search}">${p}</a>
												</li>
											</c:if>
										</c:forEach>
										<c:if test="${endPage<lastPage}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${beginPage+10}&search=${search}"><i class="bi bi-chevron-double-right"></i></a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- footer 삭제 X -->
	<footer id="footer" class="footer">
		<div class="copyright"> © Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved</div>
		<div class="credits"> Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a></div>
	</footer>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center active"><i class="bi bi-arrow-up-short"></i></a>
	
<script src="${pageContext.request.contextPath}/resources/vendor/apexcharts/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/chart.umd.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/quill/quill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/tinymce/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-P7JSYB1CSP"></script>
<script>if( window.self == window.top ) { window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'G-P7JSYB1CSP'); }</script>
</body>
</html>