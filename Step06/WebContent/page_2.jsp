<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=pageContext.getAttribute("num") %><br>
	<%=pageContext.getAttribute("test") %><br>
	<a href="page_1.jsp">첫번째 페이지로 이동</a>
</body>
</html>