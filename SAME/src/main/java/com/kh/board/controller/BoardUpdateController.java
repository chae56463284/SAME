package com.kh.board.controller;

import java.io.IOException;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.rename.FileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class boardUpdateController
 */
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize =1024*1024*10; // 10mbyte
			String filePath = request.getServletContext().getRealPath("/upload/board/");
			
			MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, "UTF-8", new FileRenamePolicy());
			
			// 데이터베이스에 저장을 위한 변수 추출
			
			// 1) Board에 추가할 데이터
			String categoryName =multi.getParameter("category");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			int boardNo = Integer.parseInt(multi.getParameter("bno"));
			
			// 2) Attachment에 추가/수정할 데이터
			int fileNo = Integer.parseInt(multi.getParameter("fileNo"));
			int isDelete = Integer.parseInt(multi.getParameter("isDelete"));
			
			Board b = Board.builder()
						   .boardTitle(title)
						   .boardContent(content)
						   .boardNo(boardNo)
						   .category(Category.builder().categoryName(categoryName).build())
						   .build();
			
			
			Attachment at = null;
			if(fileNo !=0) { // 등록했던 첨부파일이 있는 경우
				at = new Attachment();
				at.setFileNo(fileNo);
				if(multi.getOriginalFileName("upfile")!= null) {
					at.setOriginName(multi.getOriginalFileName("upfile"));
					at.setChangedName(multi.getFilesystemName("upfile"));
					
				}
				
			} else { // 이전에 첨부파일을 등록했던 적이 없는 경우
				at = new Attachment();
				if(multi.getOriginalFileName("upfile")!= null) {
					at.setRefNo(boardNo);
					at.setOriginName(multi.getOriginalFileName("upfile"));
					at.setChangedName(multi.getFilesystemName("upfile"));
					at.setFilePath("/upload/board/");
				}else { // 기존 파일을 그대로 유지하고 싶은 경우
					// 처리할 로직 없음
				}
			}
			
			// 서비스 메서드 호출
			int result = new BoardService().updateBoard(b,at, isDelete, filePath);
			
			HttpSession session = request.getSession();
			
			// 서비스 메서드의 반환값에 따른 작업처리
			if(result>0) { // 수정성공
				session.setAttribute("alertMsg", "게시글 수정 성공!");
				response.sendRedirect(request.getContextPath()+"/board/detail?bno="+boardNo);
				
			} else { // 수정실패
				session.setAttribute("alertMsg", "게시글 수정 실패");
				response.sendRedirect(request.getContextPath()+"/board/update?bno="+boardNo);
			}
			
			// 파일 삭제시 고려할 부분
			// 1. attachment테이블에서 update가 발생하는 경우 (수정, 글삭제)
			
			
			
		} else {
			request.setAttribute("errorMsg", "잘못된 enctype입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}
	

}
