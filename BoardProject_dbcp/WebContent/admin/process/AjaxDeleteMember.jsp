<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVo"%>
<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	
	if(MemberService.getInstance().deleteManageMemberVo(id))
		out.write("true");
	else
		out.write("false");
	
	
%>