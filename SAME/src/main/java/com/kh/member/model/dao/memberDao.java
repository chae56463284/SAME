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
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.kh.board.model.vo.Category;
import com.kh.member.model.vo.ClassVo;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Transaction;
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
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memberId);
	        pstmt.setString(2, memberPwd);

	        rset = pstmt.executeQuery();

	        if (rset.next()) {
	            m = Member.builder()
	                    .memberNo(rset.getString("MEMBER_NO"))
	                    .memberId(rset.getString("MEMBER_ID"))
	                    .memberPwd(rset.getString("MEMBER_PWD"))
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
				m = Member.builder().memberNo(rset.getString("MEMBER_NO")).memberId(rset.getString("MEMBER_ID"))
						.memberName(rset.getString("MEMBER_NAME")).phone(rset.getInt("PHONE"))
						.memberSSN(rset.getString("MEMBER_SSN")).email(rset.getString("EMAIL"))
						.isQuit(rset.getString("IS_QUIT")).socialCode(rset.getString("SOCIAL_CODE"))
						.memberType(rset.getString("MEMBERTYPE")).build();
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

	public boolean quitMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		boolean success = false;
		
		String sql = prop.getProperty("quitMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			
			int result = pstmt.executeUpdate();
			success = result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return success;
	}

	public boolean myPageModify(Connection conn, Member member) {
	    boolean update = false;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("myPageModify");
	
		try {
		        pstmt = conn.prepareStatement(sql);

        		pstmt.setString(1, member.getMemberPwd());
        		pstmt.setInt(2, member.getPhone());
        		pstmt.setString(3, member.getEmail());
        		pstmt.setString(4, member.getAddress());
        		pstmt.setString(5, member.getMemberId());

        		int result = pstmt.executeUpdate();
        		update = (result > 0);

				System.out.println("Update result: " + result);

		    } catch (SQLException e) {
		        e.printStackTrace();
		        System.out.println("SQL Error: " + e.getMessage());  // SQL 에러 로깅
		    }finally {
        		close(pstmt);
    	}
    		return update;
	}

	 public List<Member> myPage(Connection conn) {
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 List<Member> list = new ArrayList<>();
		 String sql = prop.getProperty("myPage");
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
	        while (rset.next()) {
	            Member member = Member.builder()
	                    .memberNo(rset.getString("MEMBER_NO"))
	                    .memberId(rset.getString("MEMBER_ID"))
	                    .memberPwd(rset.getString("MEMBER_PWD"))
	                    .memberName(rset.getString("MEMBER_NAME"))
	                    .phone(rset.getInt("PHONE"))
	                    .memberSSN(rset.getString("MEMBER_SSN"))
	                    .email(rset.getString("EMAIL"))
	                    .address(rset.getString("ADDRESS"))
	                    .memberType(rset.getString("MEMBER_TYPE"))
	                    .build();
	            list.add(member);
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	        close(rset);
	        close(pstmt);
	    }
	    return list;
	}
	public Member getMemberInfo(Connection conn, String memberId) {
	    Member m = null;
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    String sql = prop.getProperty("getMemberInfo");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memberId);
	        rset = pstmt.executeQuery();

	        if(rset.next()) {
	            m = Member.builder()
	                    .memberId(rset.getString("MEMBER_ID"))
	                    .memberName(rset.getString("MEMBER_NAME"))
	                    .email(rset.getString("EMAIL"))
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

// Transaction 메소드 제거하고 transactionDetail만 유지
	public List<Transaction> transactionDetail(Connection conn, String mentorNo, 
        String startDate, String endDate, String status, String menteeName) {
    	PreparedStatement pstmt = null;
    	ResultSet rset = null;
    	List<Transaction> list = new ArrayList<>();
    	String sql = prop.getProperty("Transaction");

    	try {
    	    pstmt = conn.prepareStatement(sql);
	
    	    // 멘토 번호 설정
    	    pstmt.setString(1, mentorNo);
	
    	    // 날짜 관련 파라미터
    	    pstmt.setString(2, startDate);  // IS NULL 체크용
    	    pstmt.setString(3, startDate);  // BETWEEN 시작일
    	    pstmt.setString(4, endDate);    // BETWEEN 종료일
	
    	    // 상태 관련 파라미터
    	    pstmt.setString(5, status);     // 'all' 체크용
    	    pstmt.setString(6, status);     // 실제 상태값
	
    	    // 멘티명 관련 파라미터
    	    pstmt.setString(7, menteeName); // IS NULL 체크용
    	    pstmt.setString(8, "%" + menteeName + "%"); // LIKE 검색용
	
    	    rset = pstmt.executeQuery();
	
    	    while(rset.next()) {
    	        Transaction detail = Transaction.builder()
    	            .tdNo(rset.getInt("TD_NO"))
    	            .enrollNo(rset.getInt("ENROLL_NO"))
    	            .classCode(rset.getString("CLASS_CODE"))
    	            .mentorNo(rset.getString("MENTOR_NO"))
    	            .menteeNo(rset.getString("MENTEE_NO"))
    	            .categoryName(rset.getString("CATEGORY_NAME"))
    	            .tdDate(rset.getString("TD_DATE"))
    	            .method(rset.getString("METHOD"))
    	            .amount(rset.getInt("AMOUNT"))
    	            .status(rset.getString("STATUS"))
    	            .className(rset.getString("CLASS_NAME"))
    	            .menteeName(rset.getString("MEMBER_NAME"))
    	            .startDate(rset.getString("START_DATE"))
    	            .endDate(rset.getString("END_DATE"))
    	            .build();
	
    	        list.add(detail);
    	    }
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	} finally {
    	    close(rset);
    	    close(pstmt);
    	}
    	return list;
	}

	public List<Category> CategoryList(Connection conn, String categoryType) {
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    List<Category> list = new ArrayList<>();
	
	    String sql = prop.getProperty("CategoryList");
	
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, categoryType);
	
	        rset = pstmt.executeQuery();
	
	        while(rset.next()) {
	            Category category = Category.builder()
	                .categoryName(rset.getString("CATEGORY_NAME"))
	                .categoryType(rset.getString("CATEGORY_TYPE"))
	                .build();
	
	            list.add(category);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    return list;
	}

	public int insertClass(Connection conn, ClassVo classInfo) {
	    PreparedStatement pstmt = null;
	    int result = 0;
	
	    String sql = prop.getProperty("insertClass");
	
	    try {
	        pstmt = conn.prepareStatement(sql);
	
	        pstmt.setString(1, classInfo.getMentorNo());
	        pstmt.setString(2, classInfo.getClassTitle());
	        pstmt.setString(3, classInfo.getCategory());
	        pstmt.setString(4, classInfo.getRegion());
	        pstmt.setString(5, classInfo.getStartDate());
	        pstmt.setString(6, classInfo.getEndDate());
	        pstmt.setString(7, classInfo.getClassDetail());
	        pstmt.setInt(8, classInfo.getAmount());
	        pstmt.setString(9, classInfo.getStatus());
	
	        result = pstmt.executeUpdate();
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    return result;
	}

	public int insertMentor(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			// RESUME 테이블 삽입
			String insertResume = prop.getProperty("insertResume");
			pstmt = conn.prepareStatement(insertResume);
			pstmt.setString(1, m.getMemberId());
			result = pstmt.executeUpdate();
			
			if (result > 0) {
				// 각 세부 정보 삽입
				result += insertDetailInfo(conn, "RESUME_REGION", "REGION_NAME", m.getRegionName());
				result += insertDetailInfo(conn, "RESUME_CLASS", "CLASS_NAME", m.getClassName());
				result += insertDetailInfo(conn, "RESUME_EDUCATION", "EDUCATION", m.getEducation());
				result += insertDetailInfo(conn, "RESUME_CAREER", "CAREER", m.getCareer());
				result += insertDetailInfo(conn, "RESUME_LICENSE", "LICENSE", m.getLicense());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result > 5 ? 1 : 0; // 모든 삽입이 성공하면 1 반환
	}

	private int insertDetailInfo(Connection conn, String tableName, String columnName, String value) 
			throws SQLException {
		if (value == null || value.isEmpty()) {
			return 1; // 값이 없는 경우도 성공으로 처리
		}
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = String.format("INSERT INTO %s (RESUME_NO, %s) VALUES (?, ?)", 
									 tableName, columnName);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "SEQ_RESUME_NO.CURRVAL");
			pstmt.setString(2, value);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int delete(Connection conn, String memberPwd, String memberNo) {
		int update = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("delete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberNo);
			pstmt.setString(2, memberPwd);
			
			System.out.println("memberNo: " + memberNo);
			System.out.println("memberPwd: " + memberPwd);
			
			update = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return update;
	
	}

	public boolean checkDuplicateId(Connection conn, String memberId) {
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    boolean isDuplicate = false;
	    
	    try {
	        String sql = "SELECT COUNT(*) FROM MEMBER WHERE MEMBER_ID = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, memberId);
	        
	        rset = pstmt.executeQuery();
	        if(rset.next()) {
	            isDuplicate = rset.getInt(1) > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }
	    
	    return isDuplicate;
	}
}
