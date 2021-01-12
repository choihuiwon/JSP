package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");	// 화면에 출력시 문자코드 및 내용 형식을 설정
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append(request.getParameter("id"));
		
		// 세션
		HttpSession session = request.getSession();	// request에서 세션 정보를 읽어옴
		session.setAttribute("text", "session message");
		
		// 페이지 이동
		//response.sendRedirect("login_result.jsp");	// request 영역(사용자 요청사항)이 다 삭제됨, 사용자 응답 다시 받지 않을때 사용
		
		request.setAttribute("id", request.getParameter("id"));
		request.getRequestDispatcher("result/login_result.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");	// 한글 깨짐 방지 (데이터를 받았을 때 문자코드 변경)
		doGet(request, response);
	}

}
