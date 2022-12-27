<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyBoardForm</title>
</head>
<body>
	<h1> 게시판 글쓰기 </h1>
	<form action="${pageContext.request.contextPath}/ModifyBoardActionController" method="post">
		<input type="hidden" name="boardNo" value="${b.boardNo}">
		<div>
			제목 : 
			<input type="text" name="boardTitle" value="${b.boardTitle}">
		</div>
		<div>
			내용 : 
			<textarea cols="50" rows="5" name="boardContent">${b.boardContent}</textarea>
		</div>
		<div>
			작성자 : <!-- 수정 불가 -->
			<input type="text" name="memberId" value="${b.memberId}" readonly="readonly">
		</div>
		<div>
			${b.createdate}
		</div>
		<div><button type="submit">제출</button></div>
	</form>
</body>
</html>