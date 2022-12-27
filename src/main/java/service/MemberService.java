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
}