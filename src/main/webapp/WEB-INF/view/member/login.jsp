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
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23019901-1');
</script>

<title>login</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#memberId').val().length==0){
				alert('아이디를 입력해주세요.');
				$('#memberId').focus();
				return;
			}
			if($('#memberPw').val().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#memberPw').focus();
				return;
			}
			$('#loginForm').submit();
		});
	})
</script>
</head>
<body>
		<div class="container">
			<div class="min-vh-100 d-flex flex-column align-items-center justify-content-center">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4"> 
								<a href="${pageContext.request.contextPath}/home" class="logo d-flex align-items-center w-auto">
									<span class="d-none d-lg-block">GOODEE</span>
								</a>
							</div>
							<div class="card bg-lignt mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
										<p class="text-center small">Enter your id &amp; password to login</p>
									</div>
									<form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm" class="row g-3" >
										<div class="col-12">
											<label for="memberId" class="form-label">ID</label>
											<input type="text" name="memberId" class="form-control" id="memberId">
										</div>
										<div class="col-12">
											<label for="memberPw" class="form-label">Password</label>
											<input type="password" name="memberPw" class="form-control" id="memberPw">
										</div>
										<div class="col-12 mt-3">
											<button class="btn btn-primary w-100" id="submitBtn" type="button">로그인</button>
										</div>
										<div class="col-12 mt-1">
											<p class="small mb-0">회원이 아니신가요? <a href="${pageContext.request.contextPath}/member/addMember">회원가입</a></p>
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