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

@WebServlet("/member/memberOne")
public class MemberOneController extends HttpServlet {
	// member/memberOne 
	// 1. 회원정보 수정
	// 2. 회원 탈퇴
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성 검사 
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		String memberId = loginMember.getMemberId();
		MemberService memberService = new MemberService();
		Member member = memberService.memberOne(memberId);
		
		request.setAttribute("m", member); // view페이지와 공유할 모델데이터 세팅
		request.getRequestDispatcher("/WEB-INF/view/member/memberOne.jsp").forward(request, response);
	}
}