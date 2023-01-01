package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		String memberId = loginMember.getMemberId();
		request.setAttribute("memberId", memberId);
		request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response); 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		Member member = new Member(); // request 파라미터값으로 바인딩
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		MemberService memberService = new MemberService();
		int row = memberService.removeMember(member);
		System.out.println(row+"<--RemoveMemberController row");
		String redirectUrl = "/logout";
		if(row!=1) { // 실패 시 
			redirectUrl = "/member/memberOne";
		}
		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}