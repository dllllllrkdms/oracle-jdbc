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

@WebServlet("/LoginActionController")
public class LoginActionController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 전에만 진입 가능 -> 세션검사
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
		System.out.println(memberId+"<--/LoginActionController memberId");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		MemberService memberService = new MemberService();
		loginMember = memberService.login(member);
		System.out.println(loginMember+"<--/LoginActionController loginMember");
		String redirectUrl = "/LoginFormController";
		if(loginMember!=null) { // loginMember가 null이면 로그인 실패 
			redirectUrl = "/HomeController";
		}
		session.setAttribute("loginMember", loginMember);

		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}