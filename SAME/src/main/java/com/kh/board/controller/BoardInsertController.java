package com.kh.board.controller;

import java.io.File;

import java.io.IOException;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.dto.ClassEvaluation;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.rename.FileRenamePolicy;
import com.kh.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/insert")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardInsertController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Category> list = new BoardService().selectCategoryList();
		String[] boardType = {"자유", "리뷰","문의"};

		request.setAttribute("list", list);
		request.setAttribute("boardType", boardType);
		request.getRequestDispatcher("/views/board/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		  HttpSession session = request.getSession();

		    // 1. 로그인 체크
		    Member loginUser = (Member) session.getAttribute("loginUser");
		    if (loginUser == null) {
		        request.setAttribute("errorMsg", "로그인 후 이용 가능한 서비스입니다.");
		        request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		        return;
		    }

		    // 2. multipart 요청 확인
		    if (ServletFileUpload.isMultipartContent(request)) {
		        try {
		            long maxSize = 1024 * 1024 * 10;
		            String filePath = request.getServletContext().getRealPath("/upload/board/");
		            MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8",
		                    new FileRenamePolicy());

		            String categoryType = multiRequest.getParameter("category");
		            String boardTitle = multiRequest.getParameter("title");
		            String boardContent = multiRequest.getParameter("content");
		            String type = multiRequest.getParameter("boardType");
		            char boardType = type.equals("자유")?'a': type.equals("리뷰")?'b':'c';
		            String boardWriter = String.valueOf(loginUser.getMemberNo());

		            // 3. 필수 입력값 검증
		            if (boardTitle == null || boardTitle.trim().isEmpty() || 
		                boardContent == null || boardContent.trim().isEmpty()) {
		                request.setAttribute("errorMsg", "제목과 내용은 필수 입력항목입니다.");
		                request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		                return;
		            }

		            Board b = Board.builder()
		                    .boardTitle(boardTitle)
		                    .boardContent(boardContent)
		                    .memberNo(boardWriter)
		                    .category(Category.builder().categoryType(categoryType).build())
		                    .boardType(boardType)
		                    .build();

		            // 첨부파일 처리
		            Attachment at = null;
		            if (multiRequest.getOriginalFileName("upfile") != null) {
		                at = new Attachment();
		                at.setOriginName(multiRequest.getOriginalFileName("upfile"));
		                at.setChangedName(multiRequest.getFilesystemName("upfile"));
		                at.setFilePath("/upload/board/");
		            }

		            int result;
		            
		            // 리뷰 게시판인 경우 평가 정보도 함께 저장
		            if (type.equals("리뷰")) {
		                String ratingStr = multiRequest.getParameter("rating");
		                if (ratingStr == null || ratingStr.trim().isEmpty()) {
		                    request.setAttribute("errorMsg", "리뷰 평점을 입력해주세요.");
		                    request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		                    return;
		                }
		                
		                int rating = Integer.parseInt(ratingStr);
		                
		                // ClassEvaluation 객체 생성
		                ClassEvaluation eval = ClassEvaluation.builder()
		                        .classCode("REVIEW_" + System.currentTimeMillis()) // 고유한 클래스 코드 생성
		                        .memberNo(boardWriter)
		                        .value(rating)
		                        .build();
		                
		                // 게시글과 평가 정보 함께 저장
		                result = new BoardService().insertBoardAndEvaluation(b, at, eval);
		            } else {
		                // 일반 게시글 저장
		                result = new BoardService().insertBoard(b, at);
		            }

		            if (result > 0) {
		                session.setAttribute("alertMsg", "게시글 등록 성공!");
		                response.sendRedirect(request.getContextPath() + "/board/list");
		            } else {
		                if (at != null) {
		                    new File(filePath + at.getChangedName()).delete();
		                }
		                request.setAttribute("errorMsg", "게시글 작성 실패..");
		                request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("errorMsg", "게시글 등록 중 오류 발생: " + e.getMessage());
		            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		        }
		    } else {
		        request.setAttribute("errorMsg", "잘못된 전송방식입니다. enctype을 변경해주세요.");
		        request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		    }
	}
	
}