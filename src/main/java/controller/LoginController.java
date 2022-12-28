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

@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 전에만 진입 가능 -> 세션검사
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
	}
	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 전에만 진입 가능 -> 세션검사
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		// 파라메타값 유효성검사
		if(memberId==null||memberId.equals("")||memberPw==null||memberPw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
	
		System.out.println(memberId+"<--/LoginController memberId"); // 파라메타값 디버깅
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		MemberService memberService = new MemberService();
		loginMember = memberService.login(member);
		System.out.println(loginMember.getMemberId()+"<--/LoginController loginMember.getMemberId()"); // 모델호출 후 디버깅
		String redirectUrl = "/member/login";
		if(loginMember!=null) { // loginMember가 null이면 로그인 실패 
			redirectUrl = "/home";
		}
		session.setAttribute("loginMember", loginMember);

		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}