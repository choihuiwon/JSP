<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/error.jsp" %>
<% 
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	MemberService.getInstance().updatePass(id,pass);
	
	request.getRequestDispatcher(request.getContextPath()+"/member/login.jsp").forward(request, response);
%>