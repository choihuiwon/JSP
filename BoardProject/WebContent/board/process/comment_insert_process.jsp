<%@page import="dto.CommentDto"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/error_ajax.jsp" %>
    
<%
if(session.getAttribute("login")==null || !(boolean)session.getAttribute("login")){
	throw new Exception("로그인 후 이용하세요.");
}

	int bno = Integer.parseInt(request.getParameter("bno"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	int result = BoardService.getInstance().insertBoardComment(new CommentDto(bno, content, writer));
	
	out.write(result+"");
%>