package com.kh.member.controller;

import java.io.IOException;

import com.kh.member.model.service.memberService;
import com.kh.member.model.vo.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class menteeInsert
 */
@WebServlet("/member/insert")
public class insertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String memberSSN = request.getParameter("memberSSN");
		String email = request.getParameter("email");
		
		Member m = Member.builder().memberId(memberId)
									.memberPwd(memberPwd)
									.memberName(memberName)
									.phone(phone)
									.memberSSN(memberSSN)
									.email(email)
									.build();
		
		int result = new memberService().insert(m);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 되었습니다");
			
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("alertMag", "회원가입 실패 다시 시도해주세요");
			response.sendRedirect(request.getContextPath());
		}
	}

}
