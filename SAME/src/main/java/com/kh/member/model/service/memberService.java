package com.kh.member.model.service;

import java.sql.Connection;

import com.kh.member.model.dao.memberDao;
import com.kh.member.model.vo.Member;
import static com.kh.common.template.JDBCTemplate.*;

public class memberService {

	memberDao dao = new memberDao();

	public int insert(Member m) {
		Connection conn = getConnection();

		int result = dao.insert(conn, m);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Member login(String memberId, String memberPwd) {
		Connection conn = getConnection();

		Member m = dao.login(conn, memberId, memberPwd);

		close(conn);

		return m;

	}

	public Member forgotId(String memberName, String email, String memberType) {
		Connection conn = getConnection();
		
		Member m = dao.forgotId(conn, memberName, email, memberType);
		
		close(conn);
		
		return m;
	
	}

	public Member forgotPass(String memberId, String memberName, String email) {
		Connection conn = getConnection();
		
		Member m = dao.forgotPass(conn, memberId, memberName, email);
		
		close(conn);
		
		return m;
	
	}
}
