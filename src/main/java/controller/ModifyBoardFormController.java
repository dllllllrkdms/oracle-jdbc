package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/ModifyBoardFormController")
public class ModifyBoardFormController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 글 수정 가능 
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/LoginFormController");
			return;
		}
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		BoardService boardService = new BoardService();
		Board board = boardService.getBoardOne(boardNo);
		request.setAttribute("b", board);
		response.sendRedirect(request.getContextPath()+"/BoardListController");
		
		// !!!!!!!!!!!!!!!!!!!!!! 작성자와 세션 로그인 값이 같아야함 !!!!!!!!!!!!!!!!!!!
		request.getRequestDispatcher("/WEB-INF/view/modifyBoardForm.jsp").forward(request, response);
	}
}