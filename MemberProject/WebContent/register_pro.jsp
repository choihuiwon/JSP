<%@page import="service.MemberService"%>
<%@page import="vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>

<% 
	request.setCharacterEncoding("utf-8");	// post방식이면 반드시 인코딩
	String id = (String)request.getParameter("id");
	String passwd = (String)request.getParameter("passwd");
	String name = (String)request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));

	MemberVo vo = new MemberVo(id,passwd,name,age);
	
	MemberService.getInstance().insertMemberVo(vo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	dispatcher.forward(request, response);
	
%>