package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.MemberVo;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		// 세션 유지 시간 60*60 : 1시간
		HttpSession session = request.getSession();	// request에서 세션 정보를 읽어옴
		session.setMaxInactiveInterval(60*60);
		
		//회원정보 검색 결과를 받음
		MemberVo vo;
		try {
			vo = MemberService.getInstance().checkLogin(id,pass);
			if(vo != null){
				session.setAttribute("login", true);
				session.setAttribute("id", vo.getId());
				session.setAttribute("name", vo.getName());
				session.setAttribute("grade", vo.getGrade());
				response.sendRedirect("main.jsp");
				
			}else{
				session.setAttribute("login", false);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().append("<script>alert('아이디와 비밀번호를 확인하세요.');history.back();</script>");
			}
		} catch (Exception e) {
			//
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
