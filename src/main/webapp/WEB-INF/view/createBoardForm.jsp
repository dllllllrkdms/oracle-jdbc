<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createBoardForm</title>
</head>
<body>
	<h1>게시판 글쓰기</h1>
	<form action="${pageContext.request.contextPath}/CreateBoardActionController" method="post">
		<div>
			제목 : 
			<input type="text" name="boardTitle">
		</div>
		<div>
			내용 : 
			<textarea cols="50" rows="5" name="boardContent"></textarea>
		</div>
		<div><button type="submit">제출</button></div>
	</form>
</body>
</html>