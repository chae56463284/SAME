package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.memberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyPageModifyController
 */
@WebServlet("/member/modify")
public class MyPageModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 		
    			request.setCharacterEncoding("UTF-8");
    			
    			
    			request.getRequestDispatcher("/views/member/myPageModify.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String memberId = request.getParameter("memberId");
        String memberPwd = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        // Member 객체 생성 및 데이터 설정
        Member updateMember = new Member();
        updateMember.setMemberId(memberId);
        updateMember.setMemberPwd(memberPwd);
        updateMember.setPhone(Integer.parseInt(phone));
        updateMember.setEmail(email);
        updateMember.setAddress(address);

        // Service 호출
        memberService service = new memberService();
        boolean update = service.myPageModify(updateMember);

        if (update) {
            // 세션에 업데이트된 사용자 정보 저장
            request.getSession().setAttribute("loginUser", updateMember);
            response.sendRedirect(request.getContextPath() + "/views/member/mentorPage/main.jsp");
        } else {
            request.setAttribute("errorMsg", "회원정보 수정 실패");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
    }
}