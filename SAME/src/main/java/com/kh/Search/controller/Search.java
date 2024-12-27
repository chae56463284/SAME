package com.kh.Search.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.Search.model.dao.DatabaseHelper;
import com.kh.board.model.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
        List<Board> filteredPosts = new ArrayList<>();

        // 데이터베이스 연결 및 게시글 필터링
        try (Connection conn = DatabaseHelper.getConnection()) {
            String sql = "SELECT * FROM BOARD WHERE IS_DELETE = 'N' AND (BOARD_TITLE LIKE ? OR BOARD_CONTENT LIKE ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                String searchKeyword = "%" + keyword + "%";
                pstmt.setString(1, searchKeyword);
                pstmt.setString(2, searchKeyword);

                try (ResultSet rset = pstmt.executeQuery()) {
                    while (rset.next()) {
                        Board post = new Board();
                        post.setBoardNo(rset.getInt("board_no"));
                        post.setBoardTitle(rset.getString("board_title"));
                        post.setBoardContent(rset.getString("board_content"));
                        post.setCreateDate(rset.getTimestamp("create_date"));
                        filteredPosts.add(post);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 검색 결과를 요청 속성에 저장하고 결과 페이지로 포워딩
        request.setAttribute("filteredPosts", filteredPosts);
        request.getRequestDispatcher("/views/searchResults.jsp").forward(request, response);
    }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
