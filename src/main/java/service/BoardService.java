package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
	private BoardDao boardDao;
	public ArrayList<Board> getBoardListByPage(String search, int currentPage, int rowPerPage) { // 로직은 model에 작성
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			System.out.println(search);
			// 페이징
			int beginRow = (currentPage-1)*rowPerPage + 1;
			int endRow = currentPage*rowPerPage;
			conn = DBUtil.getConnection(); // db연결
			this.boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, search, beginRow, endRow); 
			conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false) 설정
		} catch (Exception e) {
			try {
				conn.rollback(); // 예외 발생 시 rollback
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close(); // db자원 반납
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public int getBoardListLastPage(String search, int rowPerPage) { // 마지막 페이지 구하기 
		int lastPage = 0;
		Connection conn = null;
		try {
			System.out.println(search);
			// 페이징
			conn = DBUtil.getConnection(); // db연결
			this.boardDao = new BoardDao();
			int count = boardDao.selectBoardCount(conn, search);
			System.out.println(count);
			lastPage = count/rowPerPage;
			if(count%rowPerPage!=0) {
				lastPage+=1;
			}
			conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false) 설정
		} catch (Exception e) {
			try {
				conn.rollback(); // 예외 발생 시 rollback
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close(); // db자원 반납
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lastPage;
	}
	public Board getBoardOne(int boardNo) { // boardOne 상세보기
		Board board = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.boardDao = new BoardDao();
			board = boardDao.selectBoardOne(conn, boardNo); // model 
			conn.commit(); 
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	public int createBoard(Board board) { // board 추가
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.boardDao = new BoardDao();
			row = boardDao.insertBoard(conn, board);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	public int modifyBoard(Board board) { // board 수정
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.boardDao = new BoardDao();
			row = boardDao.updateBoard(conn, board);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	public int removeBoard(int boardNo) { // board 삭제
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.boardDao = new BoardDao();
			row = boardDao.deleteBoard(conn, boardNo);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}