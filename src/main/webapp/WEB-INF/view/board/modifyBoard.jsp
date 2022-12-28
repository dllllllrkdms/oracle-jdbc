<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>modifyBoard</title>
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
			$('#modifyBoardForm').submit();
		});
	});
</script>
</head>
<body>
	<h1> 게시판 글쓰기 </h1>
	<form action="${pageContext.request.contextPath}/board/modifyBoard" method="post" id="modifyBoardForm">
		<input type="hidden" name="boardNo" value="${b.boardNo}">
		<div>
			제목 : 
			<input type="text" name="boardTitle" value="${b.boardTitle}" id="boardTitle">
		</div>
		<div>
			내용 : 
			<textarea cols="50" rows="5" name="boardContent" id="boardContent">${b.boardContent}</textarea>
		</div>
		<div>
			작성자 : <!-- 수정 불가 -->
			<input type="text" name="memberId" value="${b.memberId}" readonly="readonly">
		</div>
		<div>
			${b.createdate}
		</div>
		<div><button type="button" id="submitBtn">제출</button></div>
	</form>
</body>
</html>