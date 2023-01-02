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

<title>removeMember</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#check:checked').length==0){
				alert('탈퇴안내를 확인하세요.');
				return;
			}
			if($('#memberPw').val().length==0){
				alert('비밀번호를 입력해주세요.');
				$('#memberPw').focus();
				return;
			}
			$('#removeMemberForm').submit();
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
				<h1>회원 탈퇴</h1>
			</div>
			<div class="mt-3">
				<div class="alert alert-warning alert-dismissible" role="alert">
					<h4 class="alert-heading">탈퇴 안내</h4>
						<p>자식테이블 값이 없어야 부모테이블 삭제가능 --> board게시글이 없어야 회원 탈퇴가능</p>
					<form action="${pageContext.request.contextPath}/member/removeMember" id="removeMemberForm" method="post">
						<input type="hidden" name="memberId" value="${memberId}">
						<hr>
							<input type="checkbox" id="check">
							<label for="check">안내사항을 확인하였습니다.</label>
							<div class="row mb-3">
								<label for="memberPw" class="col-md-4 col-lg-3 col-form-label">비밀번호 확인</label>
								<div class="col-md-8 col-lg-9">
									<input type="password" class="form-control" id="memberPw" name="memberPw">
								</div>
							</div>
							<div class="text-center">
								<button type="button" class="btn btn-primary" id="submitBtn">확인</button>
							</div>
					</form>
				</div>
			</div>
		</section>
	</main>
</body>
</html>