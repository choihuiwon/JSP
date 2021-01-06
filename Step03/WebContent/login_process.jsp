<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// 세션 유지 시간 60*60 : 1시간
	session.setMaxInactiveInterval(5);
	
	if(id.equals("admin") && pass.equals("1234")){
		// 로그인 성공 처리
		session.setAttribute("login", true);
		session.setAttribute("name", "관리자");
		session.removeAttribute("msg");
	}else{
		session.setAttribute("login", false);
		session.setAttribute("msg", "로그인에 실패하셨습니다. 아이디 비밀번호 확인하세요");
	}
	
	response.sendRedirect("login.jsp");
%>