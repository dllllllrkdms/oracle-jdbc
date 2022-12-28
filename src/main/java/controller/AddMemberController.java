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

/**
 * Servlet implementation class AddMemberController
 */
@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet {
	// 동일한 주소를 요청하더라도 get방식과 post방식으로 분기시킴
	// 회원 가입 폼 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션검사
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
	}
	// 회원 가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("아아");
		// 로그인 세션검사
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember!=null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		// !!!!!!!!!!!!!!!!! 파라메타값 유효성 검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!
		request.setCharacterEncoding("UTF-8"); // 인코딩
		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		System.out.println(memberId+"<--/AddMemberController memberId");
		
		Member member = new Member(memberId, memberPw, memberName, null, null);
		MemberService memberService = new MemberService();
		int row = memberService.addMember(member);
		System.out.println(row+"<--AddMemberController row");
		response.sendRedirect(request.getContextPath()+"/member/login");
	}
}