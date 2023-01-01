package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	public Member login(Member paramMember) { // 로그인
		Member returnMember = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			returnMember = memberDao.selectMemberByIdAndPw(conn, paramMember);
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
		return returnMember;
	}
	public Member memberOne(String memberId) { // 회원정보 상세보기
		Member member = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			member = memberDao.selectMemberOne(conn, memberId);
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
		return member;
	}
	public boolean checkIdDuplication(String memberId) { // 아이디 중복확인
		boolean idDup = false; 
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			idDup = memberDao.selectId(conn, memberId);
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
		return idDup;
	}
	public int addMember(Member member) { // 회원가입
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.insertMember(conn, member);
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
	public int modifyMember(Member member) { // 회원정보 수정
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.updateMember(conn, member);
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
	public int modifyMemberPw(Member member) { // 비밀번호 변경
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.updateMemberPw(conn, member);
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
	public int removeMember(Member member) { // 회원탈퇴
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.deleteMember(conn, member);
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