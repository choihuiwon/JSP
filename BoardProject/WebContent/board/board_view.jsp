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
		
		<a href="<%=request.getContextPath() %>/board/board_write_view.jsp">글쓰기</a>
	</div>
	<jsp:include page="/template/footer.jsp" flush="false"/>
</body>
</html>