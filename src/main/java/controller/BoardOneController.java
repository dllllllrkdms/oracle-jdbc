package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;

@WebServlet("/board/boardOne")
public class BoardOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("boardNo")==null) { // 파라메타 값 유효성 검사
			response.sendRedirect(request.getContextPath()+"/board/boardList");
			return;
		}
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println(boardNo+"<--BoardOneController boardNo");
		BoardService boardService = new BoardService();
		Board board = boardService.getBoardOne(boardNo);
		
		request.setAttribute("b", board); // view페이지와 공유할 모델데이터(board) 저장
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response);
	}
}