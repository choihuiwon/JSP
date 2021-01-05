<%@page import="dto.BoardDto"%>
<%-- <%@page import="vo.BoardVo"%> --%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/template/header.jsp" flush="false"/>
	<div id="main">
		Board List
		<%
		// 리스트 받아오기
		//ArrayList<BoardDto> list = MemberService.getInstance().getBoardVoList();
		
		// 로그아웃 상태일때 글쓰기 버튼 보이지 않음
		if(session.getAttribute("login") != null && (boolean)session.getAttribute("login")){
		%>
		<div align="right">
			<input type="button" value="글쓰기" onclick="location.href='<%=request.getContextPath() %>/board/board_write_view.jsp'">
			<%-- <a href="<%=request.getContextPath() %>/board/board_write_view.jsp">글쓰기</a> --%>
		</div>
		<%}%>
		
		<div id="content">
			
		</div>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>