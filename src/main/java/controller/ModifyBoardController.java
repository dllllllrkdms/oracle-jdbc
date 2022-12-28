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

@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	// board 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후 글 수정 가능 
		HttpSession session = request.getSession(); // 세션 값 가져오기
		Member loginMember = (Member)session.getAttribute("loginMember"); // Object -> Member 형변환
		if(loginMember==null) {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		BoardService boardService = new BoardService();
		Board board = boardService.getBoardOne(boardNo);
		request.setAttribute("b", board);
		
		// !!!!!!!!!!!!!!!!!!!!!! 작성자와 세션 로그인 값이 같아야함 !!!!!!!!!!!!!!!!!!!
		request.getRequestDispatcher("/WEB-INF/view/board/modifyBoard.jsp").forward(request, response);
		return;
	}
	// board 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		String boardNoStr = request.getParameter("boardNo");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String memberId = request.getParameter("memberId");
		
		// 파라메타값 유효성검사 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		int boardNo = Integer.parseInt(boardNoStr);
		Board board = new Board(boardNo, boardTitle, boardContent, memberId, null, null); // request 파라미터값으로 바인딩
		BoardService boardService = new BoardService();
		int row = boardService.modifyBoard(board);
		System.out.println(row+"<--ModifyBoardController row");
		String redirectUrl = "/board/modifyBoard";
		if(row==1) { // 수정성공시
			redirectUrl = "/board/boardOne?boardNo="+boardNo; // 수정된 글 상세보기페이지로 이동
		}
		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}