<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>modifyMember</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#memberName').val().length==0){
				alert('이름을 입력해주세요.');
				$('#memberName').focus();
				return;
			}
			$('#addMemberForm').submit();
		});
	});
</script>
</head>
<body>
	<h1> 회원 정보 수정 </h1>
	<form action="${pageContext.request.contextPath}/member/modifyMember" method="post" id="modifyMemberForm">
		<div>
			이름 : <input type="text" name="memberName" value="${m.memberName}">
		</div>
		<div>
			아이디 : <input type="text" name="memberId" value="${m.memberId}" readonly="readonly">
		</div>
		<div><button type="button" id="submitBtn">수정</button></div>
	</form>
</body>
</html>