<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	System.out.println(currentPage+"<--currentPage");
	System.out.println(beginRow+"<--beginRow");
	System.out.println(endRow+"<--endRow");
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 드라이버 로딩 
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","gdj58","java1234");
	System.out.println("오라클 접속 성공");
	/*
		sql = SELECT t2.rnum, t2.id, t2.name 
				FROM (SELECT rownum rnum, t.id, t.name
						FROM (SELECT member_id id, member_name name
								FROM member ORDER BY member_name ASC) t) t2
			   WHERE rnum between ? and ? 
	*/
	String sql = "SELECT t2.rnum, t2.id, t2.name FROM (SELECT rownum rnum, t.id, t.name FROM (SELECT member_id id, member_name name FROM member ORDER BY member_name ASC) t) t2 WHERE rnum between ? and ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, endRow);
	ResultSet rs = stmt.executeQuery();
%>
	<h1> 회원 목록 </h1>
	<table border=1>
	<%
		while(rs.next()){
	%>
			<tr>
				<td><%=rs.getString("rnum")%></td>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("name")%></td>
			</tr>
	<%
		}
		rs.close();
		stmt.close();
		conn.close();
	%>
	</table>
	<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage-1%>">이전으로</a>
	<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1%>">다음으로</a>
</body>
</html>