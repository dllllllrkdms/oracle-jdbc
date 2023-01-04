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

<title>addBoard</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#boardTitle').val().length==0){
				alert('제목을 입력해주세요.');
				$('#boardTitle').focus();
				return;
			}
			if($('#boardContent').val().length==0){
				alert('내용을 입력해주세요.');
				$('#boardContent').focus();
				return;
			}
			$('#addBoardForm').submit();
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
					<div class="card-body px-lg-5">
					
						<form action="${pageContext.request.contextPath}/board/addBoard" method="post" id="addBoardForm">
							<div class="pt-lg-5 pb-2 pb-2">
								<input placeholder="제목" class="form-control" type="text" name="boardTitle" id="boardTitle">
							</div>
							<div class="pt-2 pb-2">
								<textarea placeholder="내용" class="form-control" cols="50" rows="5" name="boardContent" id="boardContent"></textarea>
							</div>
							<div class="text-center mt-3">
								<button type="button" class="btn btn-primary" id="submitBtn">등록</button>
							</div>
						</form>
						
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