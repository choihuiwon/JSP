<%@page import="service.MemberService"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/error.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 수정할 데이터들
	String id = request.getParameter("id");
	String pass = request.getParameter("passwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	MemberVo vo = new MemberVo(id,pass,name,age);
	MemberService.getInstance().modifyMemberVo(vo);
	
	// 세션 정보 최신화
	session.setAttribute("name", name);
	
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>