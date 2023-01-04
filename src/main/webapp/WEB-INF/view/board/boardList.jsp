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
<!-- icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23019901-1');
</script>

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
	<div class="container">
			<div class="row">
				<div class="col-lg-12">
					
					<div class="card">
						<c:if test="${memberId!=null && memberId ne ''}">
							<strong class="card-header">
								${memberId}의 게시글
							</strong>
						</c:if>
						<div class="card-body">
							<div class="row">
								<div class="col-2">
									<form action="${pageContext.request.contextPath}/board/boardList" class="d-flex align-items-center" id="pageForm">
										<input type="hidden" value="${memberId}" name="memberId">
										<input type="hidden" value="${search}" name="search">
										<select class="form-select me-sm-2" name="rowPerPage" id="rowPerPage">
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
								<div class="col-lg-4 mb-3 float-end">
									<form action="${pageContext.request.contextPath}/board/boardList" class="d-flex align-items-center">
										<input class="form-control me-sm-2" placeholder="제목 검색" type="search" name="search" value="${search}">
										<button type="submit" class="btn btn-secondary my-2 my-sm-0"><i class="bi bi-search"></i></button>
									</form>
								</div>
							</div>
							<div class="">
								<table class="table">
									<thead class="table-primary">
										<tr>
											<th scope="col" style="width: 9.25926%;">
												#
											</th>
											<th scope="col" style="width: 50.2346%;">
												제목
											</th>
											<th scope="col" style="width: 20.9383%;">
												작성자
											</th>
											<th scope="col" style="width: 20.9383%;">
												작성일
											</th>
										</tr>
									</thead>
									<!-- boardList 출력 -->
									<tbody>
										<c:forEach var="b" items="${boardList}">
											<tr>
												<th>${b.boardNo}</th>
												<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
												<td>
													<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${b.memberId}</a>
													<div class="dropdown-menu" style="">
									                    <a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList?memberId=${b.memberId}">게시글 더보기</a>
									                </div>
								                </td>
												
												<td>${b.createdate}</td>
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
												<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${beginPage-1}&search=${search}&rowPerPage=${rowPerPage}&memberId=${memberId}">&laquo;</a>
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
												<a class="page-link" href="${pageContext.request.contextPath}/board/boardList?currentPage=${beginPage+10}&search=${search}&rowPerPage=${rowPerPage}&memberId=${memberId}">&raquo;</a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
							<!-- /페이징 -->
						</div>
					</div>
					<div class="mt-1">
						<a href="${pageContext.request.contextPath}/board/addBoard" class="btn btn-sm btn-light" target="_blank">글쓰기</a>
					</div>
				</div>
			</div>
		</div>
	
</body>
</html>