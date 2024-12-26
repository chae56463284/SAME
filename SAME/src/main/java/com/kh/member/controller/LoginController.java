package com.kh.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.kh.member.model.service.memberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/member/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 1. 클라이언트로부터 데이터 가져오기
        String memberId = request.getParameter("memberId");
        String memberPwd = request.getParameter("memberPwd");

        // 2. 서비스 호출
        memberService service = new memberService();
        Member m = service.login(memberId, memberPwd);

        // 3. 로그인 결과 처리
        if (m == null) { // 로그인 실패
            request.setAttribute("errorMsg", "로그인 실패! ID, 비밀번호 또는 회원 유형을 확인하세요.");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        } else { // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", m);

            String memberNo = m.getMemberNo();
            char firstChar = memberNo.charAt(0);

            response.sendRedirect(request.getContextPath() + "/");
        }
 
    }
    
}

