package com.kh.board.controller;

import java.io.IOException;
import java.util.List;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/board/insert")
public class ListInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ListInsertController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Category> list = new BoardService().selectCategoryList();
		request.setAttribute("list", list);
	
		request.getRequestDispatcher("/views/board/boardInsert.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
