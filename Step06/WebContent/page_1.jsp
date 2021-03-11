<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page-1</title>
</head>
<body>
	<%
		pageContext.setAttribute("num", 20);
		pageContext.setAttribute("test", "TEST MESSAGE");
	%>
	
	<%=pageContext.getAttribute("num") %><br>
	<%=pageContext.getAttribute("test") %><br>
	<a href="page_2.jsp">두번째 페이지로 이동</a>
</body>
</html>