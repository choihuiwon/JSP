<%@page import="vo.MemberVo"%>
<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	// 세션 유지 시간 60*60 : 1시간
	session.setMaxInactiveInterval(60*60);
	
	//회원정보 검색 결과를 받음
	MemberVo vo = MemberService.getInstance().checkLogin(id,pass);
	
	if(vo != null){
		session.setAttribute("login", true);
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
	}else{
		%>
		<script>
			alert("아이디와 비밀번호를 확인하세요.");
			history.back();
		</script>
		<%
		session.setAttribute("login", false);
			
	}
	
%>