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
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23019901-1');
</script>

<title>addMember</title>
<script>
	$(document).ready(function(){
		$('#memberId').focusin(function(){
			$('#idMsg').text('4자이상 입력하세요.');
		});
		$('#memberId').blur(function(){
			if($('#memberId').val().length>=4){
				$('#idMsg').text('');
			}
		});
		$('#memberPw').focusin(function(){
			$('#pwMsg').text('4자이상 입력하세요.');
		});
		$('#memberPw').blur(function(){
			if($('#memberPw').val().length>=4){
				$('#pwMsg').text('');
			}
		});
		$('#submitBtn').click(function(){
			if($('#memberName').val().length==0){
				alert('이름을 입력해주세요.');
				$('#memberName').focus();
				return;
			}
			if($('#memberId').val().length<4){
				alert('아이디를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			if($('#memberPw').val().length<4){
				alert('비밀번호를 입력해주세요.');
				$('#memberPw').focus();
				return;
			}
			if($('#memberPw').val()!=$('#checkPw').val()){
				alert('비밀번호확인이 일치하지 않습니다.')
				return;
			}
			$('#addMemberForm').submit();
		});
	});
</script>
</head>
<body>
		<div class="container">
			<div class="register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4"> 
								<a href="${pageContext.request.contextPath}/home" class="logo d-flex align-items-center w-auto">
									<span class="d-none d-lg-block">GOODEE</span>
								</a>
							</div>
							<div class="card mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
										<p class="text-center small">Enter your personal details to create account</p>
									</div>
									
									<form action="${pageContext.request.contextPath}/member/addMember" method="post" id="addMemberForm" class="row g-3">
										<div class="col-12">
											<label for="memberName" class="form-label">Name</label>
											<input type="text" name="memberName" class="form-control" id="memberName" value="${m.memberName}">
										</div>
										
										<div class="col-12">	<!-- !!!!! 중복확인 !!!!! -->
											<label for="memberId" class="form-label">ID</label>
											<input type="text" name="memberId" class="form-control" id="memberId" value="${m.memberId}">
											<div id="idMsg" style="color:red;">
												<c:if test="${idDupResult==false}">
													이미 사용중인 아이디입니다.
												</c:if>
											</div>
										</div>
										<div class="col-12">
											<label for="memberPw" class="form-label">Password</label>
											<input type="password" name="memberPw" class="form-control" id="memberPw">
											<div id="pwMsg" style="color:red;"></div>
										</div>
										<div class="col-12">
											<label for="memberPw" class="form-label">confirm password</label>
											<input type="password" name="checkPw" class="form-control" id="checkPw">
										</div>
										<div class="col-12 mt-3">
											<button class="btn btn-primary w-100" type="button" id="submitBtn">회원가입</button>
										</div>
										<div class="col-12 mt-1">
											<p class="small mb-0">이미 회원이라면 ? <a href="${pageContext.request.contextPath}/member/login"> 로그인</a></p>
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