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
		rs.close();
		stmt.close();
		return returnMember;
	}
	public Member selectMemberOne(Connection conn, String memberId) throws SQLException { // 회원정보보기
		Member member = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_id memberId, member_name memberName, createdate FROM member WHERE member_id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		rs = stmt.executeQuery();
		if(rs.next()) {
			member = new Member(memberId, null, rs.getString("memberName"),null,rs.getString("createdate")); 
		}
		rs.close();
		stmt.close();
		return member;
	}
	public int insertMember(Connection conn, Member member) throws SQLException { // 회원가입
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO member(member_id, member_pw, member_name, updatedate, createdate) VALUES (?,?,?,sysdate,sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	public boolean selectId(Connection conn, String memberId) throws SQLException { // 아이디 중복확인
		boolean result = true;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_id memberId FROM member WHERE member_id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		rs = stmt.executeQuery();
		if(rs.next()) { // 중복시에 false 반환
			result = false;
		}
		rs.close();
		stmt.close();
		return result;
	}
	public int updateMember(Connection conn, Member member) throws SQLException { // 회원정보 수정
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "UPDATE member SET member_name=? WHERE member_id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberName());
		stmt.setString(2, member.getMemberId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	public int updateMemberPw(Connection conn, Member member) throws SQLException { // 비밀번호 변경
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "UPDATE member SET member_pw=? WHERE member_id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberPw());
		stmt.setString(2, member.getMemberId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	public int deleteMember(Connection conn, Member member) throws SQLException { // 회원탈퇴
		int row = 0;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM member WHERE member_id=? AND member_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
}