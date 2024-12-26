package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.member.model.vo.Member;
import static com.kh.common.template.JDBCTemplate.*;

public class memberDao {

	private Properties prop = new Properties();
	
	public memberDao() {
		
		String fileName = memberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insert(Connection conn, Member m) {
		int updatecount = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insert");
		
			try {
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setString(1, m.getMemberType()); // 'A' 또는 기타 값 전달
				pstmt.setString(2, m.getMemberId());
				pstmt.setString(3, m.getMemberPwd());
				pstmt.setString(4, m.getMemberName());
				pstmt.setInt(5, m.getPhone());
				pstmt.setString(6, m.getMemberSSN());
				pstmt.setString(7, m.getEmail());
				pstmt.setString(8, m.getAddress());
				pstmt.setString(9, m.getMemberType());
				

				
				updatecount = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return updatecount;
	
	}

}
