package com.kh.member.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mentorInsertController
 */
@WebServlet("/member/insertMentor")
public class mentorInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mentorInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String introduction = request.getParameter("introduction");
		String[] regionNameArr = request.getParameterValues("regionName"); //지역
		String regionName = "";
		if(regionNameArr != null) {
			regionName = String.join(",", regionNameArr);
		}
		
		String[] classNameArr = request.getParameterValues("className");//과목
		String className ="";
		if(classNameArr != null) {
			className = String.join(",", classNameArr);
		}
		
		String[] educationArr = request.getParameterValues("education");//학력
		String education = "";
		if (educationArr != null) {
		    education = String.join(",", educationArr);
		}
		
		String[] careerArr = request.getParameterValues("career");//경력
		String career = "";
		if (careerArr != null) {
		    career = String.join(",", careerArr);
		}
		
		String[] licenseArr = request.getParameterValues("license");//자격증
		String license = "";
		if (licenseArr != null) {
		    license = String.join(",", licenseArr);
		}
		
		
	}

}
