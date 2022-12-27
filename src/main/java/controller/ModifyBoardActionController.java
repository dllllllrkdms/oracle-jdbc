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


@WebServlet("/ModifyBoardActionController")
public class ModifyBoardActionController extends HttpServlet {
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
		System.out.println(row+"<--ModifyBoardActionController row");
		String redirectUrl = "/ModifyBoardFormController";
		if(row==1) { // 수정성공시
			redirectUrl = "/BoardOneController?boardNo="+boardNo; // 수정된 글 상세보기페이지로 이동
		}
		response.sendRedirect(request.getContextPath()+redirectUrl);
	}
}