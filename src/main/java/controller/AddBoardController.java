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

@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	// add board Form 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 게시글 작성가능
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/board/addBoard.jsp").forward(request, response); 
	}
	// add board action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = loginMember.getMemberId();
	
		Board board = new Board(0,boardTitle,boardContent,memberId,null,null); // request 파라미터값으로 바인딩
		BoardService boardService = new BoardService();
		int row = boardService.createBoard(board);
		System.out.println(row+"<--AddBoardController row");
		String redirectUrl = "/board/addBoard";
		if(row==1) {
			redirectUrl = "/board/boardList"; // BoardOneController로 가는 법 찾아보기 !!!!!!!!!!!
		}
		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}