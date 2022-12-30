<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>profile</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#memberName').val().length==0){
				alert('이름을 입력해주세요.');
				$('#memberName').focus();
				return;
			}
			$('#modifyMemberForm').submit();
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../inc/userMenu.jsp"></jsp:include>
	<main id="main" class="main">
		<section class="section profile">
			<div class="pagetitle">
				<h1>Profile</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
							<a href="${pageContext.request.contextPath}/home">Home</a>
						</li>
						<li class="breadcrumb-item">
							내 정보
						</li>
					</ol>
				</nav>
			</div>
			<div class="row">
				<div class="col-xl-12">
					<div class="card">
						<div class="card-body pt-3">
							<ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
								<li class="nav-items" role="presentation">
									<button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab" tabindex="-1">
										OverView
									</button>
								</li>
								<li class="nav-items" role="presentation">
									<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit" aria-selected="false" role="tab" tabindex="-1">
										Edit Profile
									</button>
								</li>
								<li class="nav-items" role="presentation">
									<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password" aria-selected="false" role="tab" tabindex="-1">
										Change Password
									</button>
								</li>
							</ul>
							<div class="tab-content pt-2">
								<div class="tab-pane fade profile-overview show active" id="profile-overview" role="tabpanel">
									<h5 class="card-title">Profile Detailes</h5>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">이름</div>
										<div class="col-lg-9 col-md-8">${m.memberName}</div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">아이디</div>
										<div class="col-lg-9 col-md-8">${m.memberId}</div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">가입일</div>
										<div class="col-lg-9 col-md-8">${m.createdate}</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade profile-overview" id="profile-edit" role="tabpanel">
								<form action="${pageContext.request.contextPath}/member/modifyMember" method="post" id="modifyMemberForm">
									<div class="row mb-3">
										<label for="memberName" class="col-md-4 col-lg-3 col-form-label">Name</label>
										<div class="col-md-8 col-lg-9">
											<input type="text" class="form-control" id="memberName" name="memberName" value="${m.memberName}">
										</div>
									</div>
									<div class="row mb-3">
										<label for="memberId" class="col-md-4 col-lg-3 col-form-label">ID</label>
										<div class="col-md-8 col-lg-9">
											<input type="text" class="form-control" id="memberId" name="memberId" value="${m.memberId}" readonly="readonly">
										</div>
									</div>
									<div class="text-center">
										<button type="button" class="btn btn-primary" id="submitBtn">수정</button>
									</div>
								</form>
							</div>
							
							<!-- 비밀번호 변경 -->
							<div class="tab-pane fade profile-overview" id="profile-overview" role="tabpanel">
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