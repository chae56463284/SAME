package com.kh.board.model.dao;


import static com.kh.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.kh.board.model.dto.BoardDTO;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.PageInfo;

public class BoardDao {
private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(path));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn, PageInfo pi) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 위치홀더 들어갈 자리
			/*
			 * rownum 값은 boardLimit와 currentPage에 영향을 받음
			 * currentPage boardLimit
			 * 		1			10
			 * 시작값 : (currentPage-1) *boardLimit +1;
			 * 	끝값 : 시작값 + boardLimit -1;
			 * */
			
			int startRow = (pi.getCurrentPage() -1)* pi.getBoardLimit() +1 ;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = Board.builder()
						 	   .boardNo(rset.getInt("BOARD_NO"))
						 	   .memberNo(rset.getString("MEMBER_NAME"))
						 	   .boardTitle(rset.getString("BOARD_TITLE"))
						 	   .createDate(rset.getDate("CREATE_DATE"))
						 	   .count(rset.getInt("COUNT"))
						 	   .build();
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	public List<Board> selectBoardList(Connection conn, PageInfo pi, char boardType) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardListC");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 위치홀더 들어갈 자리
			/*
			 * rownum 값은 boardLimit와 currentPage에 영향을 받음
			 * currentPage boardLimit
			 * 		1			10
			 * 시작값 : (currentPage-1) *boardLimit +1;
			 * 	끝값 : 시작값 + boardLimit -1;
			 * */
			
			int startRow = (pi.getCurrentPage() -1)* pi.getBoardLimit() +1 ;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setString(1, Character.toString(boardType));
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = Board.builder()
						 	   .boardNo(rset.getInt("BOARD_NO"))
						 	   .memberNo(rset.getString("MEMBER_NAME"))
						 	   .boardTitle(rset.getString("BOARD_TITLE"))
						 	   .createDate(rset.getDate("CREATE_DATE"))
						 	   .count(rset.getInt("COUNT"))
						 	   .build();
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	// 전체 게시글 조회
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	
	public int selectListCount(Connection conn, char boardType) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCountC");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,Character.toString(boardType));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}

	public BoardDTO selectBoardList(Connection conn, int bno) {
		BoardDTO b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = BoardDTO.builder()
							.b(Board.builder()
									.boardNo(bno)
									.boardTitle(rset.getString("BOARD_TITLE"))
									.boardContent(rset.getString("BOARD_CONTENT"))
									.memberNo(rset.getString("MEMBER_NO"))
									.createDate(rset.getDate("CREATE_DATE"))
									.category(Category.builder().category(rset.getString("CATEGORY_NAME")).build())
									.build()
									).at(Attachment.builder()
												   .fileNo(rset.getInt("FILE_NO"))
												   .originName(rset.getString("ORIGIN_NAME"))
												   .changedName(rset.getString("CHANGED_NAME"))
												   .filePath(rset.getString("FILE_PATH"))
												   .build()
									).build();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public List<Category> selectCategoryList(Connection conn) {
		
		List<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Category c = Category.builder()
									 .category(rset.getString("CATEGORY"))
									 .boardNo(rset.getString("BOARD_NO"))
									 .build();
				list.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public int insertBoard(Connection conn, Board b) {
		int updateCount = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1); // 일반 게시판
			pstmt.setString(2, b.getCategory().getBoardNo());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			pstmt.setString(5, b.getMemberNo());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		int updateCount = 0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,at.getOriginName());
			pstmt.setString(2,at.getChangedName());
			pstmt.setString(3,at.getFilePath());
			
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int updateBoard(Connection conn, Board b) {
		int updateCount= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getCategory().getCategory());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setInt(4, b.getBoardNo());
			
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		int updateCount= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,at.getOriginName());
			pstmt.setString(2,at.getChangedName());
			pstmt.setInt(3,at.getFileNo());
			
			updateCount = pstmt.executeUpdate();
			
			} catch (SQLException e) {
			e.printStackTrace();
			} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int insertNewAttachment(Connection conn, Attachment at) {
		int updateCount= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,at.getRefNo());
			pstmt.setString(2,at.getOriginName());
			pstmt.setString(3,at.getChangedName());
			pstmt.setString(4,at.getFilePath());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int deleteAttachment(Connection conn, int fileNo) {
		int updateCount= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,fileNo);
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}

	public List<BoardDTO> selectThumbList(Connection conn) {
		List<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectThumbList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
		 rset =	pstmt.executeQuery();
		 
		 while(rset.next()) {
			 BoardDTO bd = BoardDTO.builder()
					 			   .b(Board.builder()
					 						 .boardNo(rset.getInt("BOARD_NO"))
					 						 .boardTitle(rset.getString("BOARD_TITLE"))
					 						 .count(rset.getInt("COUNT"))
					 						 .build())
					 			   .at(Attachment.builder()
					 					   		 .filePath(rset.getString("FILE_PATH"))
					 					   		 .changedName(rset.getString("CHANGED_NAME"))
					 					   		 .build())
					 			   .build();
			 list.add(bd);
		 		}
	
			} catch (SQLException e) {
			e.printStackTrace();
			} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertThumbBoard(Connection conn, Board b) {
		
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard"); // 쿼리문 발생
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, "");
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			pstmt.setInt(5, Integer.parseInt(b.getMemberNo()));
			
			updateCount = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	public int insertAttachmentList(Connection conn, List<Attachment> list) {
		int updateCount = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment"); // 쿼리문 발생
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(Attachment at : list) {
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangedName());
				pstmt.setString(3, at.getFilePath());
				
				updateCount *= pstmt.executeUpdate();
			}
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
		
	}

	public List<Attachment> selectAttachmentList(Connection conn, int bno) {
		
		List<Attachment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachmentList"); // 쿼리문 발생
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = Attachment.builder()
									 	  .fileNo(rset.getInt("FILE_NO"))
									 	  .originName(rset.getString("ORIGIN_NAME"))
									 	  .changedName(rset.getString("CHANGED_NAME"))
									 	  .filePath(rset.getString("FILE_PATH"))
									 	  .build();
				list.add(at);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getCommentContent());
			pstmt.setInt(2, r.getBoardNo());
			pstmt.setInt(3, Integer.parseInt(r.getMemberNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Reply> replyList(Connection conn, int refBno) {
		
		List<Reply>list = new ArrayList<>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("replyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, refBno);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Reply r = Reply.builder()
							   .commentNo(rset.getInt("COMMENT_NO"))
							   .commentContent(rset.getString("COMMENT_CONTENT"))
							   .memberNo(rset.getString("MEMBER_NO"))
							   .createDate(rset.getDate("CREATE_DATE"))
							   .build();
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

}
