<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	for(int i=0; i<num; i++){
		out.write(i+"<br>");
	}
%>