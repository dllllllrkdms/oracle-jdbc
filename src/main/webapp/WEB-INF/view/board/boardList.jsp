<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
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
	<main id="main" class="main">
		<section class="section">
			<div class="pagetitle">
				<h1>게시판</h1>
			</div>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath}/board/boardList">전체글보기</a>
					</li>
					<c:if test="${memberId!=null}">
						<li class="breadcrumb-item">
							${memberId}의 게시글
						</li>
					</c:if>
				</ol>
			</nav>
			<div class="row">
				<div class="col-lg-12">
					
					<div class="card">
						<div class="card-body mt-3">
							
							<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
								<div class="dataTable-top">
									<div class="dataTable-dropdown">
										<form action="${pageContext.request.contextPath}/board/boardList" id="pageForm">
											<input type="hidden" value="${memberId}" name="memberId">
											<input type="hidden" value="${search}" name="search">
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
											<button type="submit" title="Search" class="btn btn-secondary"><i class="bi bi-search"></i></button>
										</form>
									</div>
								</div>
							</div>
							<div class="dataTable-container">
								<table class="table datatable dataTable-table">
									<thead class="table-primary">
										<tr>
											<th scope="col" style="width: 9.25926%;">
												#
											</th>
											<th scope="col" style="width: 30.2346%;">
												제목
											</th>
											<th scope="col" style="width: 20.9383%;">
												작성자
											</th>
											<th scope="col" style="width: 20.9383%;">
												작성일
											</th>
											<th scope="col" style="width: 10.4321%;">
												수정
											</th>
											<th scope="col" style="width: 10.1358%;">
												삭제
											</th>
										</tr>
									</thead>
									<!-- boardList 출력 -->
									<tbody>
										<c:forEach var="b" items="${boardList}">
											<tr>
												<th>${b.boardNo}</th>
												<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
												<td><a href="${pageContext.request.contextPath}/board/boardList?memberId=${b.memberId}">${b.memberId}</a></td>
												<td>${b.createdate}</td>
												<c:if test="${b.memberId eq loginMember.memberId}"> <!-- eq : jstl 문자열비교(같으면 true) -->
													<td><a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}">수정</a></td>
													<td><a id="deleteBoardBtn" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}">삭제</a></td>
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
												<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${beginPage-1}&search=${search}&rowPerPage=${rowPerPage}&memberId=${memberId}"><i class="bi bi-chevron-double-left"></i></a>
											</li>
										</c:if>
										<c:forEach var="p" begin="${beginPage}" end="${endPage}" step="1">
											<c:if test="${p eq currentPage}">
												<li class="page-item active">
													<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${p}&search=${search}&rowPerPage=${rowPerPage}&memberId=${memberId}">${p}</a>
												</li>
											</c:if>
											<c:if test="${p ne currentPage}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${p}&search=${search}&rowPerPage=${rowPerPage}&memberId=${memberId}">${p}</a>
												</li>
											</c:if>
										</c:forEach>
										<c:if test="${endPage<lastPage}">
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${beginPage+10}&search=${search}&rowPerPage=${rowPerPage}&memberId=${memberId}"><i class="bi bi-chevron-double-right"></i></a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
							<div class="mt-3">
								<a href="${pageContext.request.contextPath}/board/addBoard" class="btn btn-sm btn-outline-primary">글쓰기</a>
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
<svg id="SvgjsSvg1154" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;"><defs id="SvgjsDefs1155"></defs><polyline id="SvgjsPolyline1156" points="0,0"></polyline><path id="SvgjsPath1157" d="M-1 270.2L-1 270.2C-1 270.2 99.609375 270.2 99.609375 270.2C99.609375 270.2 166.015625 270.2 166.015625 270.2C166.015625 270.2 232.42187500000003 270.2 232.42187500000003 270.2C232.42187500000003 270.2 298.828125 270.2 298.828125 270.2C298.828125 270.2 365.234375 270.2 365.234375 270.2C365.234375 270.2 431.640625 270.2 431.640625 270.2C431.640625 270.2 431.640625 270.2 431.640625 270.2 "></path></svg>
</body>
</html>