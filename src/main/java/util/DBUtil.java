package util;
import java.sql.*;
public class DBUtil {
	public static Connection getConnection() throws Exception { // 메서드를 호출하는 곳(서비스)에서 예외 처리
		Connection conn = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "gdj58";
		String pw = "java1234";
		Class.forName(driver); // 외부 드라이브(오라클) 로딩
		conn = DriverManager.getConnection(url, user, pw);
		conn.setAutoCommit(false); // auto commit 해제
		return conn;
	}
}