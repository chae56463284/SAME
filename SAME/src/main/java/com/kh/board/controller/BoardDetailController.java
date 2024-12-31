package com.kh.board.controller;

import java.io.IOException;

import com.kh.board.model.dto.BoardDTO;
import com.kh.board.model.service.BoardService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 현재 url로 요청시 전달한 데이터
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		int cPage = Integer.parseInt(request.getParameter("cPage")==null ? "1" : request.getParameter("cPage"));
		

		
		// boardDetail에 필요한 변수들
		// 1. Board 테이블의 데이터
		// 2. Category 테이블의 데이터
		// 3. Attachment 테이블의 데이터
		// 4. Member 테이블의 데이터
		
		BoardDTO b = new BoardService().selectBoard(bno);
		System.out.println(b);
		// 5. cpage --> 목록으로 돌아가기시 필요.
		
		if(b !=null) {
			// 조회성공시 b와 cpage를 request에 담아서 detailjsp로 forward
			request.setAttribute("b", b);
			request.setAttribute("cPage", cPage);
			
			
			// 위 기능 완료 후 ,조회 증가시 조회수가 늘어나는 조회수증가 서비스 시작
			request.getRequestDispatcher("/views/board/boardDetail.jsp").forward(request, response);
		} else {
			// 조회실패시 errorPage 로 forward
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
