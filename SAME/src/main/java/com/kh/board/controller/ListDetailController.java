package com.kh.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.dto.BoardDTO;
import com.kh.board.model.service.BoardService;



@WebServlet("/board/detail")
public class ListDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // 게시글 번호 파라미터 처리 - null 체크 추가
            String bnoStr = request.getParameter("bno");
            if(bnoStr == null || bnoStr.trim().isEmpty()) {
                throw new IllegalArgumentException("게시글 번호가 없습니다.");
            }
            int bno = Integer.parseInt(bnoStr);
            
            // 현재 페이지 파라미터 처리
            int cPage = Integer.parseInt(
                request.getParameter("cPage") == null ? "1" : request.getParameter("cPage")
            );
            
            // 게시글 상세 정보 조회
            BoardService boardService = new BoardService();

			// 조회수 증가 (상세 조회 전에 처리)
            int result = boardService.increaseCount(bno);
            
            
             if(result > 0) {
                BoardDTO b = boardService.selectBoard(bno);
                
                if(b != null) {
                    request.setAttribute("b", b);
                    request.setAttribute("cPage", cPage);
                    request.getRequestDispatcher("/views/board/detail.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
                    request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMsg", "게시글 조회수 증가 실패");
                request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
            }
            
        } catch(NumberFormatException e) {
            request.setAttribute("errorMsg", "잘못된 게시글 번호입니다.");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        } catch(Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "게시글 조회 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
