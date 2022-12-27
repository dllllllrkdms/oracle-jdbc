<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardOne</title>
</head>
<body>
	<h1> 게시판 </h1>
	<div>
		<div>
			no : ${b.boardNo}		
		</div>
		<div>
			제목 : ${b.boardTitle}
		</div>
		<div>
			내용	: ${b.boardContent}
		</div>
		<div>
			작성자 : ${b.memberId}
		</div>
		<div>
			${b.createdate}
		</div>
	</div>
</body>
</html>