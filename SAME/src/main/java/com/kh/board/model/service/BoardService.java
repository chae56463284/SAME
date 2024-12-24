package com.kh.board.model.service;

import static com.kh.common.template.JDBCTemplate.close;
import static com.kh.common.template.JDBCTemplate.commit;
import static com.kh.common.template.JDBCTemplate.getConnection;
import static com.kh.common.template.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.List;
import java.util.Locale.Category;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.PageInfo;
public class BoardService {
private BoardDao dao= new BoardDao();
	
	public List<Board> selectBoardList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		List<Board> list = dao.selectBoardList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int selectListCount(int boardType) {
		
		Connection conn = getConnection();
		
		int listCount = dao.selectListCount(conn, boardType);
		
		close(conn);
		
		return listCount;
		
		
	}

	public BoardDTO selectBoard(int bno) {
	
		Connection conn = getConnection();
		
		BoardDTO  b  = dao.selectBoardList(conn, bno);
		
		close(conn);
		
		return b;
	}

	public List<Category> selectCategoryList() {
		Connection conn = getConnection();
		List<Category> list =dao.selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		
		// Board 테이블에 우선적으로 데이터 추가
		int result = dao.insertBoard(conn,b);
		
		
		if(result>0 && at != null) {
				result = dao.insertAttachment(conn,at);
		} 
		// 2개 혹은 1개의 dml 이 모두 성공했을 시 commit, 하나라도 실패하면 rollback
		if(result>0) {
			
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateBoard(Board b, Attachment at, int isDelete, String serverFolderPath) {
		Connection conn = getConnection();
		
		// Board 업데이트
		int result = new BoardDao().updateBoard(conn,b);
		
		if(result>0) {
			
			// 이미 등록했던 파일이 있고, 이를 변경하고자 새롭게 파일을 업로드한 경우
			// 파일삭제
			Attachment deleteAttachment = new BoardDao().selectBoardList(conn, b.getBoardNo())
					.getAt();
			// 파일의 저장경로 + 파일의 수정명
			String changeName = deleteAttachment.getChangeName();
			if(at.getFileNo() !=0 && at.getOriginName() !=null) {
				
				// 1. at 수정
				new File(serverFolderPath+changeName) .delete();
				// C:/
				
				result = new BoardDao().updateAttachment(conn, at);
				
			} else if(at.getFileNo() == 0 && at.getOriginName() !=null){
				// 등록했던 파일이 없고, 이번에 새롭게 추가하고자 파일을 업로드한 경우
				
				// 2. at 추가
				result = new BoardDao().insertNewAttachment(conn,at);
			} else if(isDelete ==1 && at.getOriginName()== null){
				new File(serverFolderPath+changeName) .delete();
				// 기존 파일을 그대로 유지하고 싶은 경우
				
				// 3. at 삭제
				result = new BoardDao().deleteAttachment(conn,at.getFileNo());
			}
			
			// 4. 아무것도 안하기
		}
			
			if(result>0) {
				
				commit(conn);
			} else {
				rollback(conn);
			}
		
		close(conn);
		
		return result;
	}

	public List<BoardDTO> selectThumbList() {
		Connection conn = getConnection();
		
		List<BoardDTO> list = dao.selectThumbList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertThumbBoard(Board b, List<Attachment> list) {

		Connection conn = getConnection();
		
		int result = dao.insertThumbBoard(conn,b);
		
		if(result>0) {
			result = dao.insertAttachmentList(conn,list);
		}
				
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public List<Attachment> selectAttachmentList(int bno) {
		
		Connection conn = getConnection();
		
		List<Attachment>list = dao.selectAttachmentList(conn, bno);
		
		close(conn);
		
		return list;
	}

	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = dao.insertReply(conn, r);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public List<Reply> selectReplyList(int refBno) {
		
		Connection conn = getConnection();
		

		List<Reply>list = dao.replyList(conn, refBno);
		
		close(conn);
		
		return list;
		
	}
}
