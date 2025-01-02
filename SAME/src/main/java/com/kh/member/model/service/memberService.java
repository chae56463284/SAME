package com.kh.member.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.member.model.dao.memberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Transaction;

import static com.kh.common.template.JDBCTemplate.*;

public class memberService {

	static memberDao dao = new memberDao();

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

	public boolean updatePassword(String memberId, String newPassword) {
	    Connection conn = getConnection();
	    boolean result = dao.updatePassword(conn, memberId, newPassword);
	    if (result) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }
	    close(conn);
	    return result;
	}

	public boolean quitMember(String memberId) {
		Connection conn = getConnection();
		boolean success = dao.quitMember(conn, memberId);
		
		if(success) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return success;
	}

    public boolean myPageModify(Member member) {
        Connection conn = getConnection();
        boolean update = dao.myPageModify(conn, member);
        
        if (update) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return update;
    }

	public List<Member> myPage() {
		Connection conn = getConnection();
		
		List<Member> list = dao.myPage(conn);
		
		close(conn);
		
		return list;
	
	}
	public Member getMemberInfo(String memberId) {
	    Connection conn = null;
	    Member memberInfo = null;
	
	    try {
	        conn = getConnection();
	        memberInfo = dao.getMemberInfo(conn, memberId);
	    } finally {
	        close(conn);
	    }
	    return memberInfo;
	}

	public List<Transaction> transactionDetail(String mentorNo, String startDate, String endDate,
	        String status, String menteeName) {
	    Connection conn = getConnection();
	
	    List<Transaction> list = dao.transactionDetail(conn, mentorNo, startDate, endDate, status, menteeName);
	
	    close(conn);
		
	    return list;
	}

}
