package com.kh.board.model.dao;

import java.sql.Connection;
import static com.kh.common.template.JDBCTemplate.close;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.board.model.dto.ClassEvaluation;

public class ClassEvaluationDao {

	public int insertEvaluation(Connection conn, ClassEvaluation eval) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CLASS (CLASS_CODE, MEMBER_NO, VALUE, BOARD_NO) " + "VALUES (?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eval.getClassCode());
			pstmt.setString(2, eval.getMemberNo());
			pstmt.setInt(3, eval.getValue());
			pstmt.setInt(4, eval.getBoardNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}