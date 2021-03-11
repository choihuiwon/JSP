<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVo"%>
<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String grade = request.getParameter("grade").toUpperCase();
	
	MemberVo vo = new MemberVo(id, null, name, age, grade);
	
	if(MemberService.getInstance().modifyManageMemberVo(vo))
		out.write("true");
	else
		out.write("false");
	
	
%>