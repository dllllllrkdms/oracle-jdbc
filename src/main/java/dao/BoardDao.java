package dao;
import java.sql.*;
import java.util.ArrayList;

import oracle.jdbc.proxy.annotation.Pre;
import vo.Board;
public class BoardDao { // 서비스에서 예외처리를 하기 위해 dao에서는 throws
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception { // boardList 출력
		// !!!!!!!!!!!!!!!!!!!!검색기능 추가하기!!!!!!!!!!!!!!!!!!!!!
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT board_no boardNo, board_title boardTitle, createdate FROM (SELECT rownum rnum, board_no, board_title, createdate FROM (SELECT board_no, board_title, createdate FROM board ORDER BY board_no DESC) t) t2 WHERE rnum BETWEEN ? AND ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		rs.close();
		stmt.close();
		return list;
	}
	public Board selectBoardOne(Connection conn, int boardNo) throws SQLException { // board 상세보기
		Board board = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT board_title boardTitle, board_content boardContent, member_id memberId, updatedate, createdate FROM board WHERE board_no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		rs = stmt.executeQuery();
		if(rs.next()) {
			board = new Board(boardNo, rs.getString("boardTitle"), rs.getString("boardContent"), rs.getString("memberId"), rs.getString("updatedate"), rs.getString("createdate"));
		}
		rs.close();
		stmt.close();
		return board;
	}
	public int insertBoard(Connection conn, Board board) throws SQLException { // board 추가
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO board (board_no, board_title, board_content, member_id, updatedate, createdate) VALUES (board_seq.nextval,?,?,?,sysdate,sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	public int updateBoard(Connection conn, Board board) throws SQLException {
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "UPDATE board SET(board_title=?, board_content=?, updatedate=sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	public int deleteBoard(Connection conn, int boardNo) throws SQLException { // board 삭제
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM board WHERE board_no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
}