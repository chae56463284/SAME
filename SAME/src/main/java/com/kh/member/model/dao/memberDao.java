package com.kh.member.model.dao;

import java.io.FileInputStream;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import static com.kh.common.template.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class memberDao {
	
	private Properties prop = new Properties();
	
	public memberDao() {
		String fileName = memberDao.class.getResource("/sql/member/member.xml").getPath();
		
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
		
	
	}

	public Member login(Connection conn, String memberId, String memberPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("login");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = Member.builder().memberNo(rset.getString("MEMBER_NO"))
									.memberId(memberId)
									.memberName(rset.getString("MEMBER_NAME"))
									.phone(rset.getInt("PHONE"))
									.memberSSN(rset.getString("MEMBER_SSN"))
									.email(rset.getString("EMAIL"))
									.isQuit(rset.getString("IS_QUIT"))
									.socialCode(rset.getString("SOCIAL_CODE"))
									.memberType(rset.getString("MEMBERTYPE"))
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

}
