<%@page import="dto.BoardDto"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/error.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto(title,writer,content);
	
	
	BoardDto dto2 = BoardService.getInstance().insertBoardDto(dto);

	response.sendRedirect(request.getContextPath()+"/board/board_view.jsp?"+dto2.getBno());
	
%>