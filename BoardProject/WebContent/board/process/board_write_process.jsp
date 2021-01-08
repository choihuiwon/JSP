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
	System.out.println("여기까지는 됨");

	System.out.println(request.getContextPath()+"/board/board_view.jsp?bno="+dto2.getBno());
	response.sendRedirect(request.getContextPath()+"/board/board_view.jsp?bno="+dto2.getBno());
	
%>