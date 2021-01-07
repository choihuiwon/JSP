<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();	// 세션 무력화
	
	// sendRedirect는 세션정보는 그대로 유지, request 정보는 사라짐
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>