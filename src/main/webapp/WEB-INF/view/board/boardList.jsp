<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	// 20 -> 10 -> 20 되는 이유찾기...
	$(document).ready(function(){
		$(`#rowPerPage option[value=${rowPerPage}]`).prop('selected', 'selected');
		$('#rowPerPage').change(function(){
			let rowPerPage = $("#rowPerPage option:selected").val();
			console.log(rowPerPage);
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
												<option value="10">10개씩</option>
												<option value="20">20개씩</option>
												<option value="30">30개씩</option>
											</select>
										</form>
									</div>
									<!-- 검색창 -->
									<div class="dataTable-search">
										<form action="${pageContext.request.contextPath}/board/boardList" class="search-form d-flex align-items-center">
											<input class="dataTable-input" placeholder="Search..." type="text" name="search" title="Enter search keyword">
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
											<th scope="col" data-sortable="" style="width: 40.2346%;">
												<a href="#" class="dataTable-sorter">제목</a>
											</th>
											<th scope="col" data-sortable="" style="width: 20.9383%;">
												<a href="#" class="dataTable-sorter">작성일</a>
											</th>
											<th scope="col" data-sortable="" style="width: 15.4321%;">
												<a href="#" class="dataTable-sorter">수정</a>
											</th>
											<th scope="col" data-sortable="" style="width: 15.1358%;">
												<a href="#" class="dataTable-sorter">삭제</a>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="b" items="${boardList}">
											<tr>
												<th>${b.boardNo}</th>
												<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
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
							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to 5 of 5 entries</div>
								<nav class="dataTable-pagination">
									<ul class="dataTable-pagination-list">
										<li class="page-item">
											<a href="${pageContext.request.contextPath}/board/boardList?currentPage=${currentPage-1}">이전</a>
										</li>
										<li class="page-item">
											<a href="${pageContext.request.contextPath}/board/boardList?currentPage=${currentPage+1}">다음</a>
										</li>
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