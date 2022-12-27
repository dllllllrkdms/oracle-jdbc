<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 jdbc 테스트</title>
</head>
<body>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	int beginRow = (currentPage-1)*rowPerPage+1;
	int endRow = currentPage*rowPerPage;
	Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 드라이버 로딩 
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","gdj58","java1234");
	System.out.println("오라클 접속 성공");
	String sql = "SELECT * FROM board where board_no between ? and ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, endRow);
	ResultSet rs = stmt.executeQuery();
%>
	<h1> board list </h1>
	<table border=1>
	<%
		while(rs.next()){
	%>
			<tr>
				<td><%=rs.getString("board_title")%></td>
				<td><%=rs.getString("board_content")%></td>
				<td><%=rs.getString("member_id")%></td>
			</tr>
	<%
		}
	%>
	</table>
	<a href="<%=request.getContextPath()%>/jdbcTest.jsp?currentPage=<%=currentPage-1%>">이전으로</a>
	<a href="<%=request.getContextPath()%>/jdbcTest.jsp?currentPage=<%=currentPage+1%>">다음으로</a>
</body>
</html>