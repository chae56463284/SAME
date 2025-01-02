package com.kh.manager.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

@WebServlet("/manager/listc")
public class MListCController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MListCController() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; // 게시글 총 개수
		int currentPage; // 요청한 페이지
		int pageLimit; // 페이징바에 표시할 최대 갯수
		int boardLimit; // 한 페이지당 보져일 게시글의 최대 갯수.
		
		int startPage; // 페이징바의 시작 수 
		int endPage; // 페이징바의 끝 수
		int maxPage; // 가장 마지막 페이지
		// * listCount : 예상결과값 100
		listCount = new BoardService().selectListCount('c');// 1: 일반게시글
		
		currentPage = request.getParameter("cpage") == null ? 1 : Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10; 
		boardLimit = 10;
		
		maxPage =  (int) Math.ceil(listCount / (double) boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, startPage, endPage, maxPage);
		
		// 1. 현재 사용자가 요청한 페이지에 맞는 "게시글 목록" 데이터 조회하기
		List<Board> list = new BoardService().selectBoardList(pi,'c');
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
	
		// 2. 게시글 목록 데이터를 request에 저장한 후 목록 페이지로 forward
		request.getRequestDispatcher("/views/manager/boardCList.jsp").forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}