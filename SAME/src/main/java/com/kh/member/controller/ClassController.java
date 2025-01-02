package com.kh.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.memberService;
import com.kh.board.model.vo.Category;
import com.kh.member.model.vo.ClassVo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ClassController
 */
@WebServlet("/member/class")
public class ClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");
        
        if(loginUser != null) {
        	memberService service = new memberService();
        	// 카테고리 목록 조회
        	List<Category> subjects = service.CategoryList("과목");
        	List<Category> regions = service.CategoryList("지역");
	
        	request.setAttribute("subjects", subjects);
        	request.setAttribute("regions", regions);
        	request.getRequestDispatcher("/views/member/mentorPage/class.jsp")
        	       .forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/member/login");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // 세션에서 로그인 정보 가져오기
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");
        
        if(loginUser != null) {
            // 폼 데이터 받기
            ClassVo classInfo = ClassVo.builder()
                .mentorNo(loginUser.getMemberNo())
                .classTitle(request.getParameter("lecture-name"))
                .category(request.getParameter("category"))
                .region(request.getParameter("region"))
                .startDate(request.getParameter("start-date"))
                .endDate(request.getParameter("end-date"))
                .classDetail(request.getParameter("description"))
                .amount(Integer.parseInt(request.getParameter("price").replaceAll("[^0-9]", "")))
                .status("Y")
                .build();
            
            memberService service = new memberService();
            int result = service.insertClass(classInfo);
            
            if(result > 0) {
                response.sendRedirect(request.getContextPath() + "/member/mentorPage");
            } else {
                request.setAttribute("errorMsg", "강의 등록에 실패했습니다.");
                request.getRequestDispatcher("/views/common/errorPage.jsp")
                       .forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/member/login");
        }
    }

}
