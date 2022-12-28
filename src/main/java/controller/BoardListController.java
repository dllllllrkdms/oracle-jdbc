package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;

@WebServlet("/board/boardList") // view파일과 호출이름 통일시키기
public class BoardListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage")!=null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		String search = "";
		if(request.getParameter("search")!=null) {
			search = request.getParameter("search");
		}
		
		System.out.println(rowPerPage+"<--BoardListController rowPerPage");
		System.out.println(search+"<--BoardListController search");
		
		BoardService boardService = new BoardService();
		ArrayList<Board> list = boardService.getBoardListByPage(search, currentPage, rowPerPage);
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
		return;
	}
}