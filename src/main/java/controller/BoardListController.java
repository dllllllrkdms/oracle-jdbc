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
		String memberId = request.getParameter("memberId");
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage")!=null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		// View 페이지 (페이징의 페이징 ? ) 1~10...
		int page = 10;
		int beginPage = (currentPage-1)/page*page+1;
		int endPage = beginPage+page-1;
		String search = "";
		if(request.getParameter("search")!=null) {
			search = request.getParameter("search");
		}
		System.out.println(currentPage+"<--BoardListController currentPage");
		System.out.println(rowPerPage+"<--BoardListController rowPerPage");
		System.out.println(search+"<--BoardListController search");
		
		BoardService boardService = new BoardService();
		ArrayList<Board> list = boardService.getBoardListByPage(memberId, search, currentPage, rowPerPage);
		
		boardService = new BoardService();
		int lastPage = boardService.getBoardListLastPage(memberId, search, rowPerPage);
		if(lastPage<endPage) {
			endPage = lastPage;
		}
		System.out.println(lastPage+"<--BoardListController lastPage");
		
		request.setAttribute("memberId", memberId);
		request.setAttribute("boardList", list);
		request.setAttribute("search", search);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("lastPage", lastPage);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}
}