<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>profile</title>
<script>
	$(document).ready(function(){
		$('#newMemberPw').focusin(function(){
			$('#pwMsg').text('4자이상 입력하세요.');
		});
		$('#newMemberPw').blur(function(){
			if($('#newMemberPw').val().length>=4){
				$('#pwMsg').text('');
			}
		});
		$('#modifyMemberBtn').click(function(){
			if($('#memberName').val().length==0){
				alert('이름을 입력해주세요.');
				$('#memberName').focus();
				return;
			}
			$('#modifyMemberForm').submit();
		});
		$('#modifyMemberPwBtn').click(function(){
			if($('#memberPw').val().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#memberPw').focus();
				return;
			}
			if($('#newMemberPw').val().length<4){
				alert('새 비밀번호를 입력해주세요.');
				$('#newMemberPw').focus();
				return;
			}
			if($('#newMemberPwCheck').val()!=$('#newMemberPw').val()){
				alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
				$('#newMemberPw').focus();
				return;
			}
			$('#modifyMemberPwForm').submit();
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../inc/userMenu.jsp"></jsp:include>
		<div class="container">
			<div class="col-lg-6">
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
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation">
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
								<div class="tab-pane fade show active" id="profile-overview" role="tabpanel">
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
									<div><a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a></div>
								</div>
							
								<div class="tab-pane fade" id="profile-edit" role="tabpanel">
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
											<button type="button" class="btn btn-primary" id="modifyMemberBtn">수정</button>
										</div>
									</form>
								</div>
								
								<!-- 비밀번호 변경 -->
								<div class="tab-pane fade" id="profile-change-password" role="tabpanel">
									<form action="${pageContext.request.contextPath}/member/modifyMemberPw" method="post" id="modifyMemberPwForm">
										<input type="hidden" name="memberId" value="${m.memberId}">
										<div class="row mb-3">
											<label for="memberPw" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
											<div class="col-md-8 col-lg-9">
												<input type="password" class="form-control" id="memberPw" name="memberPw">
											</div>
										</div>
										<div class="row mb-3">
											<label for="newMemberPw" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
											<div class="col-md-8 col-lg-9">
												<input type="password" class="form-control" id="newMemberPw" name="newMemberPw">
												<div id="pwMsg"></div>
											</div>
										</div>
										<div class="row mb-3">
											<label for="newMemberPwCheck" class="col-md-4 col-lg-3 col-form-label">비밀번호 확인</label>
											<div class="col-md-8 col-lg-9">
												<input type="password" class="form-control" id="newMemberPwCheck" name="newMemberPwCheck">
											</div>
										</div>
										<div class="text-center">
											<button type="button" class="btn btn-primary" id="modifyMemberPwBtn">수정</button>
										</div>
									</form>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>