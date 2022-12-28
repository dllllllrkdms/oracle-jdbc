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

@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	// member 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 진입 가능
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		String memberId = loginMember.getMemberId();
		MemberService memberService = new MemberService();
		Member member = memberService.memberOne(memberId);
		request.setAttribute("m", member); // view페이지와 공유할 모델데이터 저장
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}
	// member 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 진입 가능
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8"); // 인코딩
		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		Member member = new Member();
		member.setMemberName(memberName);
		member.setMemberId(memberId);
		MemberService memberService = new MemberService();
		int row = memberService.modifyMember(member);
		System.out.println(row+"<--/ModifyMemberController row");
		String redirectUrl = "/member/modifyMember";
		if(row==1) { // 수정 성공
			redirectUrl = "/member/memberOne";
		}
		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}