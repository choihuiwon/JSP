<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/error_ajax.jsp" %>
<%
	if(session.getAttribute("login")==null || !(boolean)session.getAttribute("login")){
		throw new Exception("로그인 후 이용하세요.");
	}

	int bno = Integer.parseInt(request.getParameter("bno"));
	int mode = Integer.parseInt(request.getParameter("mode"));
	int result = BoardService.getInstance().adeLikeHate(bno, mode);

	out.write(result+"");	// 문자열로 변환		
%>