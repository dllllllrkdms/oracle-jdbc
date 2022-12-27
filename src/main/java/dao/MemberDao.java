package dao;

import java.sql.*;

import vo.Member;

public class MemberDao {
	public Member selectMemberByIdAndPw(Connection conn, Member paramMember) throws SQLException { // 로그인
		Member returnMember = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_id memberId, member_name memberName FROM member WHERE member_id=? AND member_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		rs = stmt.executeQuery();
		if(rs.next()) {
			returnMember = new Member();
			returnMember.setMemberId(rs.getString("memberId"));
			returnMember.setMemberName(rs.getString("memberName"));
		}
		return returnMember;
	}
}