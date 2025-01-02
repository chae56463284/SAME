package com.kh.member.model.dao;

import java.io.FileInputStream;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		} finally {
			close(pstmt);
		}

		return updatecount;

	}

	public Member login(Connection conn, String memberId, String memberPwd) {
	    Member m = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("login");

	    try {
	        // Prepare SQL query
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memberId);
	        pstmt.setString(2, memberPwd);

	        // Execute query
	        rset = pstmt.executeQuery();

	        // Check if a result exists
	        if (rset.next()) {
	            m = Member.builder()
	                    .memberNo(rset.getString("MEMBER_NO"))
	                    .memberId(rset.getString("MEMBER_ID"))
	                    .memberName(rset.getString("MEMBER_NAME"))
	                    .phone(rset.getInt("PHONE"))
	                    .memberSSN(rset.getString("MEMBER_SSN"))
	                    .email(rset.getString("EMAIL"))
	                    .isQuit(rset.getString("IS_QUIT"))
	                    .socialCode(rset.getString("SOCIAL_CODE"))
	                    .memberType(rset.getString("MEMBER_TYPE"))
	                    .build();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	close(rset);
	    	close(pstmt);
	    }
	    return m;
	}


	public Member forgotId(Connection conn, String memberName, String email, String memberType) {
	    Member m = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("forgotId");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memberName);
	        pstmt.setString(2, email);
	        pstmt.setString(3, memberType);
	        
	        rset = pstmt.executeQuery();
	        
	        if (rset.next()) {
	            m = Member.builder()
	                    .memberNo(rset.getString("MEMBER_NO"))
	                    .memberId(rset.getString("MEMBER_ID"))
	                    .memberName(rset.getString("MEMBER_NAME"))
	                    .phone(rset.getInt("PHONE"))
	                    .memberSSN(rset.getString("MEMBER_SSN"))
	                    .email(rset.getString("EMAIL"))
	                    .isQuit(rset.getString("IS_QUIT"))
	                    .socialCode(rset.getString("SOCIAL_CODE"))
	                    .memberType(rset.getString("MEMBER_TYPE"))
	                    .build();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return m;
	}
	
	public Member forgotPass(Connection conn, String memberId, String memberName, String email) {
	    Member m = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    String sql = prop.getProperty("forgotPass");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memberId);
	        pstmt.setString(2, memberName);
	        pstmt.setString(3, email);

	        rset = pstmt.executeQuery();
	        if (rset.next()) {
	            m = new Member();
	            m.setMemberId(rset.getString("MEMBER_ID"));
	            m.setMemberName(rset.getString("MEMBER_NAME"));
	            m.setEmail(rset.getString("EMAIL"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return m;
	}

	public boolean updatePassword(Connection conn, String memberId, String newPassword) {
	    PreparedStatement pstmt = null;
	    boolean Updated = false;

	    String sql = prop.getProperty("updatePassword");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, newPassword);
	        pstmt.setString(2, memberId);
	        
	        Updated = pstmt.executeUpdate() > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    return Updated;
	}

}

