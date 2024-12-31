package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.memberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class KakaoController
 */
@WebServlet("/KakaoLogin")
public class KakaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		if(code == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
		}
		
		memberService service = new memberService();
        String accessToken = service.getKakaoAccessToken(code);
		
		if (accessToken != null) {
            Member member = service.getKakaoUserInfo(accessToken);
            if (member != null) {
                request.getSession().setAttribute("loginUser", member);
                response.sendRedirect(request.getContextPath() + "/");
            } else {
                
            }
        } else {
            
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
