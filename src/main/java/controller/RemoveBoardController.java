package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Member;

@WebServlet("/RemoveBoardController")
public class RemoveBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 글 삭제 가능
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/LoginFormController");
			return;
		}
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		BoardService boardService = new BoardService();
		int row = boardService.removeBoard(boardNo);
		System.out.println(row+"<--/RemoveBoardController row");
		response.sendRedirect(request.getContextPath()+"/BoardListController");
	}
}